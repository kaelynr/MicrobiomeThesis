### Chi Square Test example using the first 40 papers, Risely and Pubmed combined

#set working directory and bring in the Excel Sheet


setwd("~/University/University 2020-2021/thesis/MicrobiomeThesis")
library(readxl)
library(tidyverse)
SampleResultsMicrobiome <- read_excel("SampleResultsMicrobiome.xlsx")
View(SampleResultsMicrobiome)

# frequencies of different fields of study
autoResults <- SampleResultsMicrobiome %>%
  mutate(fieldOfStudy1 = word(.$fieldOfStudy, sep = ", "),
         fieldOfStudy2 = word(.$fieldOfStudy, start = 2L, sep = ", "))

autoResultsFreq <- table(c(autoResults$fieldOfStudy1, autoResults$fieldOfStudy2)) %>%
  as.data.frame() %>% rename("fieldOfStudy" = "Var1")

View(autoResultsFreq)

#what does this do when the cell has 2 or more terms in it?
chisq.field <- chisq.test(autoResultsFreq$Freq)
chisq.field
summary(chisq.field)

# make table with counts of papers from field and core definition used
tFieldCoreAll <- table(SampleResultsMicrobiome$fieldOfStudy, SampleResultsMicrobiome$typeOfCoreMicrobiome)
# complete the chi-square test
cFieldCoreAll <- chisq.test(tFieldCoreAll) 
cFieldCoreAll

# make table with counts of papers from positive/negative interaction and core definition used
tInteractionCoreAll <- table(SampleResultsMicrobiome$positiveOrNegativeInteraction, SampleResultsMicrobiome$typeOfCoreMicrobiome)
# complete the chi-square test
cInteractionCoreAll <- chisq.test(tInteractionCoreAll) 
cInteractionCoreAll
