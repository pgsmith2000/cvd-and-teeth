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

table(BRFSS$CVDINFR5, BRFSS$RMVTETH5)
