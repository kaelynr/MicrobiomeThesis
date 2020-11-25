### Chi Square Test example using the first 40 papers, Risely and Pubmed combined

#set working directory and bring in the Excel Sheet


setwd("~/University/University 2020-2021/thesis/MicrobiomeThesis")
library(readxl)
library(tidyverse)
SampleResultsMicrobiome <- read_excel("samplemicro.xlsx")
View(SampleResultsMicrobiome)

#nested core only
#remove NA values/rows
sampleresults <- na.omit(SampleResultsMicrobiome)
view(sampleresults)

# table for field and nested core
tFieldCoreNest <- table(sampleresults$fieldOfStudy, sampleresults$typeOfCoreMicrobiome)
# complete the chi-square test
cFieldCoreNest <- chisq.test(tFieldCoreNest) 
cFieldCoreNest
summary(cFieldCoreNest)

# table for field and common core
tFieldCoreCommon <- table(SampleResultsMicrobiome$fieldOfStudy, SampleResultsMicrobiome$commonCore)
# complete the chi-square test
cFieldCoreCommon <- chisq.test(tFieldCoreCommon) 
cFieldCoreCommon
summary(cFieldCoreCommon)

# table for field and temporal core
tFieldCoreTemp <- table(SampleResultsMicrobiome$fieldOfStudy, SampleResultsMicrobiome$temporalCore)
# complete the chi-square test
cFieldCoreTemp <- chisq.test(tFieldCoreTemp) 
cFieldCoreTemp
summary(cFieldCoreTemp)

# make table with counts of papers from positive/negative interaction and core definition used
tInteractionCoreAll <- table(SampleResultsMicrobiome$positiveOrNegativeInteraction, SampleResultsMicrobiome$typeOfCoreMicrobiome)
# complete the chi-square test
cInteractionCoreAll <- chisq.test(tInteractionCoreAll) 
cInteractionCoreAll

