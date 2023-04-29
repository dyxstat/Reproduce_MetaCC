#!/usr/bin/env python
import sys
import pysam

with pysam.FastxFile(sys.argv[1]) as fh:
    ind = 1
    for r in fh:
        new_name = str(sys.argv[2]) + '_' + str(ind)
        print(">"+new_name)
        print(r.sequence)
        ind += 1
