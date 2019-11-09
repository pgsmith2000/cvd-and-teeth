# read in analytic table
BRFSS <- read.csv(file="../output/BRFSS.csv", header=TRUE, sep=",")

# recode variables as factors and add labels (levels)
BRFSS$CVDINFR5 <- as.factor(BRFSS$CVDINFR5)
levels(BRFSS$CVDINFR5) <- c("Yes", "No")
BRFSS$RMVTETH5 <- as.factor(BRFSS$RMVTETH5)
levels(BRFSS$RMVTETH5) <- c("None", "1-5", "6+", "All")
BRFSS$SEX2 <- as.factor(BRFSS$SEX2)
levels(BRFSS$SEX2) <- c("Female", "Male", "NR")
BRFSS$RACEGRP <- as.factor(BRFSS$RACEGRP)
levels(BRFSS$RACEGRP) <- c("White", "Black", "Hisp", "Asian", "Other", "NR")

# plot dependent (outcome) variable
p1 <- ggplot(BRFSS, aes(CVDINFR5, fill=CVDINFR5))
p1 <- p1 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Cardiovascular Disease",
       x="", y="")

# plot independent (exposure) variable
p2 <- ggplot(BRFSS, aes(RMVTETH5, fill=RMVTETH5))
p2 <- p2 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Teeth Removed",
       x="", y="")

# plot sex
p3 <- ggplot(BRFSS, aes(SEX2, fill=SEX2))
p3 <- p3 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Participant Sex",
       x="", y="")

# plot race
p4 <- ggplot(BRFSS, aes(RACEGRP, fill=RACEGRP))
p4 <- p4 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Participant Race",
       x="", y="")

# print plots
grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)

g <- arrangeGrob(p1, p2, p3, p4, nrow=2, ncol=2) #generates g
ggsave(file="../output/figures/key_variables.png", g) #saves g