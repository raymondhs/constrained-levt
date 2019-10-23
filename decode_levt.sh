CUDA_VISIBLE_DEVICES=0 python interactive_with_constraints.py \
    data-bin/wmt14_en_de_distill \
    --task translation_lev \
    --path checkpoints/checkpoint_best.pt \
    --iter-decode-max-iter 9 \
    --iter-decode-eos-penalty 0 \
    --beam 1 --remove-bpe \
    --print-step \
    --batch-size 400 --buffer-size 1000
