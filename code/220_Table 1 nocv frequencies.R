# read in data
BRFSS <- read.csv(file="../output/BRFSS.csv", header=TRUE, sep=",")

# subset dataset with only cv people
nocv_only <- subset(BRFSS, CVDINFR5 == 1)
table(nocv_only$RMVTETH5)
nrow(nocv_only)

# use defmacro to define the macro
FreqTbl <-defmacro(OutputTable, InputVar, CSVTable, 
expr={
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0("../output/frequencies/nocv_only/", CSVTable, ".csv"))
})

FreqTbl (teethFreq, nocv_only$RMVTETH5, "teeth")
FreqTbl (sexFreq, nocv_only$SEX2, "sex")
FreqTbl (hispFreq, nocv_only$HISPANIC, "hispanic")
FreqTbl (raceFreq, nocv_only$RACEGRP, "race")
FreqTbl (ageFreq, nocv_only$AGEG5YR2, "age")
FreqTbl (eduFreq, nocv_only$EDGRP, "edu")
FreqTbl (incFreq, nocv_only$INCOME3, "inc")
FreqTbl (denvstFreq, nocv_only$DENVST4, "denvst")
FreqTbl (diabFreq, nocv_only$DIABETE4, "diab")
FreqTbl (smokeFreq, nocv_only$SMOKER4, "smoke")
FreqTbl (exFreq, nocv_only$EXERANY3, "ex")
FreqTbl (bmiFreq, nocv_only$BMICAT, "bmi")

















