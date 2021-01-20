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

# creating the ggplot for field of study
fieldPlot<- ggplot(data=micro, aes(x=fieldOfStudy)) +
  geom_bar(fill="steelblue") +
  labs(x = "Field of Study", y = "Number of Articles")
fieldPlot

# viridis colours are colour-blind friendly


corePlot <- ggplot(micro, aes(x = nestedCore, # possible to do intersection here instead
                              fill = interaction(commonCore, temporalCore))) +
  geom_bar() +
  # changing the x axis tick labels
  # discrete b/c the levels are unique (not on a continuous scale)
  scale_x_discrete(labels = c("Ecological", "Functional", "Host-adapted", "None")) +
  # changing the interaction legend
  # also adds viridis color scheme (d for discrete as above)
  scale_fill_viridis_d(labels = c("Neither", "Common Only", "Temporal Only", "Both")) +
  # adjust axis and legend names
  labs(x = "Nested Core Definition", y = "Number of Articles", 
       fill = "Common or Temporal")
corePlot