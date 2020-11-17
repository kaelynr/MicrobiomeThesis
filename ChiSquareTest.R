### Chi Square Test example using the first 40 papers, Risely and Pubmed combined

#set working directory and bring in the Excel Sheet


setwd("~/University/University 2020-2021/thesis/MicrobiomeThesis")
library(readxl)
library(tidyverse)
SampleResultsMicrobiome <- read_excel("SampleResultsMicrobiome.xlsx")
View(SampleResultsMicrobiome)

# Try 1

SampleResultsMicrobiome <- gsub("\\.", "", SampleResultsMicrobiome)
fieldWords <- strsplit(SampleResultsMicrobiome, " ")
fieldWordsFreq <- table(unlist(fieldWords))
#this pulled keywords from all columns, which can then be selected using something like this line:
fieldWords[[11]]

#this gives me all the terms used in the fieldOfStudy column
#but I cannot figure out how to get the frequency of each word, especially because this function picks up "\" and "," as terms
#count function?
#this would allow me to create a table manually
freq.field <- data.frame(fieldOfStudy = c("Ecology", "Medical", "Agricultural", "Industrial"), score = c(23,10,7,3))
View(freq.field)

#Automating + Alicia
autoResults <- SampleResultsMicrobiome %>%
  mutate(fieldOfStudy1 = word(.$fieldOfStudy, sep = ", "),
         fieldOfStudy2 = word(.$fieldOfStudy, start = 2L, sep = ", "))

autoResultsFreq <- table(c(autoResults$fieldOfStudy1, autoResults$fieldOfStudy2)) %>%
  as.data.frame() %>% rename("fieldOfStudy" = "Var1")

#what does this do when the cell has 2 or more terms in it?

chisq.field <-chisq.test(autoResultsFreq$Freq)
chisq.field
summary(chisq.field)


