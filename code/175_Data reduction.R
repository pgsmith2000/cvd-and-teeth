# reduction for missing data in the segmenting variable
# remove those with don't know/not sure/refused/blank or under 50 in age variable
BRFSS_d <- subset(BRFSS_c, BRFSS_c$AGEG5YR2 != 9)
nrow(BRFSS_d)

# reduction for missing data in the dependent (outcome) variable
# remove those with don't know or missing heart disease
BRFSS_e <- subset(BRFSS_d, BRFSS_d$CVDINFR5 != 9)
nrow(BRFSS_e)

# reduction for missing data in the independent (exposure) variable
# remove those with don't know/not sure/refused/blank in teeth variable
BRFSS_f <- subset(BRFSS_e, BRFSS_e$RMVTETH5 != 9)
nrow(BRFSS_f)
