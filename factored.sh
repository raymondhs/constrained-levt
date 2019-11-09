TEXT=examples/translation/iwslt14.tokenized.de-en
rm -r data-bin/iwslt14.tokenized.de-en
fairseq-preprocess --source-lang de --target-lang en \
    --trainpref $TEXT/train.factor --validpref $TEXT/valid.factor --testpref $TEXT/test.factor \
    --destdir data-bin/iwslt14.tokenized.de-en \
    --workers 20 --factored

rm checkpoints/*

CUDA_VISIBLE_DEVICES=0 fairseq-train \
    data-bin/iwslt14.tokenized.de-en \
    --arch transformer --share-decoder-input-output-embed \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --max-tokens 4096  --load-factors --max-source-factors 8 --encoder-factor-embed-dim 16
