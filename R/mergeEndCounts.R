#' mergeEndCounts
#' Merge the counts from R1 and R2 and F and R oligos
#'
#' @name readFastqFileNames
#' @docType methods
#' @description  Takes the output from countOligos and merges the R1 and R2 reads
#' @param counts A table from the output of countOligos
#' @return A table of merged counts.
#' @examples
#' mergedOligoCounts <- mergeEndCounts(oligo.counts)
#' @title Merge counts
#' @export
#'
mergeEndCounts <- function(counts){
  mcounts <- counts[seq(1,nrow(counts),by=2),seq(1,ncol(counts),by=2)]+counts[seq(2,nrow(counts),by=2), seq(2,ncol(counts),by=2) ]
  mcounts
}
