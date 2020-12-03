## Script set up
#Attaching the packages required and set working directory

# run every time
# load required packages
library(tidyverse)
library(ggplot2)
library(readxl)
# set working directory to file location
setwd("~/University/University 2020-2021/thesis/MicrobiomeThesis")

#loading in sample dataset
micro <- read_excel("micro.xlsx")
View(micro)

#creating the ggplot
micro.plot<-ggplot(data=micro, aes(x=fieldOfStudy)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()+
  geom_line(stat="count") 
micro.plot

