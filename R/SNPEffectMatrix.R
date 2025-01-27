#' SNP Effect Matrix (SEM)
#' https://doi.org/10.1093/bioinformatics/btz612
#' A SNP Effect Matrix (SEM) estimates the binding affinity of every possible mutation in a particular transcription factor (TF) binding motif
#' This class contains three slots: the matrix, the baseline value, and metadata, which contains the TF name and 
#' @slot matrix The SEM itself as a data frame. Rows represent sequence position (variable length), columns represent effects due to each nucleotide base A, C, G, T (fixed length: 4)
#' @slot baseline A scrambled baseline, representing the binding score of randomly scrambled kmers of the same length. This is the binding cutoff for a TF
#' @slot tf_name HGNC name of the TF relevant to the SEM 
#' @slot ensembl_id ENSEMBL ID of TF gene
#' @slot uniprot_ac UniProt accession of TF protein
#' @slot pwm_filename Name of the original PWM file used to generate the SEM
#' 
setClass(
  Class = "SNPEffectMatrix",
  slots = c(
    matrix = "data.frame",
    tf_name = "character",
    ensembl_id = "character",
    uniprot_ac = "character",
    baseline = "numeric",
    pwm_filename = "character"
  )
)
