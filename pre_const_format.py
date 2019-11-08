import sys

text = open(sys.argv[1]).readlines()
dic = open(sys.argv[2]).readlines()
assert len(text) == len(dic)

for line, row in zip(text, dic):
    line = line.strip()
    row = row.strip().split('\t')[2:]
    print("\n".join([line] + row))
    print()
