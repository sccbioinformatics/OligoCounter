#' readOligos
#' Reads in the oligos that need to be found in the fastq files.
#'
#' @name readOligos
#' @docType methods
#' @description  Reads a comma separated file of oligos where the first column is oligo name, and the second the sequeunce.
#' @param file A file containing the oligos
#' @return A data.frame of oligios.
#' @examples
#' oli.ebf <- readOligos("Ebf1_library_oligos.csv")
#' @title Read oligos.
#' @export
#'
readOligos <- function(file){

  oligos <- read.delim(file,sep=",",header=T)
  print(paste(nrow(oligos),"oligos have been read. Congratulations on coming this far."))
  oligos
}
