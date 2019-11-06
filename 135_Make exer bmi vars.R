# recode exercise variable
BRFSS_c$EXERANY3 <- 9
BRFSS_c$EXERANY3[BRFSS_c$EXERANY2 == 1] <- 1
BRFSS_c$EXERANY3[BRFSS_c$EXERANY2 == 2] <- 0

table(BRFSS_c$EXERANY2, BRFSS_c$EXERANY3)

# Make indicator variable
BRFSS_c$NOEXER <- 0
BRFSS_c$NOEXER[BRFSS_c$EXERANY3 == 0] <- 1

table(BRFSS_c$EXERANY3, BRFSS_c$NOEXER)

# recode bmi variable
BRFSS_c$BMICAT <- 9
BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 1] <- 0
BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 2] <- 1
BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 3] <- 2
BRFSS_c$BMICAT[BRFSS_c$X_BMI5CAT == 4] <- 3

table(BRFSS_c$X_BMI5CAT, BRFSS_c$BMICAT)

# make indicator variables
BRFSS_c$UNDWT <- 0
BRFSS_c$OVWT <- 0
BRFSS_c$OBESE <- 0

BRFSS_c$UNDWT[BRFSS_c$BMICAT == 0] <- 1
BRFSS_c$OVWT[BRFSS_c$BMICAT == 2] <- 1
BRFSS_c$OBESE[BRFSS_c$BMICAT == 3] <- 1

table(BRFSS_c$BMICAT, BRFSS_c$UNDWT)
table(BRFSS_c$BMICAT, BRFSS_c$OVWT)
table(BRFSS_c$BMICAT, BRFSS_c$OBESE)
