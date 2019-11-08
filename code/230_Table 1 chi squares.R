# read in analytic table
BRFSS <- read.csv(file="./data/BRFSS.csv", header=TRUE, sep=",")

# make table
teethTbl = table(BRFSS$CVDINFR5, BRFSS$RMVTETH5) 

# run test
chisq.test(teethTbl)  

# make macro (using gtools)
ChiTest <- defmacro(VarName, TblName, expr={
TblName = table(BRFSS$CVDINFR5, BRFSS$VarName); 
chisq.test(TblName)})

ChiTest(RMVTETH5, teethTbl)
ChiTest(SEX2, sexTbl)
ChiTest(HISPANIC, hispanicTbl)
ChiTest(RACEGRP, raceTbl)
ChiTest(AGEG5YR2, ageTbl)
ChiTest(EDGRP, eduTbl)
ChiTest(INCOME3, EdTbl)
ChiTest(DENVST4, denvstTbl)
ChiTest(DIABETE4, diabTbl)
ChiTest(SMOKER4, smokeTbl)
ChiTest(EXERANY3, exerTbl)
ChiTest(BMICAT, bmiTbl)
