# make a copy of the data set
BRFSS_b <- BRFSS_a

# define object list of variables to be kept
BRFSSVarList <- c("CVDINFR4", # dependent (outcome) variable
                  "RMVTETH4", # independent (exposure) variable
                  "SEX1",     # rest are confounders
                  "X_HISPANC",
                  "X_MRACE1",
                  "X_AGEG5YR",
                  "EDUCA",
                  "INCOME2",
                  "X_DENVST3",
                  "DIABETE3",
                  "X_SMOKER3",
                  "EXERANY2",
                  "X_BMI5CAT")

# subset by varlist
BRFSS_b <- BRFSS_b[BRFSSVarList]

# check columns
colnames(BRFSS_b)

# check rows
nrow(BRFSS_b)
