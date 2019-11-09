# read in analytic table
BRFSS <- read.csv(file="../output/BRFSS.csv", header=TRUE, sep=",")

# recode variables as factors and add labels (levels)
BRFSS$AGEG5YR2 <- as.factor(BRFSS$AGEG5YR2)
levels(BRFSS$AGEG5YR2) <- c("50-59", "60-69", "70-79", "80+")
BRFSS$EDGRP <- as.factor(BRFSS$EDGRP)
levels(BRFSS$EDGRP) <- c("Grd 1-11", "HS Grad", "Some Coll", "Coll Grad", "NR")
BRFSS$INCOME3 <- as.factor(BRFSS$INCOME3)
levels(BRFSS$INCOME3) <- c("<$15K", "$15to<$25", "$25to<$35K", "$35to<$50K", 
                           "$50K+", "NR")
BRFSS$DENVST4 <- as.factor(BRFSS$DENVST4)
levels(BRFSS$DENVST4) <- c("Yes", "No", "NR")


# plot age
p1 <- ggplot(BRFSS, aes(AGEG5YR2, fill=AGEG5YR2))
p1 <- p1 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Participant Age",
       x="", y="")

# plot educa
p2 <- ggplot(BRFSS, aes(EDGRP, fill=EDGRP))
p2 <- p2 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Reported Education",
       x="", y="")

# plot income
p3 <- ggplot(BRFSS, aes(INCOME3, fill=INCOME3))
p3 <- p3 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Reported Income",
       x="", y="")

# plot Denvst
p4 <- ggplot(BRFSS, aes(DENVST4, fill=DENVST4))
p4 <- p4 + geom_bar(color = "Black") +
  scale_fill_brewer(palette = "Blues") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Dental Visit in Last Yr",
       x="", y="")

# print plots
grid.arrange(p1, p2, p3, p4, nrow=2, ncol=2)

g <- arrangeGrob(p1, p2, p3, p4, nrow=2, ncol=2) #generates g
ggsave(file="../output/figures/confounders.png", g) #saves g
