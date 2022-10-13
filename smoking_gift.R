library(dplyr)

#read data

survey_smoking <- read.csv("stress_fMRI_smoking_221013.csv")

#SubjID, Session extract
survey_smoking_ID <- survey_smoking %>% select(SubjID, Session)
survey_smoking_ID <- survey_smoking_ID[-c(1:2),]

#SubjID 별로 session 1,2,3 다 있는지 확인, 모두 있으면 1
survey_smoking_com <- survey_smoking_ID %>% group_by(SubjID) %>% summarise(sum_session=n_distinct(Session))
survey_smoking_com$complete <- ifelse(survey_smoking_com$sum_session >= 3, 1, 0)
