# read in analytic table
BRFSS <- read.csv(file="../output/BRFSS.csv", header=TRUE, sep=",")

# The total number of participants
nrow(BRFSS)

# Look at distribution of categorical teeth variable 
TeethFreq <- table(BRFSS$RMVTETH5)
TeethFreq
write.csv(TeethFreq, file = "../output/frequencies/teethFreq.csv")

# look at the % in the teeth categories
TeethFreq/nrow(BRFSS)*100

# Now look at the outcome variable
cvdFreq <- table(BRFSS$CVDINFR5)
cvdFreq

write.csv(cvdFreq, file = "../output/frequencies/cvdFreq.csv")

cvd_teethFreq <- table(BRFSS$CVDINFR5, BRFSS$RMVTETH5)
write.csv(cvd_teethFreq, file = "../output/frequencies/cvd_teethFreq.csv")

table(BRFSS$CVDINFR5, BRFSS$RMVTETH5)

# look at sex
sexFreq <- table(BRFSS$SEX)
write.csv(sexFreq, file = "../output/frequencies/sexFreq.csv")

# race group
table(BRFSS$RACEGRP)
