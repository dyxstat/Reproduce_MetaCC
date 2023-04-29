from __future__ import print_function
import argparse
import csv
import gzip
import os


def main(fastafile,resultfile,outputdir):
    # read fasta file
    print("Processing file:\t{}".format(fastafile))
    sequences={}
    if fastafile.endswith("gz"):
        with gzip.open(fastafile,'r') as f:
            for line in f:
                line=str(line,encoding="utf-8")
                if line.startswith(">"):
                    if " " in line:
                        seq,others=line.split(' ', 1)
                        sequences[seq] = ""
                    else :
                        seq=line.rstrip("\n")
                        sequences[seq] = ""
                else:
                    sequences[seq] += line.rstrip("\n")
    else:
        with open(fastafile,'r') as f:
            for line in f:
                if line.startswith(">"):
                    if " " in line:
                        seq,others=line.split(' ', 1)
                        sequences[seq] = ""
                    else :
                        seq=line.rstrip("\n")
                        sequences[seq] = ""
                else:
                    sequences[seq] += line.rstrip("\n")
    print("Reading Map:\t{}".format(resultfile))
    dic={}
    with open(resultfile,"r") as f:
        for line in f:
            contig_name,cluster_name=line.strip().split('\t')
            try:
                dic[cluster_name].append(contig_name)
            except:
                dic[cluster_name]=[]
                dic[cluster_name].append(contig_name)
    print("Writing bins:\t{}".format(outputdir))
    if not os.path.exists(outputdir):
        os.makedirs(outputdir)
    
    bin_name=0
    for _,cluster in dic.items():
        if bin_name < 10:
            bin = 'BIN'+ '000' + str(bin_name) + '.fa'
        elif bin_name >= 10 & bin_name < 100:
            bin = 'BIN'+ '00' + str(bin_name) + '.fa'
        elif bin_name >= 100 & bin_name < 1000:
            bin = 'BIN'+ '0' + str(bin_name) + '.fa'
        else:
            bin = 'BIN'+str(bin_name) + '.fa'
        binfile=os.path.join(outputdir,"{}".format(bin))
        with open(binfile,"w") as f:
            for contig_name in cluster:
                contig_name=">"+contig_name
                try:
                    sequence=sequences[contig_name]
                except:
                    continue
                f.write(contig_name+"\n")
                f.write(sequence+"\n")
        bin_name+=1


    
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-p",help="original fasta file")
    parser.add_argument("-r",help="tsv version result file")
    parser.add_argument("-o",help="output dir")
    args=parser.parse_args()
    main(args.p,args.r,args.o)
