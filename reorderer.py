import argparse
from collections import defaultdict
from functools import cmp_to_key


parser = argparse.ArgumentParser(description='Reordering based on alignment.')
parser.add_argument("--input", "-i", required=True, help='src and list of (s, t) constraint tuples')
parser.add_argument("--alignment", "-a", required=True, help='fairseq-interactive output')
args = parser.parse_args()

def get_src_chunks(line):
    sent = line.strip().split('\t')[0]
    dic = line.strip().split('\t')[1:]
    dic = {entry.split('|||')[0]: entry.split('|||')[1] for entry in dic}
    max_len = max([len(w.split()) for w in dic])
    sent = sent.split()
    result = []
    N = len(sent)
    i = 0
    seen = set()
    while i < N:
        tagged = False
        j = min(i+max_len, N)
        while j > i:
            ngram = " ".join(sent[i:j])
            if ngram in dic: # found in src
                result.append((i, j, ngram, dic[ngram]))
                i = j
                tagged = True
                seen.add(ngram)
            if tagged:
                break
            else:
                j -= 1
        if not tagged:
            i += 1
    assert len(seen) == len(dic), (seen, dic)
    return result

def chunk_comparator(chunk1, chunk2):
    aligned1, source1, _ = chunk1
    aligned2, source2, _ = chunk2
    if aligned1 is None or aligned2 is None:
        return source1 - source2
    return aligned1 - aligned2

def reorder(src_line, alignment):
    new_pos = {}
    chunks = get_src_chunks(src_line)
    for i, chunk in enumerate(chunks):
        new_pos[i] = []
        # chunk = (start, end, words)
        # for j in range(chunk[0], chunk[1]):
        #     for l in alignment[j]:
        #         new_pos[i].append(l)
        new_pos[i] = [alignment[chunk[0]][0] if alignment[chunk[0]] else None]
    result = []
    for i in range(len(new_pos)):
        result.append((min(new_pos[i]), i, chunks[i])
                       if new_pos[i] else (None, i, chunks[i]))
    result.sort(key=cmp_to_key(chunk_comparator))
    return [row[2][2]+'|||'+row[2][3] for row in result]


with open(args.alignment) as fin:
    temp = []
    for line in fin:
        if line.startswith('A-'):
            temp.append(line.strip())
    alignment = [defaultdict(list) for _ in range(len(temp))]
    for i, line in enumerate(temp):
        idx, a = line.split('\t')
        idx = int(idx[2:])
        for row in a.split():
            frm, to = row.split('-')
            frm, to = int(frm), int(to)
            alignment[idx][frm].append(to)

with open(args.input) as fin:
    for idx, line in enumerate(fin):
        src = line.strip().split('\t')[0]
        print('\t'.join([src] + reorder(line, alignment[idx])))
