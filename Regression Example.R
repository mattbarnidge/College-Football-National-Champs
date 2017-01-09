####################
#                  #
#   OLS Example    #
#                  #
####################

#Set working directory and load libraries
setwd("~/Desktop")
library(visreg)

#Load data and inspect structure
load("Selective_Exposure.Rdata")
head(se.data)

#Fit OLS regression model and get model summary
se.ols <- lm(SE_PropABS ~ Opinion_ABS + PolTalk_NetSize + PolTalk_Freq + PolTalk_Div + 
            PolKnow + Efficacy + PolInterest + IDStrength_r + Female + Age + 
            Education_r + HouseholdIncome_r + local.part.abs + pp.sqmi + msa.dist + 
            avg.income + local.np.abs, data = se.data)
summary(se.ols)

#Plot slope for Opinion_ABS
visreg(se.ols, "Opinion_ABS")

#Conclusion: Significant and positive relationship between political opinion extremity and
#selective exposure

