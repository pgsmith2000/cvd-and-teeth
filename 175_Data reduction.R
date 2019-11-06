# remove those with don't know or missing heart disease
BRFSS_d <- subset(BRFSS_c, BRFSS_c$CVDINFR5 != 9)
nrow(BRFSS_d)

# remove those with don't know/not sure/refused/blank in teeth variable
BRFSS_e <- subset(BRFSS_d, BRFSS_d$RMVTETH5 != 9)
nrow(BRFSS_d)

# remove those with don't know/not sure/refused in sex variable
BRFSS_f <- subset(BRFSS_e, BRFSS_e$SEX2 != 9)
nrow(BRFSS_f)

# remove those with don't know/not sure/refused/missing in hispanic variable
BRFSS_g <- subset(BRFSS_f, BRFSS_f$HISPANIC != 9)
nrow(BRFSS_g)

# remove those with don't know/not sure/refused/missing or in race variable
BRFSS_h <- subset(BRFSS_g, BRFSS_g$RACEGRP != 9)
nrow(BRFSS_h)

# remove those with don't know/not sure/refused/blank or under 50 in age variable
BRFSS_i <- subset(BRFSS_h, BRFSS_h$AGEG5YR2 != 9)
nrow(BRFSS_i)

# remove those with missing in the education variable
BRFSS_j <- subset(BRFSS_i, BRFSS_i$EDGRP != 9)
nrow(BRFSS_j)

# remove those with don't know or missing in income variable
BRFSS_k <- subset(BRFSS_j, BRFSS_j$INCOME3 != 9)
nrow(BRFSS_d)

# remove those with don't know/not sure/refused/missing in dentst variable
BRFSS_l <- subset(BRFSS_k, BRFSS_k$DENVST4 != 9)
nrow(BRFSS_l)

# remove those with don't know/not sure/refused/missing in diabetes variable
BRFSS_m <- subset(BRFSS_l, BRFSS_l$DIABETE4 != 9)
nrow(BRFSS_m)

# remove those with don't know/not sure/refused/missing in smoker variable
BRFSS_n <- subset(BRFSS_m, BRFSS_m$SMOKER4 != 9)
nrow(BRFSS_n)

# remove those with don't know/not sure/refused/missing in exercise variable
BRFSS_o <- subset(BRFSS_n, BRFSS_n$EXERANY3 != 9)
nrow(BRFSS_o)

# remove those with don't know/not sure/refused/missing in bmi variable
BRFSS_p <- subset(BRFSS_o, BRFSS_o$BMICAT != 9)
nrow(BRFSS_p)
