# Instruction of reproducing results in MetaCC paper

Scripts to process the intermediate data and plot figures are available in the folder [Scripts](https://github.com/dyxstat/Reproduce_MetaCC/tree/main/Scripts).

## Process short-read metagenomic Hi-C datasets
We take the wastewater (WW) short-read metaHi-C datasets for example. The other two datasets were processed following the same procedure.


**Version of softwares exploited in the analyses**
```
fastq_dump command from Sratoolkit: v2.10.8

bbduk.sh and clumpify.sh command from BBTools suite: v37.25

megahit command from MEGAHIT: v1.2.9

bwa command from BWA MEM: v0.7.17

samtools command from Samtools: v1.15.1

checkm command from CheckM: v1.1.3
```

**Step 1 Preprocess the raw data**
```

fastq-dump --split-files --gzip SRR8239392.1
fastq-dump --split-files --gzip SRR8239393.1

bbduk.sh  in1=SRR8239392.1_1.fastq.gz in2=SRR8239392.1_2.fastq.gz out1=WWHIC1_AQ.fastq.gz out2=WWHIC2_AQ.fastq.gz 
ref=/home/cmb-05/qbio/yuxuandu/SOFTWARE/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 minlen=50 tpe tbo
bbduk.sh  in1=SRR8239393.1_1.fastq.gz in2=SRR8239393.1_2.fastq.gz out1=WWSG1_AQ.fastq.gz out2=WWSG2_AQ.fastq.gz 
ref=/home/cmb-05/qbio/yuxuandu/SOFTWARE/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 minlen=50 tpe tbo

bbduk.sh  in1=WWHIC1_AQ.fastq.gz in2=WWHIC2_AQ.fastq.gz out1=WWHIC1_CL.fastq.gz out2=WWHIC2_CL.fastq.gz trimq=10 qtrim=r ftm=5 minlen=50
bbduk.sh  in1=WWSG1_AQ.fastq.gz in2=WWSG2_AQ.fastq.gz out1=WWSG1_CL.fastq.gz out2=WWSG2_CL.fastq.gz trimq=10 qtrim=r ftm=5 minlen=50

bbduk.sh in1=WWHIC1_CL.fastq.gz in2=WWHIC2_CL.fastq.gz out1=WWHIC1_trim.fastq.gz out2=WWHIC2_trim.fastq.gz ftl=10

clumpify.sh in1=WWHIC1_trim.fastq.gz in2=WWHIC2_trim.fastq.gz out1=HIC1.fastq.gz out2=HIC2.fastq.gz dedupe
```

**Step 2: Assemble contigs and align processed Hi-C reads to contigs**
```
megahit -1 WWSG1_CL.fastq.gz -2 WWSG2_CL.fastq.gz -o WW_ASSEMBLY --min-contig-len 1000 --k-min 21 --k-max 141 --k-step 12 --merge-level 20,0.95

bwa index final.contigs.fa
bwa mem -5SP final.contigs.fa HIC1.fastq.gz HIC2.fastq.gz > WW_MAP.sam
samtools view -F 0x904 -bS WW_MAP.sam > WW_MAP_UNSORTED.bam
samtools sort -n WW_MAP_UNSORTED.bam -o WW_MAP_SORTED.bam
```

**Step3: Run NormCC normalization module**
```
python ./MetaCC.py norm -v final.contigs.fa WW_MAP_SORTED.bam out_WW
```

**Step4: Run MetaCC binning module**
```
python ./MetaCC.py bin --cover -v final.contigs.fa out_WW
```

**Step5: Evaluation draft genomes using CheckM**
```
checkm lineage_wf -t 60 -x fa out_WW/BIN out_checkm_WW
```

## Process long-read metagenomic Hi-C datasets
We take the cow rumen long-read metaHi-C datasets for example. The sheep gut dataset was processed following the same procedure.


**Version of softwares exploited in the analyses**
```
fastq_dump command from Sratoolkit: v2.10.8

bbduk.sh and clumpify.sh command from BBTools suite: v37.25

bwa command from BWA MEM: v0.7.17

samtools command from Samtools: v1.15.1

checkm command from CheckM: v1.1.3
```

**Step 1 Preprocess the raw data**
```

fastq-dump --split-files --gzip SRR8266636.1
fastq-dump --split-files --gzip SRR8266641.1

bbduk.sh  in1=SRR8266636.1_1.fastq.gz in2=SRR8266636.1_2.fastq.gz out1=S3HIC1_AQ.fastq.gz out2=S3HIC2_AQ.fastq.gz ref=/home1/yuxuandu/cmb/SOFTWARE/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 minlen=50 tpe tbo
bbduk.sh  in1=SRR8266641.1_1.fastq.gz in2=SRR8266641.1_2.fastq.gz out1=M1HIC1_AQ.fastq.gz out2=M1HIC2_AQ.fastq.gz ref=/home1/yuxuandu/cmb/SOFTWARE/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 minlen=50 tpe tbo

bbduk.sh  in1=S3HIC1_AQ.fastq.gz in2=S3HIC2_AQ.fastq.gz out1=S3HIC1_CL.fastq.gz out2=S3HIC2_CL.fastq.gz trimq=10 qtrim=r ftm=5 minlen=50
bbduk.sh  in1=M1HIC1_AQ.fastq.gz in2=M1HIC2_AQ.fastq.gz out1=M1HIC1_CL.fastq.gz out2=M1HIC2_CL.fastq.gz trimq=10 qtrim=r ftm=5 minlen=50

bbduk.sh in1=S3HIC1_CL.fastq.gz in2=S3HIC2_CL.fastq.gz out1=S3HIC1_trim.fastq.gz out2=S3HIC2_trim.fastq.gz ftl=10
bbduk.sh in1=M1HIC1_CL.fastq.gz in2=M1HIC2_CL.fastq.gz out1=M1HIC1_trim.fastq.gz out2=M1HIC2_trim.fastq.gz ftl=10

clumpify.sh in1=S3HIC1_trim.fastq.gz in2=S3HIC2_trim.fastq.gz out1=S3HIC1_dedup.fastq.gz out2=S3HIC2_dedup.fastq.gz dedupe
clumpify.sh in1=M1HIC1_trim.fastq.gz in2=M1HIC2_trim.fastq.gz out1=M1HIC1_dedup.fastq.gz out2=M1HIC2_dedup.fastq.gz dedupe
cat S3HIC1_dedup.fastq.gz M1HIC1_dedup.fastq.gz > HIC1.fastq.gz
cat S3HIC2_dedup.fastq.gz M1HIC2_dedup.fastq.gz > HIC2.fastq.gz
```

**Step 2: Download assembled contigs and align processed Hi-C reads to contigs**
```
# Download assembled contigs (cow.canu.fa) provided by original authors
wget https://figshare.com/ndownloader/files/15596858

bwa index cow.canu.fa
bwa mem -5SP cow.canu.fa HIC1.fastq.gz HIC2.fastq.gz > COW_MAP.sam
samtools view -F 0x904 -bS COW_MAP.sam > COW_MAP_UNSORTED.bam
samtools sort -n COW_MAP_UNSORTED.bam -o COW_MAP_SORTED.bam
```

**Step3: Run NormCC normalization module**
```
python ./MetaCC.py norm -v cow.canu.fa COW_MAP_SORTED.bam out_COW
```

**Step4: Run MetaCC binning module**
```
python ./MetaCC.py bin --cover -v cow.canu.fa out_COW
```

**Step5: Evaluation draft genomes using CheckM**
```
checkm lineage_wf -t 60 -x fa out_COW/BIN out_checkm_COW
```

## Estimating the coverages of assembled contigs

We employed BBMap from the BBTools suite (v37.25) and minimap2 (v2.24) to align short reads and long reads back to contigs, respectively. SAMtools was used to transform the alignment files into bam files, serving as the input for the script ‘[jgi summarize bam contig depths](https://github.com/dyxstat/Reproduce_MetaCC/tree/main/Scripts)’ provided by to calculate the contigs’ coverages.

```
minimap2 -ax map-ont ../INPUT/cow.canu.fa ../INPUT/raw_long_read.fastq.gz > aln.sam
samtools view -@ 29 -bSh aln.sam > aln_unsorted.bam
samtools sort -@ 29 aln_unsorted.bam -o aln_sorted.bam
samtools index aln_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth depth_cow.txt --pairedContigs paired_cow.txt aln_sorted.bam
```

## MAG analyses on long-read metaHi-C datasets
To identify which near-complete bins overlapped each other from MetaCC binning and other Hi-C-based binners, we employed Mash (v2.2)
with 10,000 sketches per bin to calculate the Mash distance between near-complete bins from different bin sets. 
For example, we compute the mash distance between bin sets generated by MetaCC and bin3C:

```
mash sketch -s 10000 -p 60 -l metacc_bin.csv -o metacc_sketch
mash dist ../metacc_sketch.msh -l bin3C_bin.csv -p 60 -t > metaCC2bin3C.txt
```

## Quality control of all metaHi-C datasets
The quality of Hi-C libraries from different metaHi-C datasets was assessed
using qc3C (v0.5) in k-mer mode with default parameters. 

```
qc3C kmer --yes --mean-insert 300 --enzyme MluCI --enzyme Sau3AI --reads ../RAW_DATA/HIC1_dedup.fastq.gz --reads ../RAW_DATA/HIC2_dedup.fastq.gz --output-path out_qc3C_cow -t 60
```

## Plasmid analyses on the sheep gut long-read metaHi-C dataset
We use both PPR-Meta and Platon to detect plasmid contigs from all assembled contigs on the sheep gut long-read metaHi-C dataset.

```
./PPR_Meta flye.v29.sheep_gut.hifi.250g.fasta ppr_result_sheep.csv -t 0.5
# Select all potential plasmid contigs detected by PPR-meta out as a new file 'sheep_plasmid.fa', which is further filtered by platon
platon --db /scratch2/yuxuandu/db sheep_plasmid.fa  -t 60 --output result_platon --mode sensitivity
```
