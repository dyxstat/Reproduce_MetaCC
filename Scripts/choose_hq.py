#!/usr/bin/env python3
#########choose high quality bins and output to a certain file#########
#input
#-i: input path
#-r: reference of high quality path, csv file without header
#-o: output path

import pandas as pd
import os
import argparse


def main(input_path , mag_index, output_path):
    file_list = pd.read_csv(mag_index , sep = ',' , header=None).values[: , 0]
    for mag in file_list:
        mag = mag + '.fna'
        op = 'cp ' + os.path.join(input_path , mag) + ' ' + output_path
        os.system(op)
        

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-i",help="input_path")
    parser.add_argument("-r",help="ref file")
    parser.add_argument("-o",help="output_path")
    args=parser.parse_args()
    main(args.i, args.r, args.o)
