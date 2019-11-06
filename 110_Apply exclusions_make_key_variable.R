# Figure out the number of rows in the original dataset
nrow(BRFSS_b)

# only keep those over 50 yrs old
BRFSS_c <- subset(BRFSS_b, X_AGEG5YR > 6)

# count the rows
nrow(BRFSS_c)

# recode removed teeth variable
BRFSS_c$RMVTETH5 <- 9
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 8] <- 1
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 1] <- 2
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 2] <- 3
BRFSS_c$RMVTETH5[BRFSS_c$RMVTETH4 == 3] <- 4

# check the recode
table(BRFSS_c$RMVTETH4, BRFSS_c$RMVTETH5)

# remove those who answer don't know, refusonly keep rows with with valid alcohol/exposure variable
BRFSS_d <- subset(BRFSS_c, RMVTETH5 < 5)

# count rows in new dataset
nrow(BRFSS_d)

# recode heart attack variable
BRFSS_d$CVDINFR5 <- 9
BRFSS_d$CVDINFR5[BRFSS_d$CVDINFR4 == 1] <- 0
BRFSS_d$CVDINFR5[BRFSS_d$CVDINFR4 == 2] <- 1

# check the recode
table(BRFSS_d$CVDINFR4, BRFSS_d$CVDINFR5)

# only keep participants who answered yess or now to heart attack
BRFSS_e <- subset (BRFSS_d, CVDINFR5 < 2)

# check the recode again
table(BRFSS_e$CVDINFR4, BRFSS_e$CVDINFR5)

# count rows in new dataset - PARTICIPANTS
nrow(BRFSS_e)

# look at the breakdown by teeth
table(BRFSS_e$RMVTETH5)

# calculate percentages
(table(BRFSS_e$RMVTETH5)/nrow(BRFSS_e))*100

# in the 2010 study the % were 35.2 36.5 18.4 9.9

# look at the breakdown by heart attack
table(BRFSS_e$CVDINFR5)

# calculate percentages
(table(BRFSS_e$CVDINFR5)/nrow(BRFSS_e))*100


