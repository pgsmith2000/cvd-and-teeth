# read in BRFSS table
BRFSS <- read.csv(file="../output/BRFSS.csv", header=TRUE, sep=",")


logModel1 <- glm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH, 
                    data = BRFSS, family = "binomial") 
temp <-summary(logModel1)

logModel2 <- glm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH +
                   NODENVST + NODIABETE , 
                   data = BRFSS, family = "binomial") 
summary(logModel2)

# log full.model
logFullModel <- glm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH +
                 MALE + BLACK + HISPANIC + ASIAN + OTHRACE +
                 AGE1 + AGE2 + AGE3 +
                 LOWED + SOMECOLL + COLLEGE +
                 INC1 + INC2 + INC3 + INC4 +
                 NODENVST + NODIABETE + FRMRSMK + SMOKE +
                 NOEXER + UNDWT + OVWT + OBESE, 
                 data = BRFSS, family = "binomial") 
summary(logFullModel)

# remove SOMECOLL (not significant) log full.model
logFullModel <- glm(CVDINFR5 ~ NOTEETH + FEWTEETH + MOSTTEETH +
                      MALE + BLACK + HISPANIC + ASIAN + OTHRACE +
                      AGE1 + AGE2 + AGE3 +
                      LOWED + COLLEGE +
                      INC1 + INC2 + INC3 + INC4 +
                      NODENVST + NODIABETE + FRMRSMK + SMOKE +
                      NOEXER + UNDWT + OVWT + OBESE, 
                    data = BRFSS, family = "binomial") 
summary(logFullModel)

summary(logModel1)$aic
summary(logModel2)$aic
summary(logFullModel)$aic

logFullModelProb <- (summary(logFullModel)$aic -summary(logModel1)$aic)/2
logFullModelProb

#FINAL MODEL
#arrange covariates in order of table 1

FinalLogisticRegressionModel <- logFullModel
summary(FinalLogisticRegressionModel)

#write out CSV of final model
Tidy_LogModel_a <- tidy(FinalLogisticRegressionModel)
Tidy_LogFinal <- subset(Tidy_LogModel_a, term != "(Intercept)")

#Add calculations
Tidy_LogFinal$OR <- exp(Tidy_LogFinal$estimate)
Tidy_LogFinal$LL <- exp(Tidy_LogFinal$estimate - (1.96 * Tidy_LogFinal$std.error))
Tidy_LogFinal$UL <- exp(Tidy_LogFinal$estimate + (1.96 * Tidy_LogFinal$std.error))

write.csv(Tidy_LogFinal, file = "../output/logistical/LogisticRegressionModel.csv")

#visualize to help interpretation
p1 <- ggplot(Tidy_LogFinal, 
             aes(x = term, y = OR, ymin = LL, ymax = UL)) + 
  geom_pointrange(aes(col = factor(term)), 
                  position=position_dodge(width=0.30)) + 
  ylab("Odds ratio & 95% CI") + 
  geom_hline(aes(yintercept = 1)) + 
  scale_color_discrete(name = "Term") + 
  coord_flip() + 
  theme_minimal() + xlab("") + 
  ggtitle("Odds Probabilities for Full Logistical Regression Variables") +
  theme(legend.position = "none") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
p1

ggsave("../output/figures/OddsProbFullLogistialModel.png", p1)

