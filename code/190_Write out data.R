# Write out analytic dataset
BRFSS <- BRFSS_f
write.csv(BRFSS, file = "../output/BRFSS.csv", row.names = FALSE)

str(BRFSS)

# Note the number of columns (variables) and rows (records/cases)
nrow(BRFSS)
ncol(BRFSS)

# Show the variable names
colnames(BRFSS)

# create a textfile data dictionary
data_dictionary <- describe(BRFSS)
sink("../output/data_dictionary.txt", append=TRUE)
data_dictionary
sink()
