# Write out analytic dataset
BRFSS <- BRFSS_p
write.csv(BRFSS, file = "./data/BRFSS.csv", row.names = FALSE)

# Note the number of columns (variables) and rows (records/cases)
nrow(BRFSS)
ncol(BRFSS)

# Show the variable names
colnames(BRFSS)

# create a textfile data dictionary
data_dictionary <- describe(BRFSS)
sink("./documentation/data_dictionary.txt", append=TRUE)
data_dictionary
sink()
