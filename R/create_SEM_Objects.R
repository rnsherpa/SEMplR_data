### Create and save SEM objects

# setwd(dirname(normalizePath(sys.frame(1)$ofile))) # Rscript
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # interactive RStudio

source("SNPEffectMatrix.R")

baselines <- read.table("../SEMs/BASELINE/SEMs_baseline_norm.txt", col.names = c("motif", "baseline"))

files <- list.files("../SEMs", pattern = ".sem$", full.names = TRUE)
for (file in files) {
  sem <- read.table(file)
  
  # SEM formatting
  sem_mat <- sem[-1, -1]
  rownames(sem_mat) <- NULL
  colnames(sem_mat) <- c("A","C","G","T")
  
  sem_filename <- basename(file)
  tf_name <- sem[1, 1]
  motif <- substr(sem_filename, 1, nchar(sem_filename) - 4)
  pwm_filename <- paste0(motif,".pwm")
  
  baseline <- baselines[which(baselines$motif == motif), "baseline"]
  
  sem_obj <- new("SNPEffectMatrix", matrix = sem_mat, tf_name = tf_name, baseline = baseline, pwm_filename = pwm_filename)
  
  saveRDS(sem_obj, file = paste0("../data/", motif, ".Rds"))
}
