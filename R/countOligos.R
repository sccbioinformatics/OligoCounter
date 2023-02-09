#' countOligos
#' Counts up each oligo in each set of R1/R2 fastq files.
#'
#' @name countOligos
#' @docType methods
#' @description Reads in each set of fastq files and counts oligos within
#' @param oligos A data.frame of oligos from readOligos
#' @param fastq.names A list of R1 and R2 reads from readFastqFileNames
#' @return A matrix of counts for each oligo (row) and fastq file (column)
#' @examples
#' oligo.counts <- countOligos(oligos,fq.files)
#' @title Count oligos in each set of fastq files.
#' @export
#'
countOligos  <- function(oligos,fastq.names){

  final.counts <- NULL

  #pb <- progress_bar$new(format = "[:bar] :current/:total (:percent)",total = length(fastq.names$R1))
  pb <- progress_bar$new(format = "[:bar] :current of :total fastq sets (:percent)",total = length(fastq.names$R1))
  pb$tick(0)
  #Sys.sleep(1)

  for(k in 1:length(fastq.names$R1)){

    #print(k)


    r1 <- ShortRead::readFastq(fastq.names$path,fastq.names$R1[k])
    r2 <- ShortRead::readFastq(fastq.names$path,fastq.names$R2[k])

    lst.r1 <- list()
    lst.r2 <- list()

    for(i in 1:nrow(oligos)){
      #print(i)
      lst.r1[[i]] <- table(grepl(  toupper(oligos[i,2]) ,ShortRead::sread(r1)))
      lst.r2[[i]] <- table(grepl(  toupper(oligos[i,2]) ,ShortRead::sread(r2)))
    }

    r1.count <- rep(0,nrow(oligos))
    r2.count <- rep(0,nrow(oligos))

    for(i in 1:nrow(oligos)){
      r1.count[i] <- as.vector(lst.r1[[i]][2])
      r2.count[i] <- as.vector(lst.r2[[i]][2])
    }

    r1.count[which(is.na(r1.count)==T)] <- 0
    r2.count[which(is.na(r2.count)==T)] <- 0

    r1.cmat <- as.matrix(r1.count,ncol=1)
    r2.cmat <- as.matrix(r2.count,ncol=1)

    rownames(r1.cmat) <- oligos[,1]
    rownames(r2.cmat) <- oligos[,1]

    all.counts <- cbind(r1.cmat,r2.cmat)
    colnames(all.counts) <- c(fastq.names$R1[k],fastq.names$R2[k])

    final.counts <- cbind(final.counts,all.counts)


    pb$tick(1)

  }

  final.counts

}
