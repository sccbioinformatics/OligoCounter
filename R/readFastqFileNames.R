#' readFastqFileNames
#' Reads in the names of the fastq files which need to be scanned
#'
#' @name readFastqFileNames
#' @docType methods
#' @description  Reads in just the file names of the fastq files needing scanning.
#' @param path Path to the folder in which to look for fastq files. Default is current working folder.
#' @param pattern A pattern in the file names common to all.
#' @return A list containing vectors of R1 and R2 reads
#' @examples
#' fq.files <- readFastqFileNames(path="."pattern="fastq")
#' @title Read fastq file names
#' @export
#'
readFastqFileNames <- function(path=".",pattern){

  fls <- list.files(path=".",pattern="fastq")

  r1.fq <- fls[seq(1,length(fls),by=2)]
  r2.fq <- fls[seq(2,length(fls),by=2)]

  fq.names <- list(path=path,R1=r1.fq,R2=r2.fq)

  print(paste(length(r1.fq),"sets of fastq files read. You're killing it, keep going...."))

  fq.names
}

