TEXT=wmt17_en_de_distill_base_chuntinz
cat $TEXT/test.en-de.en \
| fairseq-interactive \
    data-bin/wmt14_en_de_distill \
    --task translation_lev \
    --path checkpoints/levenshtein_transformer/checkpoint_best.pt \
    --iter-decode-max-iter 9 \
    --iter-decode-eos-penalty 0 \
    --beam 1 --remove-bpe \
    --print-step \
    --batch-size 400 --buffer-size 4000 \
| grep ^H \
| sed 's/^H\-//' \
| sort -n -k 1 \
| cut -f 3 \
| sacrebleu --tok none $TEXT/test.de.ori
