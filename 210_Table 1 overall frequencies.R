# read in data
BRFSS <- read.csv(file="./data/BRFSS.csv", header=TRUE, sep=",")

# Start by making frequencies per category
cvdFreq <- table(BRFSS$CVDINFR5)
cvdFreq
write.csv(cvdFreq, file = "./data/overall/cvdFreq.csv")

# use defmacro to define the macro
FreqTbl <-defmacro(OutputTable, InputVar, CSVTable, 
expr={
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0("./data/overall/", CSVTable, ".csv"))
})

FreqTbl (teethFreq, BRFSS$RMVTETH5, "teeth")
FreqTbl (sexFreq, BRFSS$SEX2, "sex")
FreqTbl (hispFreq, BRFSS$HISPANIC, "hispanic")
FreqTbl (raceFreq, BRFSS$RACEGRP, "race")
FreqTbl (sexFreq, BRFSS$AGEG5YR2, "age")
FreqTbl (eduFreq, BRFSS$EDGRP, "edu")
FreqTbl (incFreq, BRFSS$INCOME3, "inc")
FreqTbl (denvstFreq, BRFSS$DENVST4, "denvst")
FreqTbl (diabFreq, BRFSS$DIABETE4, "diab")
FreqTbl (smokeFreq, BRFSS$SMOKER4, "smoke")
FreqTbl (exFreq, BRFSS$EXERANY3, "ex")
FreqTbl (bmiFreq, BRFSS$BMICAT, "bmi")

















