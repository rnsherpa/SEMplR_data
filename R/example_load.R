setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

foxa1 <- readRDS("../data/FOXA1_HUMAN.HepG2.Rds")

foxa1@matrix

foxa1@tf_name

foxa1@ensembl_id

foxa1@uniprot_ac

foxa1@baseline

foxa1@pwm_filename
