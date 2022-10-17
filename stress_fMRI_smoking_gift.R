library(dplyr)
library(tidyverse)
# setwd('/project_stress_fMRI/analysis/survey')

# read data
# Global variable
FILE_NAME = 'stress_fMRI_smoking_221017.csv'
TOTAL_SESSION = 4

# paste0(), strc 

survey_smoking <- read.csv(FILE_NAME)


### check the completion of follow-up

survey_com <- survey_smoking %>% 
  select(SubjID, Session) %>% 
  slice(n():3) %>% 
  as_tibble() %>% 
  group_by(SubjID) %>% 
  summarise(Sum_session = n_distinct(Session)) %>%
  mutate(Complete = ifelse(Sum_session == TOTAL_SESSION, 1, 0)) %>%
  view()