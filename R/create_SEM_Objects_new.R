### Create and save SEM objects

# setwd(dirname(normalizePath(sys.frame(1)$ofile))) # Rscript
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # interactive RStudio

source("SNPEffectMatrix.R")

files <- list.files("../SEMs", pattern = ".sem$", full.names = TRUE)
metadata <- read.csv("../metadata/new_sems_metadata.csv")

for (row in 1:nrow(metadata)) {
  sem_filename <- metadata[row, "SEM"]
  sem <- read.table(paste0("../SEMs/", sem_filename))
  
  # SEM formatting
  sem_mat <- sem[-1, -1]
  rownames(sem_mat) <- NULL
  colnames(sem_mat) <- c("A","C","G","T")
  
  tf_name <- metadata[row, "Transcription.factor"]
  ensembl_id <- metadata[row, "ensembl_id"]
  uniprot_ac <- metadata[row, "UniProt.AC"]
  
  baseline <- metadata[row, "baseline"]
  
  pwm_filename <- metadata[row, "pwm_id"]
  
  sem_obj <- new("SNPEffectMatrix", 
                 matrix = sem_mat, 
                 tf_name = tf_name, 
                 ensembl_id = ensembl_id, 
                 uniprot_ac = uniprot_ac, 
                 baseline = baseline, 
                 pwm_filename = pwm_filename)
  
  motif_name <- substr(sem_filename, 1, nchar(sem_filename) - 4)
  saveRDS(sem_obj, file = paste0("../data/", motif_name, ".Rds"))
}
