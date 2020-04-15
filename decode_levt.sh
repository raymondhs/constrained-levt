#!/bin/bash
set -e -x

if [ $# -ne 2 ] && [ $# -ne 3 ] ; then
    echo "usage: $0 task method"
    exit 1
fi

task=$1
method=$2
match=$3

if [ ! $task = "en-de" ] && [ ! $task = "ro-en" ] && [ ! $task = "en-ja" ]; then
    if [ $# -ne 3 ]; then
        echo "specify \"exact\" or \"approx\""
        exit 1
    fi
fi

remove_bpe="bash scripts/remove_bpe.sh" # call remove_spm.sh for ja
postpro="cat" # call kytea for ja
if [ $task = "dinu-wikt" ]; then
    tst=data/en-de/dinu/test.wikt.en.$match
    ref=data/en-de/dinu/test.wikt.de.$match
    data_bin=data-bin/wmt14_en_de_distill
    ckpt=checkpoints/levt_en_de/checkpoint_best.pt
elif [ $task = "dinu-iate" ]; then
    tst=data/en-de/dinu/test.iate.en.$match
    ref=data/en-de/dinu/test.iate.de.$match
    data_bin=data-bin/wmt14_en_de_distill
    ckpt=checkpoints/levt_en_de/checkpoint_best.pt
else
    src=$(echo $task | cut -d- -f1)
    trg=$(echo $task | cut -d- -f2)
    suf=$(echo $task | cut -d- -f3)
    tst=data/$src-$trg/wikt-$suf/test.$src.$match
    ref=data/$src-$trg/wikt-$suf/test.$trg.$match
    if [ $trg = "de" ]; then
        data_bin=data-bin/wmt14_en_de_distill
    elif [ $src = "ro" ]; then
        data_bin=data-bin/wmt16_ro_en_distill
    elif [ $trg = "ja" ]; then
        data_bin=data-bin/wat17_en_ja_distill
        remove_bpe="bash scripts/remove_spm.sh"
        postpro="bash scripts/tokenize_ja.sh"
    else
        echo "unsupported task $task"
        exit 1
    fi
    ckpt=checkpoints/levt_${src}_${trg}/checkpoint_best.pt
fi


call_levt() {
    tstarg=$1
    intarg=$2
    shift 2
    cat $tstarg \
    | fairseq-interactive \
        $data_bin \
        --task translation_lev \
        --path $ckpt \
        --iter-decode-max-iter 9 \
        --iter-decode-eos-penalty 0 \
        --beam 1 \
        --print-step \
        --batch-size 400 --buffer-size 4000 $@ > $intarg
}


call_levt_const() {
    tstarg=$1
    intarg=$2
    shift 2
    cat $tstarg \
    | python interactive_with_constraints.py \
        $data_bin \
        --task translation_lev \
        --path $ckpt \
        --iter-decode-max-iter 9 \
        --iter-decode-eos-penalty 0 \
        --beam 1 \
        --print-step \
        --batch-size 400 --buffer-size 4000 $@ > $intarg
}

out=outputs/$task/$method
if [ ! $task = "en-de" ] && [ ! $task = "ro-en" ] && [ ! $task = "en-ja" ]; then
    out=outputs/$task/$method/$match
fi
mkdir -p $out
int=$out/int.out
if [ $method = "levt" ]; then
    # unconstrained levt baseline
    call_levt $tst $int
elif [ $method = "levt+const" ]; then
    # add suffix .const for constrained input
    call_levt_const $tst.const $int
elif [ $method = "levt+const+nodel" ]; then
    call_levt_const $tst.const $int --preserve-constraint
elif [ $method = "levt+const+nodel+oracle" ]; then
    # TODO: modify later if needed
    python reorder_constraints_oracle.py \
        -i $tst.const -r $ref \
        --remove-bpe > $out/oracle
    call_levt_const $out/oracle $int --preserve-constraint
elif [ $method = "levt+const+nodel+reorder" ]; then
    # TODO: modify later if needed
    call_levt $tst $int.1 --print-alignment
    python reorderer.py -i $tst.const -a $int.1 > $out/reordered
    call_levt_const $out/reordered $int --preserve-constraint
else
    echo "unsupported method $method"
    rm -r $out
    exit 1
fi

cat $int \
| grep ^H \
| sed 's/^H\-//' \
| sort -n -k 1 \
| cut -f 3 > $int.sys

cat $int.sys \
| $remove_bpe \
| $postpro \
| sacrebleu -w 2 --tok none $ref > $out/sacrebleu

if [[ $match ]] && [ $match = "exact" ]; then
    python scripts/term_usage_rate.py \
        -i $tst.const -s $int.sys \
        > $out/term_usage_$match
fi
