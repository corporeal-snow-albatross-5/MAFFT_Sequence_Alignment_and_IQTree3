# MAFFT_Sequence_Alignment_and_IQTree3
Align .fasta sequences with MAFFT and create ML trees with IQTree3

## Download MAFFT and IQ-Tree
```
1.	Download IQ-Tree3: https://iqtree.github.io/
In order to use this on the command line, we will have to navigate to the folder each time in our terminal

2.	Download Mafft: https://mafft.cbrc.jp/alignment/software/macstandard.html
Once this package is installed, we can call it directly from the command line. 
```

## Run MAFFT to align sequences
```
# Check what directory you are currently in: 
pwd 

# Navigate to the folder with your sequences. On my computer, it is:
Users/sabrinaelkassas/Downloads/Chloe_phylogeny

# Command: 
cd users/sabrinaelkassas/Downloads/Chloe_phylogeny

# General command for mafft: 
mafft --localpair --maxiterate 1000 gene1.fasta > gene1_aligned.fasta

# For the PETase fasta file in this repository: 
mafft --localpair --maxiterate 1000 PETase183_formatted.fasta > PETase183_formatted_aligned.fasta
```

## Run IQTree to make Maximum Likelihood Tree
```
# Navigate to the IQTree folder you downloaded. For me, it is:
Users/sabrinaelkassas/Downloads/iqtree-3.1.3-macOS

# Check that it is working with the following command: 
./bin/iqtree3 -h

# Now run IQTree: 
./bin/iqtree3 \
  -s /Users/sabrinaelkassas/Downloads/Chloe_Phylogeny/PETase183_formatted_aligned.fasta \ #full path necessary here!
  -m MFP \
  -B 1000 \
  -alrt 1000 \
  -T AUTO
```

The .treefile is the one we need to visualize in iTOL, which works better in Safari, not chrome. 
PETase183_formatted_aligned.fasta.treefile

All .treefiles and raw and aligned fasta sequences are in this repository. 
