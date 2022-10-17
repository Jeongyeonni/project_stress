library(dplyr)
library(tidyverse)
# setwd('/home/tlswjddus98/project_stress/project_stress')

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

### ignore
# # SubjID, Session extract
# survey_smoking_ID <- 
#   survey_smoking %>% 
#   select(SubjID, Session) %>% 
#   slice(n():3) %>% 
#   as_tibble() %>%
#   view() %>%
#   write.csv(survey_smoking_ID, file = 'survey_smoking_ID', row.names = TRUE)
# 
# # survey_smoking_ID <- survey_smoking_ID[-c(1:2),]
# # write.csv(survey_smoking_ID, file = 'survey_smoking_ID', row.names = TRUE)
# 
# 
# # SubjID 별로 session 1,2,3 다 있는지 확인, 모두 있으면 1
# survey_smoking_com <- survey_smoking_ID %>% 
#   group_by(SubjID) %>% 
#   summarise(sum_session = n_distinct(Session)) %>%
#   view() %>%
#   write.csv(survey_smoking_com, file = 'survey_smoking_com.csv', row.names = TRUE)
# 
# 
# survey_smoking %>% 
#   select(SubjID, Session, StartDate, EndDate) %>% 
#   slice(n():3) %>%
#   as_tibble() %>%
#   View()
#
# # change order of columns
# survey_smoking %>% 
#   relocate(c(SubjID, Session)) 