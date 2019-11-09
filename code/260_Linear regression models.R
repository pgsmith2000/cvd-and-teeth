# read in the data set
BRFSS <- read.csv(file = "../output/BRFSS.csv", header=TRUE, sep=",")

str(BRFSS)
summary(BRFSS)

model1 <- lm(CVDINFR5 ~ RMVTETH5, data = BRFSS)
summary(model1)

model2 <- lm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH, data = BRFSS)
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

reduced.model <- step(full.model,
                  direction = "backward")
summary(reduced.model)

tidy(model1)
tidy(model2)
tidy(full.model)
tidy(fwd.model)
tidy(reduced.model)

write.csv(tidy(model1), file = "../output/TidyRegressionModel1.csv")
write.csv(tidy(model2), file = "../output/TidyRegressionModel2.csv")
write.csv(tidy(full.model), file = "../output/TidyRegressionModelFull.csv")
write.csv(tidy(fwd.model), file = "../output/TidyRegressionModelFWD.csv")
write.csv(tidy(reduced.model), file = "../output/TidyRegressionModelBKWD.csv")

p1 <- dwplot(list(model1, model2, full.model),
             vline = geom_vline(xintercept = 0, color = "grey60", linetype = 2)) +
  theme_bw() + xlab("Coefficient Estimate") + ylab("") +
  geom_vline(xintercept = 0, colour = "grey60", linetype = 2) +
  ggtitle("Regression Coefficients by Model") +
  theme(plot.title = element_text(face="bold"),
        legend.position = c(0.007, 0.01),
        legend.justification = c(0, 0), 
        legend.background = element_rect(color="grey80"),
        legend.title = element_blank()) 
p1

percent(summary(model1)$adj.r.squared)
percent(summary(model2)$adj.r.squared)
percent(summary(full.model)$adj.r.squared)

summary(model1)$adj.r.squared
summary(model2)$adj.r.squared
summary(full.model)$adj.r.squared
