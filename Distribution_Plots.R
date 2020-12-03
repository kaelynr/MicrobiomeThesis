## Script set up
#Attaching the packages required and set working directory

# run every time
# load required packages
library(readxl)
library(tidyverse)
# set working directory to file location
setwd("~/University/University 2020-2021/thesis/MicrobiomeThesis")
theme_set(theme_minimal())

#loading in sample dataset
micro <- read_excel("micro.xlsx")
View(micro)

#creating the ggplot
micro.plot<- ggplot(data=micro, aes(x=fieldOfStudy)) +
  geom_bar(fill="steelblue") +
  labs(x = "Field of Study", y = "Number of Articles")
micro.plot

# viridis colours are colour-blind friendly
