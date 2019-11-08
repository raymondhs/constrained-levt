import sys

blocks = open(sys.argv[1]).read().strip().split('\n\n')
for block in blocks:
    lines = block.split('\n')
    result = [lines[0]]
    for k,v in zip(lines[1::2], lines[2::2]):
        result.append(k+'|||'+v)
    print('\t'.join(result))
