## Welcome to OligoCounter!

To install OligoCounter:

install.packages("devtools")

devtools::install_github("sccbioinformatics/OligoCounter")

To use it:

library(OligoCounter)

Read oligos:

oligos <- readOligos("My_oligos.csv")

Read fastqnames:

fq.files <- readFastqFileNames(path=".",pattern="fastq")

Count the oligos:

oligo.counts <- countOligos(oligos,fq.files)

Merge R1 and R2 counts:

mergedOligoCounts <- mergeEndCounts(oligo.counts)
