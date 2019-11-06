# read in analytic table
BRFSS <- read.csv(file="./data/BRFSS.csv", header=TRUE, sep=",")

# The total number of participants
nrow(BRFSS)

# Look at distribution of categorical teeth variable 
TeethFreq <- table(BRFSS$RMVTETH5)
TeethFreq
write.csv(TeethFreq, file = "./data/teethFreq.csv")

# look at the % in the teeth categories
TeethFreq/nrow(BRFSS)*100

# Now look at the outcome variable
cvdFreq <- table(BRFSS$CVDINFR5)
cvdFreq

write.csv(cvdFreq, file = "./data/cvdFreq.csv")

cvd_teethFreq <- table(BRFSS$CVDINFR5, BRFSS$RMVTETH5)
write.csv(cvd_teethFreq, file = "./data/cvd_teethFreq.csv")

table(BRFSS$CVDINFR5, BRFSS$RMVTETH5)

# look at sex
sexFreq <- table(BRFSS$SEX)
write.csv(sexFreq, file = "./data/sexFreq.csv")

# race group
table(BRFSS$RACEGRP)
