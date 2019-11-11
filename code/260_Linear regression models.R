# read in the data set
BRFSS <- read.csv(file = "../output/BRFSS.csv", header=TRUE, sep=",")

str(BRFSS)
summary(BRFSS)

model1 <- lm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH, data = BRFSS)
summary(model1)

model2 <- lm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH +
               MALE + AGE1 + AGE2 + AGE3, data = BRFSS)
summary(model2)

min.model <- lm(CVDINFR5 ~ 1, data = BRFSS)

fwd.model <- step(min.model, 
                  direction = "forward",
                  scope = ( ~ NOTEETH + FEWTEETH + MOSTTEETH +
                              MALE + BLACK + HISPANIC + ASIAN + OTHRACE +
                              AGE1 + AGE2 + AGE3 +
                              LOWED + SOMECOLL + COLLEGE +
                              INC1 + INC2 + INC3 + INC4 +
                              NODENVST + NODIABETE + FRMRSMK + SMOKE +
                              NOEXER + UNDWT + OVWT + OBESE)
                    )
summary(fwd.model)

full.model <- lm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH +
                   MALE + BLACK + HISPANIC + ASIAN + OTHRACE +
                   AGE1 + AGE2 + AGE3 +
                   LOWED + SOMECOLL + COLLEGE +
                   INC1 + INC2 + INC3 + INC4 +
                   NODENVST + NODIABETE + FRMRSMK + SMOKE +
                   NOEXER + UNDWT + OVWT + OBESE, data = BRFSS)
summary(full.model)

tidy(model1)
tidy(model2)
tidy(full.model)
tidy(fwd.model)

write.csv(tidy(model1), file = "../output/linear/TidyRegressionModel1.csv")
write.csv(tidy(model2), file = "../output/linear/TidyRegressionModel2.csv")
write.csv(tidy(full.model), file = "../output/linear/TidyRegressionModelFull.csv")
write.csv(tidy(fwd.model), file = "../output/linear/TidyRegressionModelFWD.csv")

percent(summary(model1)$adj.r.squared)
percent(summary(model2)$adj.r.squared)
percent(summary(full.model)$adj.r.squared)

summary(model1)$adj.r.squared
summary(model2)$adj.r.squared
summary(full.model)$adj.r.squared

dp1 <- autoplot(model1, label.size=3) + theme_minimal()
ggsave(file="../output/figures/lmodel1diagnostics.png", dp1) #saves g
dp2 <- autoplot(model2, label.size=3) + theme_minimal()
ggsave(file="../output/figures/lmodel2diagnostics.png", dp2) #saves g
dp3 <- autoplot(full.model, label.size=3) + theme_minimal()
ggsave(file="../output/figures/lmfulldiagnostics.png", dp3) #saves g

# Model fit for Model1
gvmodel <- gvlma(model1) 
summary(gvmodel)

# Model fit for Model2
gvmodel <- gvlma(model2) 
summary(gvmodel)

# Model fit for Full Model
gvmodel <- gvlma(full.model) 
summary(gvmodel)

