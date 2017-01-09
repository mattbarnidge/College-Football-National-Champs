####################
#                  #
#  ANOVA Example   #
#                  #
####################

#Set working directory and load libraries
setwd("~/Desktop")
library(psych)
library(ggplot2)
library(car)

#Load data and inspect
moth <- read.csv("moth-trap-experiment.csv", header = TRUE)
head(moth)

#Summary statistics by groups
describeBy(moth$number.of.moths, moth$location) #by location
describeBy(moth$number.of.moths, moth$type.of.lure) #by type of lure

#Create boxplot using the two factors
ggplot(moth, aes(x = location, y = number.of.moths, fill = type.of.lure)) + geom_boxplot()

#Log transformation and ANOVA
moth$no.of.moth.log <- log(moth$number.of.moths)
moth.anova <- aov(moth$no.of.moth.log ~ moth$location * moth$type.of.lure)
Anova(moth.anova,type = "III")

#Conclusion: Significant effect of "location" on "number of moths"
#Conclusion: More moths in lower and middle locations than on ground or top

