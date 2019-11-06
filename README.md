Missing Teeth and Heart Disease Revisited: BRFSS 2018
================
Paul G. Smith
First created on Nov 5, 2019. Updated on Nov 06, 2019

## Missing Teeth and Heart Disease Revisited: BRFSS 2018

### Load Dependencies and Read in BRFSS 2018 Data Set

### Data Preperation and Reduction

``` r
source("100_Dependencies.R", echo = TRUE)
```

    ## 
    ## > library(foreign)
    ## 
    ## > library(Hmisc)

    ## Loading required package: lattice

    ## Loading required package: survival

    ## Loading required package: Formula

    ## Loading required package: ggplot2

    ## 
    ## Attaching package: 'Hmisc'

    ## The following objects are masked from 'package:base':
    ## 
    ##     format.pval, units

    ## 
    ## > library(e1071)

    ## 
    ## Attaching package: 'e1071'

    ## The following object is masked from 'package:Hmisc':
    ## 
    ##     impute

``` r
source("105_Read in BRFSS XPT.R", echo = TRUE)
```

    ## 
    ## > BRFSS_a <- read.xport("../large_data_sets/LLCP2018.xpt")
    ## 
    ## > colnames(BRFSS_a)
    ##   [1] "X_STATE"   "FMONTH"    "IDATE"     "IMONTH"    "IDAY"     
    ##   [6] "IYEAR"     "DISPCODE"  "SEQNO"     "X_PSU"     "CTELENM1" 
    ##  [11] "PVTRESD1"  "COLGHOUS"  "STATERE1"  "CELLFON4"  "LADULT"   
    ##  [16] "NUMADULT"  "NUMMEN"    "NUMWOMEN"  "SAFETIME"  "CTELNUM1" 
    ##  [21] "CELLFON5"  "CADULT"    "PVTRESD3"  "CCLGHOUS"  "CSTATE1"  
    ##  [26] "LANDLINE"  "HHADULT"   "GENHLTH"   "PHYSHLTH"  "MENTHLTH" 
    ##  [31] "POORHLTH"  "HLTHPLN1"  "PERSDOC2"  "MEDCOST"   "CHECKUP1" 
    ##  [36] "EXERANY2"  "SLEPTIM1"  "CVDINFR4"  "CVDCRHD4"  "CVDSTRK3" 
    ##  [41] "ASTHMA3"   "ASTHNOW"   "CHCSCNCR"  "CHCOCNCR"  "CHCCOPD1" 
    ##  [46] "HAVARTH3"  "ADDEPEV2"  "CHCKDNY1"  "DIABETE3"  "DIABAGE2" 
    ##  [51] "LASTDEN4"  "RMVTETH4"  "SEX1"      "MARITAL"   "EDUCA"    
    ##  [56] "RENTHOM1"  "NUMHHOL3"  "NUMPHON3"  "CPDEMO1B"  "VETERAN3" 
    ##  [61] "EMPLOY1"   "CHILDREN"  "INCOME2"   "WEIGHT2"   "HEIGHT3"  
    ##  [66] "PREGNANT"  "DEAF"      "BLIND"     "DECIDE"    "DIFFWALK" 
    ##  [71] "DIFFDRES"  "DIFFALON"  "SMOKE100"  "SMOKDAY2"  "STOPSMK2" 
    ##  [76] "LASTSMK2"  "USENOW3"   "ALCDAY5"   "AVEDRNK2"  "DRNK3GE5" 
    ##  [81] "MAXDRNKS"  "FLUSHOT6"  "FLSHTMY2"  "IMFVPLAC"  "PNEUVAC4" 
    ##  [86] "FALL12MN"  "FALLINJ3"  "SEATBELT"  "DRNKDRI2"  "HADMAM"   
    ##  [91] "HOWLONG"   "HADPAP2"   "LASTPAP2"  "HPVTEST"   "HPLSTTST" 
    ##  [96] "HADHYST2"  "PCPSAAD3"  "PCPSADI1"  "PCPSARE1"  "PSATEST1" 
    ## [101] "PSATIME"   "PCPSARS1"  "BLDSTOOL"  "LSTBLDS3"  "HADSIGM3" 
    ## [106] "HADSGCO1"  "LASTSIG3"  "HIVTST6"   "HIVTSTD3"  "HIVRISK5" 
    ## [111] "PDIABTST"  "PREDIAB1"  "INSULIN"   "BLDSUGAR"  "FEETCHK3" 
    ## [116] "DOCTDIAB"  "CHKHEMO3"  "FEETCHK"   "EYEEXAM1"  "DIABEYE"  
    ## [121] "DIABEDU"   "MEDICARE"  "HLTHCVR1"  "DELAYME1"  "DLYOTHER" 
    ## [126] "NOCOV121"  "LSTCOVRG"  "DRVISITS"  "MEDSCOS1"  "CARERCVD" 
    ## [131] "MEDBILL1"  "CIMEMLOS"  "CDHOUSE"   "CDASSIST"  "CDHELP"   
    ## [136] "CDSOCIAL"  "CDDISCUS"  "CAREGIV1"  "CRGVREL2"  "CRGVLNG1" 
    ## [141] "CRGVHRS1"  "CRGVPRB2"  "CRGVPERS"  "CRGVHOUS"  "CRGVMST3" 
    ## [146] "CRGVEXPT"  "ECIGARET"  "ECIGNOW"   "MARIJAN1"  "USEMRJN2" 
    ## [151] "RSNMRJN1"  "ADSLEEP"   "SLEPDAY1"  "SLEPSNO2"  "SLEPBRTH" 
    ## [156] "ADPLEAS1"  "ADDOWN1"   "FEELNERV"  "STOPWORY"  "COPDCOGH" 
    ## [161] "COPDFLEM"  "COPDBRTH"  "COPDBTST"  "COPDSMOK"  "INDORTAN" 
    ## [166] "NUMBURN3"  "SUNPRTCT"  "WKDAYOUT"  "WKENDOUT"  "LCSFIRST" 
    ## [171] "LCSLAST"   "LCSNUMCG"  "LCSCTSCN"  "CNCRDIFF"  "CNCRAGE"  
    ## [176] "CNCRTYP1"  "CSRVTRT2"  "CSRVDOC1"  "CSRVSUM"   "CSRVRTRN" 
    ## [181] "CSRVINST"  "CSRVINSR"  "CSRVDEIN"  "CSRVCLIN"  "CSRVPAIN" 
    ## [186] "CSRVCTL1"  "PCPSADE1"  "PCDMDEC1"  "PROFEXAM"  "LENGEXAM" 
    ## [191] "HPVADVC2"  "HPVADSHT"  "TETANUS1"  "SHINGLE2"  "SOMALE"   
    ## [196] "SOFEMALE"  "TRNSGNDR"  "RCSGENDR"  "RCSRLTN2"  "CASTHDX2" 
    ## [201] "CASTHNO2"  "QSTVER"    "QSTLANG"   "X_METSTAT" "X_URBSTAT"
    ## [206] "MSCODE"    "X_STSTR"   "X_STRWT"   "X_RAWRAKE" "X_WT2RAKE"
    ## [211] "X_IMPRACE" "X_CHISPNC" "X_CRACE1"  "X_CPRACE"  "X_CLLCPWT"
    ## [216] "X_DUALUSE" "X_DUALCOR" "X_LLCPWT2" "X_LLCPWT"  "X_RFHLTH" 
    ## [221] "X_PHYS14D" "X_MENT14D" "X_HCVU651" "X_TOTINDA" "X_MICHD"  
    ## [226] "X_LTASTH1" "X_CASTHM1" "X_ASTHMS1" "X_DRDXAR1" "X_EXTETH3"
    ## [231] "X_ALTETH3" "X_DENVST3" "X_PRACE1"  "X_MRACE1"  "X_HISPANC"
    ## [236] "X_RACE"    "X_RACEG21" "X_RACEGR3" "X_RACE_G1" "X_AGEG5YR"
    ## [241] "X_AGE65YR" "X_AGE80"   "X_AGE_G"   "HTIN4"     "HTM4"     
    ## [246] "WTKG3"     "X_BMI5"    "X_BMI5CAT" "X_RFBMI5"  "X_CHLDCNT"
    ## [251] "X_EDUCAG"  "X_INCOMG"  "X_SMOKER3" "X_RFSMOK3" "DRNKANY5" 
    ## [256] "DROCDY3_"  "X_RFBING5" "X_DRNKWEK" "X_RFDRHV6" "X_FLSHOT6"
    ## [261] "X_PNEUMO3" "X_RFSEAT2" "X_RFSEAT3" "X_DRNKDRV" "X_RFMAM21"
    ## [266] "X_MAM5022" "X_RFPAP34" "X_RFPSA22" "X_RFBLDS3" "X_COL10YR"
    ## [271] "X_HFOB3YR" "X_FS5YR"   "X_FOBTFS"  "X_CRCREC"  "X_AIDTST3"
    ## 
    ## > nrow(BRFSS_a)
    ## [1] 437436

``` r
source("110_Keep vars.R", echo = TRUE)
```

    ## 
    ## > BRFSS_b <- BRFSS_a
    ## 
    ## > BRFSSVarList <- c("CVDINFR4", "RMVTETH4", "SEX1", 
    ## +     "X_HISPANC", "X_MRACE1", "X_AGEG5YR", "EDUCA", "INCOME2", 
    ## +     "X_DENVST3", "DIABETE3", " ..." ... [TRUNCATED] 
    ## 
    ## > BRFSS_b <- BRFSS_b[BRFSSVarList]
    ## 
    ## > colnames(BRFSS_b)
    ##  [1] "CVDINFR4"  "RMVTETH4"  "SEX1"      "X_HISPANC" "X_MRACE1" 
    ##  [6] "X_AGEG5YR" "EDUCA"     "INCOME2"   "X_DENVST3" "DIABETE3" 
    ## [11] "X_SMOKER3" "EXERANY2"  "X_BMI5CAT"
    ## 
    ## > nrow(BRFSS_b)
    ## [1] 437436

``` r
source("115_Make outcome exposure vars.R", echo = TRUE)
```

    ## 
    ## > BRFSS_c <- BRFSS_b
    ## 
    ## > BRFSS_c$CVDINFR5 <- 9
    ## 
    ## > BRFSS_c$CVDINFR5[BRFSS_c$CVDINFR4 == 1] <- 0
    ## 
    ## > BRFSS_c$CVDINFR5[BRFSS_c$CVDINFR4 == 2] <- 1
    ## 
    ## > table(BRFSS_c$CVDINFR4, BRFSS_c$CVDINFR5)
    ##    
    ##          0      1      9
    ##   1  26412      0      0
    ##   2      0 408706      0
    ##   7      0      0   2055
    ##   9      0      0    240
    ## 
    ## > BRFSS_c$RMVTETH5 <- 9
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 8] <- 0
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 1] <- 1
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 2] <- 2
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 3] <- 3
    ## 
    ## > table(BRFSS_c$RMVTETH4, BRFSS_c$RMVTETH5)
    ##    
    ##          0      1      2      3      9
    ##   1      0 127234      0      0      0
    ##   2      0      0  51635      0      0
    ##   3      0      0      0  29430      0
    ##   7      0      0      0      0   9687
    ##   8 218715      0      0      0      0
    ##   9      0      0      0      0    707

``` r
source("120_Make sex race vars.R", echo = TRUE)
```

    ## 
    ## > BRFSS_c$SEX2 <- 9
    ## 
    ## > BRFSS_c$SEX2[BRFSS_c$SEX1 == 1] <- 1
    ## 
    ## > BRFSS_c$SEX2[BRFSS_c$SEX1 == 2] <- 0
    ## 
    ## > table(BRFSS_c$SEX1, BRFSS_c$SEX2)
    ##    
    ##          0      1      9
    ##   1      0 197412      0
    ##   2 238911      0      0
    ##   7      0      0    431
    ##   9      0      0    682
    ## 
    ## > BRFSS_c$MALE <- 0
    ## 
    ## > BRFSS_c$MALE[BRFSS_c$SEX2 == 1] <- 1
    ## 
    ## > table(BRFSS_c$SEX2, BRFSS_c$MALE)
    ##    
    ##          0      1
    ##   0 238911      0
    ##   1      0 197412
    ##   9   1113      0
    ## 
    ## > BRFSS_c$HISPANIC <- 9
    ## 
    ## > BRFSS_c$HISPANIC[BRFSS_c$X_HISPANC == 1] <- 1
    ## 
    ## > BRFSS_c$HISPANIC[BRFSS_c$X_HISPANC == 2] <- 0
    ## 
    ## > table(BRFSS_c$X_HISPANC, BRFSS_c$HISPANIC)
    ##    
    ##          0      1      9
    ##   1      0  36941      0
    ##   2 395932      0      0
    ##   9      0      0   4563
    ## 
    ## > BRFSS_c$RACEGRP <- 9
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 1 & BRFSS_c$HISPANIC == 
    ## +     0] <- 0
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 2 & BRFSS_c$HISPANIC == 
    ## +     0] <- 1
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 3 & BRFSS_c$HISPANIC == 
    ## +     0] <- 4
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 4 & BRFSS_c$HISPANIC == 
    ## +     0] <- 3
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 5 & BRFSS_c$HISPANIC == 
    ## +     0] <- 4
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 6 & BRFSS_c$HISPANIC == 
    ## +     0] <- 4
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 7 & BRFSS_c$HISPANIC == 
    ## +     0] <- 4
    ## 
    ## > BRFSS_c$RACEGRP[BRFSS_c$HISPANIC == 1] <- 2
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[1])
    ## [1] 345711
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[2])
    ## [1] 37862
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[3])
    ## [1] 9131
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[4])
    ## [1] 10258
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[5])
    ## [1] 2617
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[6])
    ## [1] 11641
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[7])
    ## [1] 9572
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[8])
    ## [1] 4253
    ## 
    ## > sum(table(BRFSS_b$X_MRACE1)[9])
    ## [1] 6359
    ## 
    ## > table(BRFSS_b$X_MRACE1)
    ## 
    ##      1      2      3      4      5      6      7     77     99 
    ## 345711  37862   9131  10258   2617  11641   9572   4253   6359 
    ## 
    ## > BRFSS_c$BLACK <- 0
    ## 
    ## > BRFSS_c$ASIAN <- 0
    ## 
    ## > BRFSS_c$OTHRACE <- 0
    ## 
    ## > BRFSS_c$BLACK[BRFSS_c$RACEGRP == 1] <- 1
    ## 
    ## > BRFSS_c$ASIAN[BRFSS_c$RACEGRP == 3] <- 1
    ## 
    ## > BRFSS_c$OTHRACE[BRFSS_c$RACEGRP == 4] <- 1
    ## 
    ## > table(BRFSS_c$RACEGRP, BRFSS_c$BLACK)
    ##    
    ##          0      1
    ##   0 324797      0
    ##   1      0  35930
    ##   2  36941      0
    ##   3   9904      0
    ##   4  21383      0
    ##   9   8481      0
    ## 
    ## > table(BRFSS_c$RACEGRP, BRFSS_c$ASIAN)
    ##    
    ##          0      1
    ##   0 324797      0
    ##   1  35930      0
    ##   2  36941      0
    ##   3      0   9904
    ##   4  21383      0
    ##   9   8481      0
    ## 
    ## > table(BRFSS_c$RACEGRP, BRFSS_c$OTHRACE)
    ##    
    ##          0      1
    ##   0 324797      0
    ##   1  35930      0
    ##   2  36941      0
    ##   3   9904      0
    ##   4      0  21383
    ##   9   8481      0

``` r
source("125_Make age  educ income vars.R", echo = TRUE)
```

    ## 
    ## > BRFSS_c$AGEG5YR2 <- 9
    ## 
    ## > BRFSS_c$AGEG5YR2[BRFSS_c$X_AGEG5YR > 6 & BRFSS_c$X_AGEG5YR < 
    ## +     9] <- 0
    ## 
    ## > BRFSS_c$AGEG5YR2[BRFSS_c$X_AGEG5YR > 8 & BRFSS_c$X_AGEG5YR < 
    ## +     11] <- 1
    ## 
    ## > BRFSS_c$AGEG5YR2[BRFSS_c$X_AGEG5YR > 10 & BRFSS_c$X_AGEG5YR < 
    ## +     13] <- 2
    ## 
    ## > BRFSS_c$AGEG5YR2[BRFSS_c$X_AGEG5YR == 13] <- 3
    ## 
    ## > table(BRFSS_c$X_AGEG5YR, BRFSS_c$AGEG5YR2)
    ##     
    ##          0     1     2     3     9
    ##   1      0     0     0     0 26005
    ##   2      0     0     0     0 22286
    ##   3      0     0     0     0 24269
    ##   4      0     0     0     0 26118
    ##   5      0     0     0     0 25583
    ##   6      0     0     0     0 28846
    ##   7  35060     0     0     0     0
    ##   8  42160     0     0     0     0
    ##   9      0 46994     0     0     0
    ##   10     0 47329     0     0     0
    ##   11     0     0 40930     0     0
    ##   12     0     0 28668     0     0
    ##   13     0     0     0 34716     0
    ##   14     0     0     0     0  8472
    ## 
    ## > BRFSS_c$AGE1 <- 0
    ## 
    ## > BRFSS_c$AGE2 <- 0
    ## 
    ## > BRFSS_c$AGE3 <- 0
    ## 
    ## > BRFSS_c$AGE4 <- 0
    ## 
    ## > BRFSS_c$AGE1[BRFSS_c$AGEG5YR2 == 0] <- 1
    ## 
    ## > BRFSS_c$AGE2[BRFSS_c$AGEG5YR2 == 1] <- 1
    ## 
    ## > BRFSS_c$AGE3[BRFSS_c$AGEG5YR2 == 2] <- 1
    ## 
    ## > BRFSS_c$AGE4[BRFSS_c$AGEG5YR2 == 3] <- 1
    ## 
    ## > table(BRFSS_c$AGEG5YR2, BRFSS_c$AGE1)
    ##    
    ##          0      1
    ##   0      0  77220
    ##   1  94323      0
    ##   2  69598      0
    ##   3  34716      0
    ##   9 161579      0
    ## 
    ## > table(BRFSS_c$AGEG5YR2, BRFSS_c$AGE2)
    ##    
    ##          0      1
    ##   0  77220      0
    ##   1      0  94323
    ##   2  69598      0
    ##   3  34716      0
    ##   9 161579      0
    ## 
    ## > table(BRFSS_c$AGEG5YR2, BRFSS_c$AGE3)
    ##    
    ##          0      1
    ##   0  77220      0
    ##   1  94323      0
    ##   2      0  69598
    ##   3  34716      0
    ##   9 161579      0
    ## 
    ## > table(BRFSS_c$AGEG5YR2, BRFSS_c$AGE4)
    ##    
    ##          0      1
    ##   0  77220      0
    ##   1  94323      0
    ##   2  69598      0
    ##   3      0  34716
    ##   9 161579      0
    ## 
    ## > BRFSS_c$EDGRP <- 9
    ## 
    ## > BRFSS_c$EDGRP[BRFSS_c$EDUCA < 4] <- 0
    ## 
    ## > BRFSS_c$EDGRP[BRFSS_c$EDUCA == 4] <- 1
    ## 
    ## > BRFSS_c$EDGRP[BRFSS_c$EDUCA == 5] <- 2
    ## 
    ## > BRFSS_c$EDGRP[BRFSS_c$EDUCA == 6] <- 3
    ## 
    ## > table(BRFSS_b$EDUCA, BRFSS_c$EDGRP)
    ##    
    ##          0      1      2      3      9
    ##   1    666      0      0      0      0
    ##   2  10446      0      0      0      0
    ##   3  21456      0      0      0      0
    ##   4      0 119038      0      0      0
    ##   5      0      0 119980      0      0
    ##   6      0      0      0 164229      0
    ##   9      0      0      0      0   1587
    ## 
    ## > BRFSS_c$LOWED <- 0
    ## 
    ## > BRFSS_c$HIGHSCHOOL <- 0
    ## 
    ## > BRFSS_c$SOMECOLL <- 0
    ## 
    ## > BRFSS_c$COLLEGE <- 0
    ## 
    ## > BRFSS_c$LOWED[BRFSS_c$EDGRP == 0] <- 1
    ## 
    ## > BRFSS_c$HIGHSCHOOL[BRFSS_c$EDGRP == 1] <- 1
    ## 
    ## > BRFSS_c$SOMECOLL[BRFSS_c$EDGRP == 2] <- 1
    ## 
    ## > BRFSS_c$COLLEGE[BRFSS_c$EDGRP == 3] <- 1
    ## 
    ## > table(BRFSS_c$EDGRP, BRFSS_c$LOWED)
    ##    
    ##          0      1
    ##   0      0  32568
    ##   1 119038      0
    ##   2 119980      0
    ##   3 164229      0
    ##   9   1621      0
    ## 
    ## > table(BRFSS_c$EDGRP, BRFSS_c$HIGHSCHOOL)
    ##    
    ##          0      1
    ##   0  32568      0
    ##   1      0 119038
    ##   2 119980      0
    ##   3 164229      0
    ##   9   1621      0
    ## 
    ## > table(BRFSS_c$EDGRP, BRFSS_c$SOMECOLL)
    ##    
    ##          0      1
    ##   0  32568      0
    ##   1 119038      0
    ##   2      0 119980
    ##   3 164229      0
    ##   9   1621      0
    ## 
    ## > table(BRFSS_c$EDGRP, BRFSS_c$COLLEGE)
    ##    
    ##          0      1
    ##   0  32568      0
    ##   1 119038      0
    ##   2 119980      0
    ##   3      0 164229
    ##   9   1621      0
    ## 
    ## > BRFSS_c$INCOME3 <- 9
    ## 
    ## > BRFSS_c$INCOME3[BRFSS_c$INCOME2 < 3] <- 0
    ## 
    ## > BRFSS_c$INCOME3[BRFSS_c$INCOME2 > 2 & BRFSS_c$INCOME2 < 
    ## +     5] <- 1
    ## 
    ## > BRFSS_c$INCOME3[BRFSS_c$INCOME2 > 4 & BRFSS_c$INCOME2 < 
    ## +     6] <- 2
    ## 
    ## > BRFSS_c$INCOME3[BRFSS_c$INCOME2 > 5 & BRFSS_c$INCOME2 < 
    ## +     7] <- 3
    ## 
    ## > BRFSS_c$INCOME3[BRFSS_c$INCOME2 > 6 & BRFSS_c$INCOME2 < 
    ## +     9] <- 4
    ## 
    ## > table(BRFSS_c$INCOME2, BRFSS_c$INCOME3)
    ##     
    ##           0      1      2      3      4      9
    ##   1   16762      0      0      0      0      0
    ##   2   18034      0      0      0      0      0
    ##   3       0  25850      0      0      0      0
    ##   4       0  32218      0      0      0      0
    ##   5       0      0  37830      0      0      0
    ##   6       0      0      0  49558      0      0
    ##   7       0      0      0      0  58098      0
    ##   8       0      0      0      0 122968      0
    ##   77      0      0      0      0      0  33279
    ##   99      0      0      0      0      0  38445
    ## 
    ## > BRFSS_c$INC1 <- 0
    ## 
    ## > BRFSS_c$INC2 <- 0
    ## 
    ## > BRFSS_c$INC3 <- 0
    ## 
    ## > BRFSS_c$INC4 <- 0
    ## 
    ## > BRFSS_c$INC5 <- 0
    ## 
    ## > BRFSS_c$INC1[BRFSS_c$INCOME3 == 0] <- 1
    ## 
    ## > BRFSS_c$INC2[BRFSS_c$INCOME3 == 1] <- 1
    ## 
    ## > BRFSS_c$INC3[BRFSS_c$INCOME3 == 2] <- 1
    ## 
    ## > BRFSS_c$INC4[BRFSS_c$INCOME3 == 3] <- 1
    ## 
    ## > BRFSS_c$INC5[BRFSS_c$INCOME3 == 4] <- 1
    ## 
    ## > table(BRFSS_c$INCOME3, BRFSS_c$INC1)
    ##    
    ##          0      1
    ##   0      0  34796
    ##   1  58068      0
    ##   2  37830      0
    ##   3  49558      0
    ##   4 181066      0
    ##   9  76118      0
    ## 
    ## > table(BRFSS_c$INCOME3, BRFSS_c$INC2)
    ##    
    ##          0      1
    ##   0  34796      0
    ##   1      0  58068
    ##   2  37830      0
    ##   3  49558      0
    ##   4 181066      0
    ##   9  76118      0
    ## 
    ## > table(BRFSS_c$INCOME3, BRFSS_c$INC3)
    ##    
    ##          0      1
    ##   0  34796      0
    ##   1  58068      0
    ##   2      0  37830
    ##   3  49558      0
    ##   4 181066      0
    ##   9  76118      0
    ## 
    ## > table(BRFSS_c$INCOME3, BRFSS_c$INC4)
    ##    
    ##          0      1
    ##   0  34796      0
    ##   1  58068      0
    ##   2  37830      0
    ##   3      0  49558
    ##   4 181066      0
    ##   9  76118      0
    ## 
    ## > table(BRFSS_c$INCOME3, BRFSS_c$INC5)
    ##    
    ##          0      1
    ##   0  34796      0
    ##   1  58068      0
    ##   2  37830      0
    ##   3  49558      0
    ##   4      0 181066
    ##   9  76118      0

``` r
source("130_Make dent diabetes smoker vars.R", echo = TRUE)
```

    ## 
    ## > BRFSS_c$DENVST4 <- 9
    ## 
    ## > BRFSS_c$DENVST4[BRFSS_c$X_DENVST3 == 1] <- 0
    ## 
    ## > BRFSS_c$DENVST4[BRFSS_c$X_DENVST3 == 2] <- 1
    ## 
    ## > table(BRFSS_c$X_DENVST3, BRFSS_c$DENVST4)
    ##    
    ##          0      1      9
    ##   1 296047      0      0
    ##   2      0 136629      0
    ##   9      0      0   4760
    ## 
    ## > BRFSS_c$NODENVST <- 0
    ## 
    ## > BRFSS_c$NODENVST[BRFSS_c$DENVST4 == 1] <- 1
    ## 
    ## > table(BRFSS_c$DENVST4, BRFSS_c$NODENVST)
    ##    
    ##          0      1
    ##   0 296047      0
    ##   1      0 136629
    ##   9   4760      0
    ## 
    ## > BRFSS_c$DIABETE4 <- 9
    ## 
    ## > BRFSS_c$DIABETE4[BRFSS_c$DIABETE3 > 1 & BRFSS_c$DIABETE3 < 
    ## +     7] <- 0
    ## 
    ## > BRFSS_c$DIABETE4[BRFSS_c$DIABETE3 == 1] <- 1
    ## 
    ## > table(BRFSS_b$DIABETE3, BRFSS_c$DIABETE4)
    ##    
    ##          0      1      9
    ##   1      0  60703      0
    ##   2   3857      0      0
    ##   3 363757      0      0
    ##   4   8263      0      0
    ##   7      0      0    567
    ##   9      0      0    265
    ## 
    ## > BRFSS_c$NODIABETE <- 0
    ## 
    ## > BRFSS_c$NODIABETE[BRFSS_c$DIABETE4 == 0] <- 1
    ## 
    ## > table(BRFSS_c$DIABETE4, BRFSS_c$NODIABETE)
    ##    
    ##          0      1
    ##   0      0 375877
    ##   1  60703      0
    ##   9    856      0
    ## 
    ## > BRFSS_c$SMOKER4 <- 9
    ## 
    ## > BRFSS_c$SMOKER4[BRFSS_c$X_SMOKER3 == 4] <- 0
    ## 
    ## > BRFSS_c$SMOKER4[BRFSS_c$X_SMOKER3 == 3] <- 1
    ## 
    ## > BRFSS_c$SMOKER4[BRFSS_c$X_SMOKER3 < 3] <- 2
    ## 
    ## > table(BRFSS_c$X_SMOKER3, BRFSS_c$SMOKER4)
    ##    
    ##          0      1      2      9
    ##   1      0      0  43633      0
    ##   2      0      0  17639      0
    ##   3      0 118754      0      0
    ##   4 240594      0      0      0
    ##   9      0      0      0  16816
    ## 
    ## > BRFSS_c$NEVERSMK <- 0
    ## 
    ## > BRFSS_c$FRMRSMK <- 0
    ## 
    ## > BRFSS_c$SMOKE <- 0
    ## 
    ## > BRFSS_c$NEVERSMK[BRFSS_c$SMOKER4 == 0] <- 1
    ## 
    ## > BRFSS_c$FRMRSMK[BRFSS_c$SMOKER4 == 1] <- 1
    ## 
    ## > BRFSS_c$SMOKE[BRFSS_c$SMOKER4 == 2] <- 1
    ## 
    ## > table(BRFSS_c$SMOKER4, BRFSS_c$NEVERSMK)
    ##    
    ##          0      1
    ##   0      0 240594
    ##   1 118754      0
    ##   2  61272      0
    ##   9  16816      0
    ## 
    ## > table(BRFSS_c$SMOKER4, BRFSS_c$FRMRSMK)
    ##    
    ##          0      1
    ##   0 240594      0
    ##   1      0 118754
    ##   2  61272      0
    ##   9  16816      0
    ## 
    ## > table(BRFSS_c$SMOKER4, BRFSS_c$SMOKE)
    ##    
    ##          0      1
    ##   0 240594      0
    ##   1 118754      0
    ##   2      0  61272
    ##   9  16816      0

``` r
source("135_Make exer bmi vars.R", echo = TRUE)
```

    ## 
    ## > BRFSS_c$EXERANY3 <- 9
    ## 
    ## > BRFSS_c$EXERANY3[BRFSS_c$EXERANY2 == 1] <- 1
    ## 
    ## > BRFSS_c$EXERANY3[BRFSS_c$EXERANY2 == 2] <- 0
    ## 
    ## > table(BRFSS_c$EXERANY2, BRFSS_c$EXERANY3)
    ##    
    ##          0      1      9
    ##   1      0 326472      0
    ##   2 110269      0      0
    ##   7      0      0    482
    ##   9      0      0    188
    ## 
    ## > BRFSS_c$NOEXER <- 0
    ## 
    ## > BRFSS_c$NOEXER[BRFSS_c$EXERANY3 == 0] <- 1
    ## 
    ## > table(BRFSS_c$EXERANY3, BRFSS_c$NOEXER)
    ##    
    ##          0      1
    ##   0      0 110269
    ##   1 326472      0
    ##   9    695      0
    ## 
    ## > BRFSS_c$BMICAT <- 9
    ## 
    ## > BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 1] <- 0
    ## 
    ## > BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 2] <- 1
    ## 
    ## > BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 3] <- 2
    ## 
    ## > BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 4] <- 3
    ## 
    ## > table(BRFSS_c$X_BMI5CAT, BRFSS_c$BMICAT)
    ##    
    ##          0      1      2      3      9
    ##   1   6776      0      0      0      0
    ##   2      0 123522      0      0      0
    ##   3      0      0 143878      0      0
    ##   4      0      0      0 127998      0
    ## 
    ## > BRFSS_c$UNDWT <- 0
    ## 
    ## > BRFSS_c$OVWT <- 0
    ## 
    ## > BRFSS_c$OBESE <- 0
    ## 
    ## > BRFSS_c$UNDWT[BRFSS_c$BMICAT == 0] <- 1
    ## 
    ## > BRFSS_c$OVWT[BRFSS_c$BMICAT == 2] <- 1
    ## 
    ## > BRFSS_c$OBESE[BRFSS_c$BMICAT == 3] <- 1
    ## 
    ## > table(BRFSS_c$BMICAT, BRFSS_c$UNDWT)
    ##    
    ##          0      1
    ##   0      0   6776
    ##   1 123522      0
    ##   2 143878      0
    ##   3 127998      0
    ##   9  35262      0
    ## 
    ## > table(BRFSS_c$BMICAT, BRFSS_c$OVWT)
    ##    
    ##          0      1
    ##   0   6776      0
    ##   1 123522      0
    ##   2      0 143878
    ##   3 127998      0
    ##   9  35262      0
    ## 
    ## > table(BRFSS_c$BMICAT, BRFSS_c$OBESE)
    ##    
    ##          0      1
    ##   0   6776      0
    ##   1 123522      0
    ##   2 143878      0
    ##   3      0 127998
    ##   9  35262      0

``` r
source("175_Data reduction.R", echo = TRUE)
```

    ## 
    ## > BRFSS_d <- subset(BRFSS_c, BRFSS_c$CVDINFR5 != 9)
    ## 
    ## > nrow(BRFSS_d)
    ## [1] 435118
    ## 
    ## > BRFSS_e <- subset(BRFSS_d, BRFSS_d$RMVTETH5 != 9)
    ## 
    ## > nrow(BRFSS_d)
    ## [1] 435118
    ## 
    ## > BRFSS_f <- subset(BRFSS_e, BRFSS_e$SEX2 != 9)
    ## 
    ## > nrow(BRFSS_f)
    ## [1] 424055
    ## 
    ## > BRFSS_g <- subset(BRFSS_f, BRFSS_f$HISPANIC != 9)
    ## 
    ## > nrow(BRFSS_g)
    ## [1] 420069
    ## 
    ## > BRFSS_h <- subset(BRFSS_g, BRFSS_g$RACEGRP != 9)
    ## 
    ## > nrow(BRFSS_h)
    ## [1] 416463
    ## 
    ## > BRFSS_i <- subset(BRFSS_h, BRFSS_h$AGEG5YR2 != 9)
    ## 
    ## > nrow(BRFSS_i)
    ## [1] 261501
    ## 
    ## > BRFSS_j <- subset(BRFSS_i, BRFSS_i$EDGRP != 9)
    ## 
    ## > nrow(BRFSS_j)
    ## [1] 261078
    ## 
    ## > BRFSS_k <- subset(BRFSS_j, BRFSS_j$INCOME3 != 9)
    ## 
    ## > nrow(BRFSS_d)
    ## [1] 435118
    ## 
    ## > BRFSS_l <- subset(BRFSS_k, BRFSS_k$DENVST4 != 9)
    ## 
    ## > nrow(BRFSS_l)
    ## [1] 215471
    ## 
    ## > BRFSS_m <- subset(BRFSS_l, BRFSS_l$DIABETE4 != 9)
    ## 
    ## > nrow(BRFSS_m)
    ## [1] 215276
    ## 
    ## > BRFSS_n <- subset(BRFSS_m, BRFSS_m$SMOKER4 != 9)
    ## 
    ## > nrow(BRFSS_n)
    ## [1] 211253
    ## 
    ## > BRFSS_o <- subset(BRFSS_n, BRFSS_n$EXERANY3 != 9)
    ## 
    ## > nrow(BRFSS_o)
    ## [1] 211029
    ## 
    ## > BRFSS_p <- subset(BRFSS_o, BRFSS_o$BMICAT != 9)
    ## 
    ## > nrow(BRFSS_p)
    ## [1] 204042

``` r
source("190_Write out data.R", echo = TRUE)
```

    ## 
    ## > BRFSS <- BRFSS_p
    ## 
    ## > write.csv(BRFSS, file = "./data/BRFSS.csv", row.names = FALSE)
    ## 
    ## > nrow(BRFSS)
    ## [1] 204042
    ## 
    ## > ncol(BRFSS)
    ## [1] 52
    ## 
    ## > colnames(BRFSS)
    ##  [1] "CVDINFR4"   "RMVTETH4"   "SEX1"       "X_HISPANC"  "X_MRACE1"  
    ##  [6] "X_AGEG5YR"  "EDUCA"      "INCOME2"    "X_DENVST3"  "DIABETE3"  
    ## [11] "X_SMOKER3"  "EXERANY2"   "X_BMI5CAT"  "CVDINFR5"   "RMVTETH5"  
    ## [16] "SEX2"       "MALE"       "HISPANIC"   "RACEGRP"    "BLACK"     
    ## [21] "ASIAN"      "OTHRACE"    "AGEG5YR2"   "AGE1"       "AGE2"      
    ## [26] "AGE3"       "AGE4"       "EDGRP"      "LOWED"      "HIGHSCHOOL"
    ## [31] "SOMECOLL"   "COLLEGE"    "INCOME3"    "INC1"       "INC2"      
    ## [36] "INC3"       "INC4"       "INC5"       "DENVST4"    "NODENVST"  
    ## [41] "DIABETE4"   "NODIABETE"  "SMOKER4"    "NEVERSMK"   "FRMRSMK"   
    ## [46] "SMOKE"      "EXERANY3"   "NOEXER"     "BMICAT"     "UNDWT"     
    ## [51] "OVWT"       "OBESE"     
    ## 
    ## > data_dictionary <- describe(BRFSS)
    ## 
    ## > sink("./documentation/data_dictionary.txt", append = TRUE)
