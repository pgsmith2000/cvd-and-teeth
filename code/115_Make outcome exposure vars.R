# copy data set
BRFSS_c <- BRFSS_b

# recode heart attack variable
BRFSS_c$CVDINFR5 <- 9
BRFSS_c$CVDINFR5[BRFSS_c$CVDINFR4 == 1] <- 1
BRFSS_c$CVDINFR5[BRFSS_c$CVDINFR4 == 2] <- 0

# check the recoding
table(BRFSS_c$CVDINFR4, BRFSS_c$CVDINFR5)

# recode teeth variable
BRFSS_c$RMVTETH5 <- 9
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 8] <- 0
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 1] <- 1
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 2] <- 2
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 3] <- 3

# check the recoding
table(BRFSS_c$RMVTETH4, BRFSS_c$RMVTETH5)

# Make outcome indicator variables
BRFSS_c$MOSTTEETH <- 0
BRFSS_c$FEWTEETH <- 0
BRFSS_c$NOTEETH <- 0

BRFSS_c$MOSTTEETH[BRFSS_c$RMVTETH5 == 1] <- 1
BRFSS_c$FEWTEETH[BRFSS_c$RMVTETH5 == 2] <- 1
BRFSS_c$NOTEETH[BRFSS_c$RMVTETH5 == 3] <- 1

# check the recoding
table(BRFSS_c$RMVTETH5, BRFSS_c$MOSTTEETH)
table(BRFSS_c$RMVTETH5, BRFSS_c$FEWTEETH)
table(BRFSS_c$RMVTETH5, BRFSS_c$NOTEETH)

