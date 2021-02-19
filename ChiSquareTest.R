#set working directory and bring in the Excel Sheet
setwd("~/University/University 2020-2021/thesis/MicrobiomeThesis")
library(readxl)
library(tidyverse)

# functions for analysis
chiFilter <- function(c1, c2){
  # c1 = first column of interest
  # c2 = second column of interest
  df1 <- data.frame(c1, c2) %>% na.omit()
  tab <- table(df1$c1, df1$c2)
  chi <- chisq.test(tab)
  return(chi)
}

# read in spreadsheets
ResultsMicrobiome <- read_excel("micro.xlsx")
View(ResultsMicrobiome)

# table for field and nested core
chiFilter(ResultsMicrobiome$fieldOfStudy, ResultsMicrobiome$nestedCore)

# table for field and common core
chiFilter(ResultsMicrobiome$fieldOfStudy, ResultsMicrobiome$commonCore)

# table for field and temporal core
chiFilter(ResultsMicrobiome$fieldOfStudy, ResultsMicrobiome$temporalCore)

# apply (quicker step)
columns <- list(ResultsMicrobiome$nestedCore, ResultsMicrobiome$commonCore, ResultsMicrobiome$temporalCore)
lapply(columns, chiFilter, c1 = ResultsMicrobiome$fieldOfStudy)

# make table with counts of papers from positive/negative interaction and core definition used
lapply(columns, chiFilter, c1 = ResultsMicrobiome$positiveOrNegativeInteraction)

