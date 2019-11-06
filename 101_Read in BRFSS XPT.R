# read in data to R
BRFSS_a <- read.xport("../large_data_sets/LLCP2018.xpt")
colnames(BRFSS_a)

# find the age variables
colnames(BRFSS_a)[grep("age", tolower(colnames(BRFSS_a)))]

# count the total number of surveys
nrow(BRFSS_a)
