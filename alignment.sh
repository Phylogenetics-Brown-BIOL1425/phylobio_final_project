#!/bin/bash

module load mafft

mafft data/gpt.fasta > alignments/gpt.align.fasta
mafft data/gpt.protein.fasta > alignments/gpt.protein.align.fasta
mafft data/gpt2.fasta > alignments/gpt2.align.fasta
mafft data/gpt2.protein.fasta > alignments/gpt2.protein.align.fasta
mafft data/mRNA.all.fasta > alignments/mRNA.all.align.fasta
mafft data/protein.all.fasta > alignments/protein.all.align.fasta

