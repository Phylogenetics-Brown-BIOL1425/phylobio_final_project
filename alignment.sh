#!/bin/bash

module load mafft

mafft data/gpt.fasta > alignments/gpt.align.fasta
mafft data/gpt_protein.fasta > alignments/gpt_protein.align.fasta
mafft data/gpt2.fasta > alignments/gpt2.align.fasta
mafft data/gpt_protein.fasta > alignments/gpt2_protein.align.fasta

