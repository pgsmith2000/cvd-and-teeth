# define object list of variables to be kept
BRFSSVarList <- c("CVDINFR4", # dependent variable
                  "RMVTETH4", # key independent variable
                  "X_AGEG5YR",
                  "X_DENVST3",
                  "SEX1",
                  "X_HISPANC",
                  "X_MRACE1",
                  "EDUCA",
                  "INCOME2",
                  "X_SMOKER3",
                  "DIABETE3",
                  "X_BMI5CAT",
                  "EXERANY2")

# subset by varlist
BRFSS_b <- BRFSS_a[BRFSSVarList]

# check columns
colnames(BRFSS_b)

# check rows
nrow(BRFSS_b)



