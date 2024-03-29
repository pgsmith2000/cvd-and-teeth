# recode sex variable
BRFSS_c$SEX2 <- 9
BRFSS_c$SEX2[BRFSS_c$SEX1 == 1] <- 1
BRFSS_c$SEX2[BRFSS_c$SEX1 == 2] <- 0

# check the recoding
table(BRFSS_c$SEX1, BRFSS_c$SEX2)

# Make indicator variable
BRFSS_c$MALE <- 0
BRFSS_c$MALE[BRFSS_c$SEX2 == 1] <- 1

# check the recoding
table(BRFSS_c$SEX2, BRFSS_c$MALE)

# recode HISPANC variable
BRFSS_c$HISPANC2 <- 9
BRFSS_c$HISPANC2[BRFSS_c$X_HISPANC == 1] <- 1
BRFSS_c$HISPANC2[BRFSS_c$X_HISPANC == 2] <- 0

# check the recoding
table(BRFSS_c$X_HISPANC, BRFSS_c$HISPANC2)

# make indicator variable
BRFSS_c$HISPANIC <- 0
BRFSS_c$HISPANIC[BRFSS_c$HISPANC2 == 1] <- 1

# check the recoding
table(BRFSS_c$HISPANC2, BRFSS_c$HISPANIC)

# recode race variable
BRFSS_c$RACEGRP <- 9
BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 1 & BRFSS_c$HISPANIC == 0] <- 0
BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 2 & BRFSS_c$HISPANIC == 0] <- 1
BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 3 & BRFSS_c$HISPANIC == 0] <- 4
BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 4 & BRFSS_c$HISPANIC == 0] <- 3
BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 5 & BRFSS_c$HISPANIC == 0] <- 4
BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 6 & BRFSS_c$HISPANIC == 0] <- 4
BRFSS_c$RACEGRP[BRFSS_c$X_MRACE1 == 7 & BRFSS_c$HISPANIC == 0] <- 4
BRFSS_c$RACEGRP[BRFSS_c$HISPANIC == 1] <- 2

# check the recoding
table(BRFSS_b$X_MRACE1, BRFSS_c$RACEGRP)

# make indicator variables
BRFSS_c$BLACK <- 0
BRFSS_c$ASIAN <- 0
BRFSS_c$OTHRACE <- 0

BRFSS_c$BLACK[BRFSS_c$RACEGRP == 1] <- 1
BRFSS_c$ASIAN[BRFSS_c$RACEGRP == 3] <- 1
BRFSS_c$OTHRACE[BRFSS_c$RACEGRP == 4] <- 1

# check the recoding
table(BRFSS_c$RACEGRP, BRFSS_c$BLACK)
table(BRFSS_c$RACEGRP, BRFSS_c$ASIAN)
table(BRFSS_c$RACEGRP, BRFSS_c$OTHRACE)

