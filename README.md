Missing Teeth and Heart Disease Revisited: BRFSS 2018
================
Paul G. Smith
First created on Nov 5, 2019. Updated on Nov 05, 2019

## Missing Teeth and Heart Disease Revisited: BRFSS 2018

### Load Dependencies and Read in BRFSS 2018 Data Set

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
source("101_Read in BRFSS XPT.R", echo = TRUE)
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
    ## > colnames(BRFSS_a)[grep("age", tolower(colnames(BRFSS_a)))]
    ## [1] "DIABAGE2"  "CNCRAGE"   "X_AGEG5YR" "X_AGE65YR" "X_AGE80"   "X_AGE_G"  
    ## 
    ## > nrow(BRFSS_a)
    ## [1] 437436

### Data Reduction

``` r
source("105_Keep vars.R", echo = TRUE)
```

    ## 
    ## > BRFSSVarList <- c("CVDINFR4", "RMVTETH4", "X_AGEG5YR", 
    ## +     "X_DENVST3", "SEX1", "X_HISPANC", "X_MRACE1", "EDUCA", "INCOME2", 
    ## +     "X_SMOKER3",  .... [TRUNCATED] 
    ## 
    ## > BRFSS_b <- BRFSS_a[BRFSSVarList]
    ## 
    ## > colnames(BRFSS_b)
    ##  [1] "CVDINFR4"  "RMVTETH4"  "X_AGEG5YR" "X_DENVST3" "SEX1"     
    ##  [6] "X_HISPANC" "X_MRACE1"  "EDUCA"     "INCOME2"   "X_SMOKER3"
    ## [11] "DIABETE3"  "X_BMI5CAT" "EXERANY2" 
    ## 
    ## > nrow(BRFSS_b)
    ## [1] 437436

### Apply Exclusion and final Reduction

``` r
source("110_Apply exclusions_make_key_variable.R", echo = TRUE)
```

    ## 
    ## > nrow(BRFSS_b)
    ## [1] 437436
    ## 
    ## > BRFSS_c <- subset(BRFSS_b, X_AGEG5YR > 6)
    ## 
    ## > nrow(BRFSS_c)
    ## [1] 284329
    ## 
    ## > BRFSS_c$RMVTETH5 <- 9
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 8] <- 1
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 1] <- 2
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 2] <- 3
    ## 
    ## > BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 3] <- 4
    ## 
    ## > table(BRFSS_c$RMVTETH4, BRFSS_c$RMVTETH5)
    ##    
    ##          1      2      3      4      9
    ##   1      0  92845      0      0      0
    ##   2      0      0  45288      0      0
    ##   3      0      0      0  27444      0
    ##   7      0      0      0      0   8387
    ##   8 109714      0      0      0      0
    ##   9      0      0      0      0    623
    ## 
    ## > BRFSS_d <- subset(BRFSS_c, RMVTETH5 < 5)
    ## 
    ## > nrow(BRFSS_d)
    ## [1] 275291
    ## 
    ## > BRFSS_d$CVDINFR5 <- 9
    ## 
    ## > BRFSS_d$CVDINFR5[BRFSS_d$CVDINFR4 == 1] <- 0
    ## 
    ## > BRFSS_d$CVDINFR5[BRFSS_d$CVDINFR4 == 2] <- 1
    ## 
    ## > table(BRFSS_d$CVDINFR4, BRFSS_d$CVDINFR5)
    ##    
    ##          0      1      9
    ##   1  23361      0      0
    ##   2      0 250437      0
    ##   7      0      0   1377
    ##   9      0      0    116
    ## 
    ## > BRFSS_e <- subset(BRFSS_d, CVDINFR5 < 2)
    ## 
    ## > table(BRFSS_e$CVDINFR4, BRFSS_e$CVDINFR5)
    ##    
    ##          0      1
    ##   1  23361      0
    ##   2      0 250437
    ## 
    ## > nrow(BRFSS_e)
    ## [1] 273798
    ## 
    ## > table(BRFSS_e$RMVTETH5)
    ## 
    ##      1      2      3      4 
    ## 109271  92422  44955  27150 
    ## 
    ## > (table(BRFSS_e$RMVTETH5)/nrow(BRFSS_e)) * 100
    ## 
    ##        1        2        3        4 
    ## 39.90935 33.75554 16.41904  9.91607 
    ## 
    ## > table(BRFSS_e$CVDINFR5)
    ## 
    ##      0      1 
    ##  23361 250437 
    ## 
    ## > (table(BRFSS_e$CVDINFR5)/nrow(BRFSS_e)) * 100
    ## 
    ##         0         1 
    ##  8.532203 91.467797

### Make Categorical Variables

``` r
source("115_Make categorical variables.R", echo = TRUE)
```

    ## 
    ## > str(BRFSS_e)
    ## 'data.frame':    273798 obs. of  15 variables:
    ##  $ CVDINFR4 : num  2 2 2 2 2 2 2 2 2 2 ...
    ##  $ RMVTETH4 : num  1 1 8 8 2 8 1 2 1 3 ...
    ##  $ X_AGEG5YR: num  13 10 12 8 13 8 11 12 10 11 ...
    ##  $ X_DENVST3: num  1 2 1 1 1 1 2 1 1 2 ...
    ##  $ SEX1     : num  2 1 2 1 1 2 2 2 2 1 ...
    ##  $ X_HISPANC: num  2 2 2 2 2 2 2 2 2 2 ...
    ##  $ X_MRACE1 : num  1 1 1 1 1 1 1 2 1 1 ...
    ##  $ EDUCA    : num  6 4 6 4 4 5 4 3 3 5 ...
    ##  $ INCOME2  : num  6 3 8 8 4 6 4 2 2 7 ...
    ##  $ X_SMOKER3: num  4 4 4 3 3 4 4 4 4 4 ...
    ##  $ DIABETE3 : num  3 3 3 1 3 3 1 3 1 3 ...
    ##  $ X_BMI5CAT: num  2 3 2 3 3 4 4 4 4 4 ...
    ##  $ EXERANY2 : num  2 1 1 2 2 1 2 2 1 1 ...
    ##  $ RMVTETH5 : num  2 2 1 1 3 1 2 3 2 4 ...
    ##  $ CVDINFR5 : num  1 1 1 1 1 1 1 1 1 1 ...
    ## 
    ## > head(BRFSS_e)
    ##    CVDINFR4 RMVTETH4 X_AGEG5YR X_DENVST3 SEX1 X_HISPANC X_MRACE1 EDUCA
    ## 1         2        1        13         1    2         2        1     6
    ## 4         2        1        10         2    1         2        1     4
    ## 7         2        8        12         1    2         2        1     6
    ## 9         2        8         8         1    1         2        1     4
    ## 11        2        2        13         1    1         2        1     4
    ## 12        2        8         8         1    2         2        1     5
    ##    INCOME2 X_SMOKER3 DIABETE3 X_BMI5CAT EXERANY2 RMVTETH5 CVDINFR5
    ## 1        6         4        3         2        2        2        1
    ## 4        3         4        3         3        1        2        1
    ## 7        8         4        3         2        1        1        1
    ## 9        8         3        1         3        2        1        1
    ## 11       4         3        3         3        2        3        1
    ## 12       6         4        3         4        1        1        1
    ## 
    ## > tail(BRFSS_e)
    ##        CVDINFR4 RMVTETH4 X_AGEG5YR X_DENVST3 SEX1 X_HISPANC X_MRACE1 EDUCA
    ## 437429        2        2        10         2    2         1        1     5
    ## 437430        2        8         7         2    1         1        1     4
    ## 437432        2        2        11         2    2         1        1     5
    ## 437433        2        1        10         9    2         1        1     6
    ## 437434        2        2        12         2    2         1        6     2
    ## 437435        2        1        12         2    2         1        1     6
    ##        INCOME2 X_SMOKER3 DIABETE3 X_BMI5CAT EXERANY2 RMVTETH5 CVDINFR5
    ## 437429       3         4        3         3        1        3        1
    ## 437430       3         4        3         3        2        1        1
    ## 437432      77         4        3         1        1        3        1
    ## 437433       5         4        3        NA        1        2        1
    ## 437434       1         3        3         4        2        3        1
    ## 437435       3         1        4         3        1        2        1
    ## 
    ## > BRFSS_f <- BRFSS_e
    ## 
    ## > BRFSS_f$SEX <- 9
    ## 
    ## > BRFSS_f$SEX[BRFSS_f$SEX1 == 1] <- 1
    ## 
    ## > BRFSS_f$SEX[BRFSS_f$SEX1 == 2] <- 2
    ## 
    ## > table(BRFSS_f$SEX)
    ## 
    ##      1      2      9 
    ## 118634 154490    674 
    ## 
    ## > BRFSS_g <- subset(BRFSS_b, )
    ## 
    ## > BRFSS_f$MALE <- 0
    ## 
    ## > BRFSS_f$MALE[BRFSS_f$SEX == 1] <- 1
    ## 
    ## > table(BRFSS_f$MALE, BRFSS_f$SEX)
    ##    
    ##          1      2      9
    ##   0      0 154490    674
    ##   1 118634      0      0
    ## 
    ## > BRFSS_f$HISPANIC <- 0
    ## 
    ## > BRFSS_f$HISPANIC[BRFSS_f$X_HISPANC == 1] <- 1
    ## 
    ## > table(BRFSS_f$HISPANIC, BRFSS_f$X_HISPANC)
    ##    
    ##          1      2      9
    ##   0      0 256847   2997
    ##   1  13954      0      0
    ## 
    ## > BRFSS_f$RACEGRP <- 9
    ## 
    ## > BRFSS_f$RACEGRP[BRFSS_f$X_MRACE1 == 1] <- 1
    ## 
    ## > BRFSS_f$RACEGRP[BRFSS_f$X_MRACE1 == 2] <- 2
    ## 
    ## > BRFSS_f$RACEGRP[BRFSS_f$X_MRACE1 == 3] <- 3
    ## 
    ## > BRFSS_f$RACEGRP[BRFSS_f$X_MRACE1 == 4] <- 4
    ## 
    ## > BRFSS_f$RACEGRP[BRFSS_f$X_MRACE1 == 5] <- 5
    ## 
    ## > BRFSS_f$RACEGRP[BRFSS_f$X_MRACE1 == 6 | BRFSS_f$X_MRACE1 == 
    ## +     7] <- 6
    ## 
    ## > table(BRFSS_f$RACEGRP, BRFSS_f$X_MRACE1)
    ##    
    ##          1      2      3      4      5      6      7     77     99
    ##   1 227375      0      0      0      0      0      0      0      0
    ##   2      0  21215      0      0      0      0      0      0      0
    ##   3      0      0   4784      0      0      0      0      0      0
    ##   4      0      0      0   3871      0      0      0      0      0
    ##   5      0      0      0      0   1066      0      0      0      0
    ##   6      0      0      0      0      0   5292   4572      0      0
    ##   9      0      0      0      0      0      0      0   1523   4096
    ## 
    ## > BRFSS_f$BLACK <- 0
    ## 
    ## > BRFSS_f$ASIAN <- 0
    ## 
    ## > BRFSS_f$OTHRACE <- 0
    ## 
    ## > BRFSS_f$BLACK[BRFSS_f$RACEGRP == 2] <- 1
    ## 
    ## > table(BRFSS_f$RACEGRP, BRFSS_f$BLACK)
    ##    
    ##          0      1
    ##   1 227375      0
    ##   2      0  21215
    ##   3   4784      0
    ##   4   3871      0
    ##   5   1066      0
    ##   6   9864      0
    ##   9   5623      0
    ## 
    ## > BRFSS_f$ASIAN[BRFSS_f$RACEGRP == 4] <- 1
    ## 
    ## > table(BRFSS_f$RACEGRP, BRFSS_f$ASIAN)
    ##    
    ##          0      1
    ##   1 227375      0
    ##   2  21215      0
    ##   3   4784      0
    ##   4      0   3871
    ##   5   1066      0
    ##   6   9864      0
    ##   9   5623      0
    ## 
    ## > BRFSS_f$OTHRACE[BRFSS_f$RACEGRP == 3 | BRFSS_f$RACEGRP == 
    ## +     5 | BRFSS_f$RACEGRP == 6 | BRFSS_f$RACEGRP == 7] <- 1
    ## 
    ## > table(BRFSS_f$RACEGRP, BRFSS_f$OTHRACE)
    ##    
    ##          0      1
    ##   1 227375      0
    ##   2  21215      0
    ##   3      0   4784
    ##   4   3871      0
    ##   5      0   1066
    ##   6      0   9864
    ##   9   5623      0
    ## 
    ## > BRFSS_f$AGE[BRFSS_f$X_AGEG5YR < 9] <- 1
    ## 
    ## > BRFSS_f$AGE[BRFSS_f$X_AGEG5YR > 8 & BRFSS_f$X_AGEG5YR < 
    ## +     11] <- 2
    ## 
    ## > BRFSS_f$AGE[BRFSS_f$X_AGEG5YR > 10] <- 3
    ## 
    ## > table(BRFSS_f$X_AGEG5YR, BRFSS_f$AGE)
    ##     
    ##          1     2     3
    ##   7  34378     0     0
    ##   8  41209     0     0
    ##   9      0 45797     0
    ##   10     0 45915     0
    ##   11     0     0 39322
    ##   12     0     0 27257
    ##   13     0     0 32231
    ##   14     0     0  7689
    ## 
    ## > BRFSS_f$AGE1 <- 0
    ## 
    ## > BRFSS_f$AGE2 <- 0
    ## 
    ## > BRFSS_f$AGE3 <- 0
    ## 
    ## > BRFSS_f$AGE1[BRFSS_f$AGE == 1] <- 1
    ## 
    ## > table(BRFSS_f$AGE, BRFSS_f$AGE1)
    ##    
    ##          0      1
    ##   1      0  75587
    ##   2  91712      0
    ##   3 106499      0
    ## 
    ## > BRFSS_f$AGE2[BRFSS_f$AGE == 2] <- 1
    ## 
    ## > table(BRFSS_f$AGE, BRFSS_f$AGE2)
    ##    
    ##          0      1
    ##   1  75587      0
    ##   2      0  91712
    ##   3 106499      0
    ## 
    ## > BRFSS_f$AGE3[BRFSS_f$AGE == 3] <- 1
    ## 
    ## > table(BRFSS_f$AGE, BRFSS_f$AGE3)
    ##    
    ##          0      1
    ##   1  75587      0
    ##   2  91712      0
    ##   3      0 106499
    ## 
    ## > BRFSS_f$EDGRP <- 9
    ## 
    ## > BRFSS_f$EDGRP[BRFSS_f$EDUCA < 4] <- 1
    ## 
    ## > BRFSS_f$EDGRP[BRFSS_f$EDUCA == 4] <- 2
    ## 
    ## > BRFSS_f$EDGRP[BRFSS_f$EDUCA == 5] <- 3
    ## 
    ## > BRFSS_f$EDGRP[BRFSS_f$EDUCA == 6] <- 4
    ## 
    ## > table(BRFSS_f$EDUCA, BRFSS_f$EDGRP)
    ##    
    ##          1      2      3      4      9
    ##   1    383      0      0      0      0
    ##   2   6518      0      0      0      0
    ##   3  12900      0      0      0      0
    ##   4      0  75498      0      0      0
    ##   5      0      0  74082      0      0
    ##   6      0      0      0 103387      0
    ##   9      0      0      0      0   1024
    ## 
    ## > BRFSS_f$LOWED <- 0
    ## 
    ## > BRFSS_f$HIGHSCOOL <- 0
    ## 
    ## > BRFSS_f$SOMECOL <- 0
    ## 
    ## > BRFSS_f$COLLEGE <- 0
    ## 
    ## > BRFSS_f$LOWED[BRFSS_f$EDGRP == 1] <- 1
    ## 
    ## > BRFSS_f$HIGHSCOOL[BRFSS_f$EDGR == 2] <- 1
    ## 
    ## > BRFSS_f$SOMECOL[BRFSS_f$EDGR == 3] <- 1
    ## 
    ## > BRFSS_f$COLLEGE[BRFSS_f$EDGR == 4] <- 1
    ## 
    ## > table(BRFSS_f$EDGRP, BRFSS_f$LOWED)
    ##    
    ##          0      1
    ##   1      0  19801
    ##   2  75498      0
    ##   3  74082      0
    ##   4 103387      0
    ##   9   1030      0
    ## 
    ## > table(BRFSS_f$EDGRP, BRFSS_f$HIGHSCOOL)
    ##    
    ##          0      1
    ##   1  19801      0
    ##   2      0  75498
    ##   3  74082      0
    ##   4 103387      0
    ##   9   1030      0
    ## 
    ## > table(BRFSS_f$EDGRP, BRFSS_f$SOMECOL)
    ##    
    ##          0      1
    ##   1  19801      0
    ##   2  75498      0
    ##   3      0  74082
    ##   4 103387      0
    ##   9   1030      0
    ## 
    ## > table(BRFSS_f$EDGRP, BRFSS_f$COLLEGE)
    ##    
    ##          0      1
    ##   1  19801      0
    ##   2  75498      0
    ##   3  74082      0
    ##   4      0 103387
    ##   9   1030      0
    ## 
    ## > BRFSS_f$INCOME3 <- 9
    ## 
    ## > BRFSS_f$INCOME3[BRFSS_f$INCOME2 < 3] <- 1
    ## 
    ## > BRFSS_f$INCOME3[BRFSS_f$INCOME2 > 2 & BRFSS_f$INCOME2 < 
    ## +     5] <- 2
    ## 
    ## > BRFSS_f$INCOME3[BRFSS_f$INCOME2 > 4 & BRFSS_f$INCOME2 < 
    ## +     6] <- 3
    ## 
    ## > BRFSS_f$INCOME3[BRFSS_f$INCOME2 == 6] <- 4
    ## 
    ## > BRFSS_f$INCOME3[BRFSS_f$INCOME2 > 6 & BRFSS_f$INCOME2 < 
    ## +     9] <- 5
    ## 
    ## > table(BRFSS_f$INCOME2, BRFSS_f$INCOME3)
    ##     
    ##          1     2     3     4     5     9
    ##   1   9565     0     0     0     0     0
    ##   2  12302     0     0     0     0     0
    ##   3      0 16266     0     0     0     0
    ##   4      0 20342     0     0     0     0
    ##   5      0     0 24249     0     0     0
    ##   6      0     0     0 31763     0     0
    ##   7      0     0     0     0 36639     0
    ##   8      0     0     0     0 72393     0
    ##   77     0     0     0     0     0 18506
    ##   99     0     0     0     0     0 29593
    ## 
    ## > BRFSS_f$INC1 <- 0
    ## 
    ## > BRFSS_f$INC2 <- 0
    ## 
    ## > BRFSS_f$INC3 <- 0
    ## 
    ## > BRFSS_f$INC4 <- 0
    ## 
    ## > BRFSS_f$INC1[BRFSS_f$INCOME3 == 1] <- 1
    ## 
    ## > BRFSS_f$INC2[BRFSS_f$INCOME3 == 2] <- 1
    ## 
    ## > BRFSS_f$INC3[BRFSS_f$INCOME3 == 3] <- 1
    ## 
    ## > BRFSS_f$INC4[BRFSS_f$INCOME3 == 4] <- 1
    ## 
    ## > BRFSS_f$INC5[BRFSS_f$INCOME3 == 5] <- 1
    ## 
    ## > table(BRFSS_f$INCOME3, BRFSS_f$INC1)
    ##    
    ##          0      1
    ##   1      0  21867
    ##   2  36608      0
    ##   3  24249      0
    ##   4  31763      0
    ##   5 109032      0
    ##   9  50279      0
    ## 
    ## > table(BRFSS_f$INCOME3, BRFSS_f$INC2)
    ##    
    ##          0      1
    ##   1  21867      0
    ##   2      0  36608
    ##   3  24249      0
    ##   4  31763      0
    ##   5 109032      0
    ##   9  50279      0
    ## 
    ## > table(BRFSS_f$INCOME3, BRFSS_f$INC3)
    ##    
    ##          0      1
    ##   1  21867      0
    ##   2  36608      0
    ##   3      0  24249
    ##   4  31763      0
    ##   5 109032      0
    ##   9  50279      0
    ## 
    ## > table(BRFSS_f$INCOME3, BRFSS_f$INC4)
    ##    
    ##          0      1
    ##   1  21867      0
    ##   2  36608      0
    ##   3  24249      0
    ##   4      0  31763
    ##   5 109032      0
    ##   9  50279      0
    ## 
    ## > table(BRFSS_f$INCOME3, BRFSS_f$INC5)
    ##    
    ##          1
    ##   1      0
    ##   2      0
    ##   3      0
    ##   4      0
    ##   5 109032
    ##   9      0
    ## 
    ## > BRFSS_f$DENVST[BRFSS_f$X_DENVST3 == 1] <- 1
    ## 
    ## > BRFSS_f$NODENVST[BRFSS_f$X_DENVST3 == 2] <- 1
    ## 
    ## > table(BRFSS_f$X_DENVST3, BRFSS_f$DENVST)
    ##    
    ##          1
    ##   1 189676
    ##   2      0
    ##   9      0
    ## 
    ## > table(BRFSS_f$X_DENVST3, BRFSS_f$NODENVST)
    ##    
    ##         1
    ##   1     0
    ##   2 81445
    ##   9     0
    ## 
    ## > BRFSS_f$SMK <- 9
    ## 
    ## > BRFSS_f$SMK[BRFSS_f$X_SMOKER3 < 3] <- 3
    ## 
    ## > BRFSS_f$SMK[BRFSS_f$X_SMOKER3 == 3] <- 2
    ## 
    ## > BRFSS_f$SMK[BRFSS_f$X_SMOKER3 == 4] <- 1
    ## 
    ## > table(BRFSS_f$X_SMOKER3, BRFSS_f$SMK)
    ##    
    ##          1      2      3      9
    ##   1      0      0  24384      0
    ##   2      0      0   8789      0
    ##   3      0  89174      0      0
    ##   4 141915      0      0      0
    ##   9      0      0      0   9536
    ## 
    ## > BRFSS_f$NEVERSMK <- 0
    ## 
    ## > BRFSS_f$FRMRSMK <- 0
    ## 
    ## > BRFSS_f$SMOKE <- 0
    ## 
    ## > BRFSS_f$NEVERSMK[BRFSS_f$SMK == 1] <- 1
    ## 
    ## > BRFSS_f$FRMRSMK[BRFSS_f$SMK == 2] <- 1
    ## 
    ## > BRFSS_f$SMOKE[BRFSS_f$SMK == 3] <- 1
    ## 
    ## > BRFSS_f$DIABETE4 <- 9
    ## 
    ## > BRFSS_f$DIABETE4[BRFSS_f$DIABETE3 == 1] <- 1
    ## 
    ## > BRFSS_f$DIABETE4[BRFSS_f$DIABETE3 > 1 & BRFSS_f$DIABETE3 < 
    ## +     5] <- 2
    ## 
    ## > table(BRFSS_f$DIABETE3, BRFSS_f$DIABETE4)
    ##    
    ##          1      2      9
    ##   1  51226      0      0
    ##   2      0   1604      0
    ##   3      0 214321      0
    ##   4      0   6307      0
    ##   7      0      0    281
    ##   9      0      0     59
    ## 
    ## > BRFSS_f$HASDIABETES <- 0
    ## 
    ## > BRFSS_f$NODIABETES <- 0
    ## 
    ## > BRFSS_f$HASDIABETES[BRFSS_f$DIABETE4 == 1] <- 1
    ## 
    ## > BRFSS_f$NODIABETES[BRFSS_f$DIABETE4 == 2] <- 1
    ## 
    ## > table(BRFSS_f$DIABETE4, BRFSS_f$HASDIABETES)
    ##    
    ##          0      1
    ##   1      0  51226
    ##   2 222232      0
    ##   9    340      0
    ## 
    ## > table(BRFSS_f$DIABETE4, BRFSS_f$NODIABETES)
    ##    
    ##          0      1
    ##   1  51226      0
    ##   2      0 222232
    ##   9    340      0
    ## 
    ## > BRFSS_f$PA <- 9
    ## 
    ## > BRFSS_f$PA[BRFSS_f$EXERANY2 == 1] <- 1
    ## 
    ## > BRFSS_f$PA[BRFSS_f$EXERANY2 == 2] <- 2
    ## 
    ## > table(BRFSS_f$PA, BRFSS_f$EXERANY2)
    ##    
    ##          1      2      7      9
    ##   1 196927      0      0      0
    ##   2      0  76437      0      0
    ##   9      0      0    332    100
    ## 
    ## > BRFSS_f$NOEXER <- 0
    ## 
    ## > BRFSS_f$NOEXER[BRFSS_f$PA == 2] <- 1
    ## 
    ## > table(BRFSS_f$NOEXER, BRFSS_f$PA)
    ##    
    ##          1      2      9
    ##   0 196927      0    434
    ##   1      0  76437      0
    ## 
    ## > BRFSS_f$BMICAT <- 9
    ## 
    ## > BRFSS_f$BMICAT[BRFSS_f$X_BMI5CAT == 1] <- 1
    ## 
    ## > BRFSS_f$BMICAT[BRFSS_f$X_BMI5CAT == 2] <- 2
    ## 
    ## > BRFSS_f$BMICAT[BRFSS_f$X_BMI5CAT == 3] <- 3
    ## 
    ## > BRFSS_f$BMICAT[BRFSS_f$X_BMI5CAT == 4] <- 4
    ## 
    ## > table(BRFSS_f$BMICAT, BRFSS_f$X_BMI5CAT)
    ##    
    ##         1     2     3     4
    ##   1  3852     0     0     0
    ##   2     0 73226     0     0
    ##   3     0     0 95146     0
    ##   4     0     0     0 81396
    ##   9     0     0     0     0
    ## 
    ## > BRFSS_f$UNDWT <- 0
    ## 
    ## > BRFSS_f$OVWT <- 0
    ## 
    ## > BRFSS_f$OBESE <- 0
    ## 
    ## > BRFSS_f$UNDWT[BRFSS_f$BMICAT == 1] <- 1
    ## 
    ## > table(BRFSS_f$UNDWT, BRFSS_f$BMICAT)
    ##    
    ##         1     2     3     4     9
    ##   0     0 73226 95146 81396 20178
    ##   1  3852     0     0     0     0
    ## 
    ## > BRFSS_f$OVWT[BRFSS_f$BMICAT == 3] <- 1
    ## 
    ## > table(BRFSS_f$OVWT, BRFSS_f$BMICAT)
    ##    
    ##         1     2     3     4     9
    ##   0  3852 73226     0 81396 20178
    ##   1     0     0 95146     0     0
    ## 
    ## > BRFSS_f$OBESE[BRFSS_f$BMICAT == 4] <- 1
    ## 
    ## > table(BRFSS_f$OBESE, BRFSS_f$BMICAT)
    ##    
    ##         1     2     3     4     9
    ##   0  3852 73226 95146     0 20178
    ##   1     0     0     0 81396     0
    ## 
    ## > str(BRFSS_f)
    ## 'data.frame':    273798 obs. of  52 variables:
    ##  $ CVDINFR4   : num  2 2 2 2 2 2 2 2 2 2 ...
    ##  $ RMVTETH4   : num  1 1 8 8 2 8 1 2 1 3 ...
    ##  $ X_AGEG5YR  : num  13 10 12 8 13 8 11 12 10 11 ...
    ##  $ X_DENVST3  : num  1 2 1 1 1 1 2 1 1 2 ...
    ##  $ SEX1       : num  2 1 2 1 1 2 2 2 2 1 ...
    ##  $ X_HISPANC  : num  2 2 2 2 2 2 2 2 2 2 ...
    ##  $ X_MRACE1   : num  1 1 1 1 1 1 1 2 1 1 ...
    ##  $ EDUCA      : num  6 4 6 4 4 5 4 3 3 5 ...
    ##  $ INCOME2    : num  6 3 8 8 4 6 4 2 2 7 ...
    ##  $ X_SMOKER3  : num  4 4 4 3 3 4 4 4 4 4 ...
    ##  $ DIABETE3   : num  3 3 3 1 3 3 1 3 1 3 ...
    ##  $ X_BMI5CAT  : num  2 3 2 3 3 4 4 4 4 4 ...
    ##  $ EXERANY2   : num  2 1 1 2 2 1 2 2 1 1 ...
    ##  $ RMVTETH5   : num  2 2 1 1 3 1 2 3 2 4 ...
    ##  $ CVDINFR5   : num  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ SEX        : num  2 1 2 1 1 2 2 2 2 1 ...
    ##  $ MALE       : num  0 1 0 1 1 0 0 0 0 1 ...
    ##  $ HISPANIC   : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ RACEGRP    : num  1 1 1 1 1 1 1 2 1 1 ...
    ##  $ BLACK      : num  0 0 0 0 0 0 0 1 0 0 ...
    ##  $ ASIAN      : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ OTHRACE    : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ AGE        : num  3 2 3 1 3 1 3 3 2 3 ...
    ##  $ AGE1       : num  0 0 0 1 0 1 0 0 0 0 ...
    ##  $ AGE2       : num  0 1 0 0 0 0 0 0 1 0 ...
    ##  $ AGE3       : num  1 0 1 0 1 0 1 1 0 1 ...
    ##  $ EDGRP      : num  4 2 4 2 2 3 2 1 1 3 ...
    ##  $ LOWED      : num  0 0 0 0 0 0 0 1 1 0 ...
    ##  $ HIGHSCOOL  : num  0 1 0 1 1 0 1 0 0 0 ...
    ##  $ SOMECOL    : num  0 0 0 0 0 1 0 0 0 1 ...
    ##  $ COLLEGE    : num  1 0 1 0 0 0 0 0 0 0 ...
    ##  $ INCOME3    : num  4 2 5 5 2 4 2 1 1 5 ...
    ##  $ INC1       : num  0 0 0 0 0 0 0 1 1 0 ...
    ##  $ INC2       : num  0 1 0 0 1 0 1 0 0 0 ...
    ##  $ INC3       : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ INC4       : num  1 0 0 0 0 1 0 0 0 0 ...
    ##  $ INC5       : num  NA NA 1 1 NA NA NA NA NA 1 ...
    ##  $ DENVST     : num  1 NA 1 1 1 1 NA 1 1 NA ...
    ##  $ NODENVST   : num  NA 1 NA NA NA NA 1 NA NA 1 ...
    ##  $ SMK        : num  1 1 1 2 2 1 1 1 1 1 ...
    ##  $ NEVERSMK   : num  1 1 1 0 0 1 1 1 1 1 ...
    ##  $ FRMRSMK    : num  0 0 0 1 1 0 0 0 0 0 ...
    ##  $ SMOKE      : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ DIABETE4   : num  2 2 2 1 2 2 1 2 1 2 ...
    ##  $ HASDIABETES: num  0 0 0 1 0 0 1 0 1 0 ...
    ##  $ NODIABETES : num  1 1 1 0 1 1 0 1 0 1 ...
    ##  $ PA         : num  2 1 1 2 2 1 2 2 1 1 ...
    ##  $ NOEXER     : num  1 0 0 1 1 0 1 1 0 0 ...
    ##  $ BMICAT     : num  2 3 2 3 3 4 4 4 4 4 ...
    ##  $ UNDWT      : num  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ OVWT       : num  0 1 0 1 1 0 0 0 0 0 ...
    ##  $ OBESE      : num  0 0 0 0 0 1 1 1 1 1 ...
    ## 
    ## > head(BRFSS_f)
    ##    CVDINFR4 RMVTETH4 X_AGEG5YR X_DENVST3 SEX1 X_HISPANC X_MRACE1 EDUCA
    ## 1         2        1        13         1    2         2        1     6
    ## 4         2        1        10         2    1         2        1     4
    ## 7         2        8        12         1    2         2        1     6
    ## 9         2        8         8         1    1         2        1     4
    ## 11        2        2        13         1    1         2        1     4
    ## 12        2        8         8         1    2         2        1     5
    ##    INCOME2 X_SMOKER3 DIABETE3 X_BMI5CAT EXERANY2 RMVTETH5 CVDINFR5 SEX
    ## 1        6         4        3         2        2        2        1   2
    ## 4        3         4        3         3        1        2        1   1
    ## 7        8         4        3         2        1        1        1   2
    ## 9        8         3        1         3        2        1        1   1
    ## 11       4         3        3         3        2        3        1   1
    ## 12       6         4        3         4        1        1        1   2
    ##    MALE HISPANIC RACEGRP BLACK ASIAN OTHRACE AGE AGE1 AGE2 AGE3 EDGRP
    ## 1     0        0       1     0     0       0   3    0    0    1     4
    ## 4     1        0       1     0     0       0   2    0    1    0     2
    ## 7     0        0       1     0     0       0   3    0    0    1     4
    ## 9     1        0       1     0     0       0   1    1    0    0     2
    ## 11    1        0       1     0     0       0   3    0    0    1     2
    ## 12    0        0       1     0     0       0   1    1    0    0     3
    ##    LOWED HIGHSCOOL SOMECOL COLLEGE INCOME3 INC1 INC2 INC3 INC4 INC5 DENVST
    ## 1      0         0       0       1       4    0    0    0    1   NA      1
    ## 4      0         1       0       0       2    0    1    0    0   NA     NA
    ## 7      0         0       0       1       5    0    0    0    0    1      1
    ## 9      0         1       0       0       5    0    0    0    0    1      1
    ## 11     0         1       0       0       2    0    1    0    0   NA      1
    ## 12     0         0       1       0       4    0    0    0    1   NA      1
    ##    NODENVST SMK NEVERSMK FRMRSMK SMOKE DIABETE4 HASDIABETES NODIABETES PA
    ## 1        NA   1        1       0     0        2           0          1  2
    ## 4         1   1        1       0     0        2           0          1  1
    ## 7        NA   1        1       0     0        2           0          1  1
    ## 9        NA   2        0       1     0        1           1          0  2
    ## 11       NA   2        0       1     0        2           0          1  2
    ## 12       NA   1        1       0     0        2           0          1  1
    ##    NOEXER BMICAT UNDWT OVWT OBESE
    ## 1       1      2     0    0     0
    ## 4       0      3     0    1     0
    ## 7       0      2     0    0     0
    ## 9       1      3     0    1     0
    ## 11      1      3     0    1     0
    ## 12      0      4     0    0     1
    ## 
    ## > tail(BRFSS_f)
    ##        CVDINFR4 RMVTETH4 X_AGEG5YR X_DENVST3 SEX1 X_HISPANC X_MRACE1 EDUCA
    ## 437429        2        2        10         2    2         1        1     5
    ## 437430        2        8         7         2    1         1        1     4
    ## 437432        2        2        11         2    2         1        1     5
    ## 437433        2        1        10         9    2         1        1     6
    ## 437434        2        2        12         2    2         1        6     2
    ## 437435        2        1        12         2    2         1        1     6
    ##        INCOME2 X_SMOKER3 DIABETE3 X_BMI5CAT EXERANY2 RMVTETH5 CVDINFR5 SEX
    ## 437429       3         4        3         3        1        3        1   2
    ## 437430       3         4        3         3        2        1        1   1
    ## 437432      77         4        3         1        1        3        1   2
    ## 437433       5         4        3        NA        1        2        1   2
    ## 437434       1         3        3         4        2        3        1   2
    ## 437435       3         1        4         3        1        2        1   2
    ##        MALE HISPANIC RACEGRP BLACK ASIAN OTHRACE AGE AGE1 AGE2 AGE3 EDGRP
    ## 437429    0        1       1     0     0       0   2    0    1    0     3
    ## 437430    1        1       1     0     0       0   1    1    0    0     2
    ## 437432    0        1       1     0     0       0   3    0    0    1     3
    ## 437433    0        1       1     0     0       0   2    0    1    0     4
    ## 437434    0        1       6     0     0       1   3    0    0    1     1
    ## 437435    0        1       1     0     0       0   3    0    0    1     4
    ##        LOWED HIGHSCOOL SOMECOL COLLEGE INCOME3 INC1 INC2 INC3 INC4 INC5
    ## 437429     0         0       1       0       2    0    1    0    0   NA
    ## 437430     0         1       0       0       2    0    1    0    0   NA
    ## 437432     0         0       1       0       9    0    0    0    0   NA
    ## 437433     0         0       0       1       3    0    0    1    0   NA
    ## 437434     1         0       0       0       1    1    0    0    0   NA
    ## 437435     0         0       0       1       2    0    1    0    0   NA
    ##        DENVST NODENVST SMK NEVERSMK FRMRSMK SMOKE DIABETE4 HASDIABETES
    ## 437429     NA        1   1        1       0     0        2           0
    ## 437430     NA        1   1        1       0     0        2           0
    ## 437432     NA        1   1        1       0     0        2           0
    ## 437433     NA       NA   1        1       0     0        2           0
    ## 437434     NA        1   2        0       1     0        2           0
    ## 437435     NA        1   3        0       0     1        2           0
    ##        NODIABETES PA NOEXER BMICAT UNDWT OVWT OBESE
    ## 437429          1  1      0      3     0    1     0
    ## 437430          1  2      1      3     0    1     0
    ## 437432          1  1      0      1     1    0     0
    ## 437433          1  1      0      9     0    0     0
    ## 437434          1  2      1      4     0    0     1
    ## 437435          1  1      0      3     0    1     0

### Write Out Data Set

``` r
source("190_Write out analytic.R", echo = TRUE)
```

    ## 
    ## > BRFSS <- BRFSS_f
    ## 
    ## > write.csv(BRFSS, file = "./data/BRFSS.csv")
    ## 
    ## > nrow(BRFSS)
    ## [1] 273798
    ## 
    ## > ncol(BRFSS)
    ## [1] 52
    ## 
    ## > colnames(BRFSS)
    ##  [1] "CVDINFR4"    "RMVTETH4"    "X_AGEG5YR"   "X_DENVST3"   "SEX1"       
    ##  [6] "X_HISPANC"   "X_MRACE1"    "EDUCA"       "INCOME2"     "X_SMOKER3"  
    ## [11] "DIABETE3"    "X_BMI5CAT"   "EXERANY2"    "RMVTETH5"    "CVDINFR5"   
    ## [16] "SEX"         "MALE"        "HISPANIC"    "RACEGRP"     "BLACK"      
    ## [21] "ASIAN"       "OTHRACE"     "AGE"         "AGE1"        "AGE2"       
    ## [26] "AGE3"        "EDGRP"       "LOWED"       "HIGHSCOOL"   "SOMECOL"    
    ## [31] "COLLEGE"     "INCOME3"     "INC1"        "INC2"        "INC3"       
    ## [36] "INC4"        "INC5"        "DENVST"      "NODENVST"    "SMK"        
    ## [41] "NEVERSMK"    "FRMRSMK"     "SMOKE"       "DIABETE4"    "HASDIABETES"
    ## [46] "NODIABETES"  "PA"          "NOEXER"      "BMICAT"      "UNDWT"      
    ## [51] "OVWT"        "OBESE"      
    ## 
    ## > data_dictionary <- describe(BRFSS)
    ## 
    ## > sink("./documentation/data_dictionary.txt", append = TRUE)

### Calculate Frequency Totals

``` r
source("200_Calculate totals.R", echo = TRUE)
```

    ## 
    ## > BRFSS <- read.csv(file = "./data/BRFSS.csv", header = TRUE, 
    ## +     sep = ",")
    ## 
    ## > nrow(BRFSS)
    ## [1] 273798
    ## 
    ## > TeethFreq <- table(BRFSS$RMVTETH5)
    ## 
    ## > TeethFreq
    ## 
    ##      1      2      3      4 
    ## 109271  92422  44955  27150 
    ## 
    ## > write.csv(TeethFreq, file = "./data/teethFreq.csv")
    ## 
    ## > TeethFreq/nrow(BRFSS) * 100
    ## 
    ##        1        2        3        4 
    ## 39.90935 33.75554 16.41904  9.91607 
    ## 
    ## > cvdFreq <- table(BRFSS$CVDINFR5)
    ## 
    ## > cvdFreq
    ## 
    ##      0      1 
    ##  23361 250437 
    ## 
    ## > write.csv(cvdFreq, file = "./data/cvdFreq.csv")
    ## 
    ## > table(BRFSS$CVDINFR5, BRFSS$RMVTETH5)
    ##    
    ##          1      2      3      4
    ##   0   5446   7072   5957   4886
    ##   1 103825  85350  38998  22264
