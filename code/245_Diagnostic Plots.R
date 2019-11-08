# read in analytic table
BRFSS <- read.csv(file="./data/BRFSS", header=TRUE, sep=",")

# Normal probability plot
# make linear model using grouping variable
model1 = lm(CVDINFR5 ~ RMVTETH5, data=BRFSS) 
model1 
summary(model1)

# Make diagnostic plots
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(model1, 
	main = "RM Teeth by Cardiovasc Disease")

model2 = lm(CVDINFR5 ~ RMVTETH5 + AGE1 + AGE2 + AGE3, data=BRFSS) 
model2
summary(model2)



