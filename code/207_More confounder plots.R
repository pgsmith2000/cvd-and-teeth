# read in analytic table
BRFSS <- read.csv(file="../output/BRFSS.csv", header=TRUE, sep=",")

# recode variables as factors and add labels (levels)
BRFSS$DIABETE4 <- as.factor(BRFSS$DIABETE4)
levels(BRFSS$DIABETE4) <- c("Yes", "No", "NR")
BRFSS$SMOKER4 <- as.factor(BRFSS$SMOKER4)
levels(BRFSS$SMOKER4) <- c("NvrSmk", "FrmSmk", "Smk", "NR")
BRFSS$EXERANY3 <- as.factor(BRFSS$EXERANY3)
levels(BRFSS$EXERANY3) <- c("Yes", "No", "NR")
BRFSS$BMICAT <- as.factor(BRFSS$BMICAT)
levels(BRFSS$BMICAT) <- c("UndWt", "Norm", "OvrWt", "Obese", "NR")


# plot diabetes
p1 <- ggplot(BRFSS, aes(DIABETE4, fill=DIABETE4))
p1 <- p1 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Diabetes",
       x="", y="")

# plot smoker
p2 <- ggplot(BRFSS, aes(SMOKER4, fill=SMOKER4))
p2 <- p2 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Smoker",
       x="", y="")

# plot exercise
p3 <- ggplot(BRFSS, aes(EXERANY3, fill=EXERANY3))
p3 <- p3 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Exercise",
       x="", y="")

# plot BMI
p4 <- ggplot(BRFSS, aes(BMICAT, fill=BMICAT))
p4 <- p4 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="BMI Category",
       x="", y="")

# print plots
grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)

g <- arrangeGrob(p1, p2, p3, p4, nrow=2, ncol=2) #generates g
ggsave(file="../output/figures/more_confounders.png", g) #saves g
