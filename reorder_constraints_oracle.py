import argparse
import sys

parser = argparse.ArgumentParser()
parser.add_argument('-i','--constraint-input', required=True, help='path to constrained input file')
parser.add_argument('-r','--reference', required=True, help='path to tokenized reference file')
parser.add_argument('--remove-bpe', action='store_true', help='remove bpe for the input file')

args = parser.parse_args()


def remove_bpe(x, bpe_symbol='@@ '):
    return (x + ' ').replace(bpe_symbol, '').rstrip()


nmismatch=0
with open(args.constraint_input) as fin, open(args.reference) as fref:
    for idx, (iline, rline) in enumerate(zip(fin, fref)):
        iline = iline.rstrip()
        rline = rline.rstrip()

        
        pieces = iline.split("\t")
        # if constrained
        sline = pieces[0]
        if len(pieces) >=2 :
            cons = pieces[1:]
            #print(cons)
            
            conposlist = []
            for con in cons:
                con_s = con.split('|||')[0]
                con_t = con.split('|||')[-1]
                if args.remove_bpe:
                    con_t_bpe = remove_bpe(con_t)
                    pos = rline.find(con_t_bpe)
                else:
                    pos = rline.find(con_t)

                conposlist.append((con,pos))
                #if pos == -1 :
                        
                    #print(rline, rline.find(con), con)    
                #assert pos  != -1, "reference at index {} does not contain constraint {}".format(idx, con)
                
            #print(cons, rline)
            #print(conposlist)
            cons_str = "\t".join([k for k,v in sorted(conposlist, key=lambda x: x[1])])
            
            if cons_str != '\t'.join(cons):
                nmismatch += 1
        else:
            cons=""
            continue

        print("{}\t{}".format(sline,cons_str))
        

print("{} mismtach out of {} total".format(nmismatch, idx), file=sys.stderr)


        #print(iline, refline)
