#----------------------------------------
# Install packages if not already installed
#----------------------------------------
install.packages("devtools")
devtools::install_github("tkostas/ViewMQ")

#----------------------------------------
# laod packages
#----------------------------------------
library(viewMQ)

#----------------------------------------
# Check summary.txt file
#----------------------------------------
# load summary.txt file
OSum <- read.delim(file.choose(), header = TRUE,
                   stringsAsFactors = FALSE, sep = "\t", dec = ".")
# check OSum structrue
str(OSum)

# trim OSum removing the empty rows
S1 <- subset(OSum, Experiment != "")

# print the number of experiments in the dataset
experiments(S1)

# plot number of MS1 and MS2 spectra per experiment
MQ_summary_MSvsMSMS(S1)

# plot number of MS/MS spectra matched to peptides
MQ_summary_MS2_id(S1)

# plot percentage of MS/MS spectra matched to peptides
MQ_summary_MSMSid_percent(S1)

# plot percent of isotopic patterned sequenced
MQ_summary_isopatterns_seq_percent(S1)

#----------------------------------------
# Check evidence.txt file
#----------------------------------------
# load evidence.txt file
Ev <- read.delim(file.choose(), header = TRUE,
                 stringsAsFactors = FALSE, sep = "\t", dec = ".")

# check structure and dimmentions of evidence.txt file
str(Ev)
dim(Ev)

# remove reverse hits
E1 <- MQ_remove_reverse(Ev)

# remove contaminant hits
E2 <- MQ_remove_contaminants(E1)

# plot peptide intensity distribution
MQ_evidence_intensity_boxplot(E2)
MQ_evidence_pept_int(E2)

# plot peptide ppm error
MQ_evidence_ppm_error_boxplot(E2)
MQ_evidence_ppm_error(E2)

# plot number of missed cleavages as a total
MQ_evidence_missed_cleavages(E2)
MQ_evidence_missed_cleavages(E2, per_sample = TRUE, ncol = 5)

# plot peptide charge state
MQ_evidence_charge_state(E2)
MQ_evidence_charge_state(E2, per_sample = TRUE, ncol = 5)

# plot peptide modifications
MQ_evidence_modifications(E2)
MQ_evidence_modifications(E2, log_scale = FALSE)

# plot Andromeda score
MQ_evidence_Andromeda_score(E2)

# plot retention time length
MQ_evidence_RT(E2, xlim = c(0, 140))
MQ_evidence_RT_length(E2, xlim = c(0, 3))
