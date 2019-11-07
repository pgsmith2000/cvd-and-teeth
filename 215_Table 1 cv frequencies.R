# read in data
BRFSS <- read.csv(file="./data/BRFSS.csv", header=TRUE, sep=",")

# subset dataset with only cv people
cv_only <- subset(BRFSS, CVDINFR5 == 0)
table(cv_only$RMVTETH5)
nrow(cv_only)

# use defmacro to define the macro
FreqTbl <-defmacro(OutputTable, InputVar, CSVTable, 
expr={
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0("./data/cv_only/", CSVTable, ".csv"))
})

FreqTbl (teethFreq, cv_only$RMVTETH5, "teeth")
FreqTbl (sexFreq, cv_only$SEX2, "sex")
FreqTbl (hispFreq, cv_only$HISPANIC, "hispanic")
FreqTbl (raceFreq, cv_only$RACEGRP, "race")
FreqTbl (sexFreq, cv_only$AGEG5YR2, "age")
FreqTbl (eduFreq, cv_only$EDGRP, "edu")
FreqTbl (incFreq, cv_only$INCOME3, "inc")
FreqTbl (denvstFreq, cv_only$DENVST4, "denvst")
FreqTbl (diabFreq, cv_only$DIABETE4, "diab")
FreqTbl (smokeFreq, cv_only$SMOKER4, "smoke")
FreqTbl (exFreq, cv_only$EXERANY3, "ex")
FreqTbl (bmiFreq, cv_only$BMICAT, "bmi")

















