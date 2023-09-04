library(tidyverse)

# DATA FRAME. 
survey_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQ9m4BL1K5dTma_F125aHve4ykX05pkrLNHdhvzYdKH82PX8mM3TzpoXVN5wKf4X96Q4DyaevDCIV-d/pub?gid=2051647735&single=true&output=csv")
learning_data <- survey_data  %>% 
  rename (have_goals = 2,
          completed_g = 3, 
          sleep_d = 4,
          study_method = 5,
          organize = 6,
          assignment = 7,
          a_rate = 8) %>%
  mutate(study_method = str_remove_all(study_method, ("Other|None")))






# THE AVERGAE SELF-REPORTED ACADEMIC RATING
learning_data$a_rate %>% 
  mean(na.rm = TRUE) %>% 
  round(2)

# THE MINIMUM HOURS OF SLEEP OBTAINED BY STUDENTS PER DAY
learning_data$sleep_d %>% 
  mean(na.rm = TRUE) %>% 
  round()

# THE MINIMUM HOURS OF AVERAGE SLEEP OBTAINED BY STUDENTS PER DAY
learning_data$sleep_d %>% 
  min(na.rm = TRUE) %>% 
  round()





# FIRST PLOT: BAR CHART
learning_data %>% 
  ggplot() + 
  geom_bar(aes(x = a_rate,
               fill= have_goals)) + 
  labs(title= "Student's academic rating and their goals", 
       x = "academic rating", 
       y = "Number of students", 
       caption = "surveyd from students enrolled in University of Auckland in 2023")

# SECOND PLOT: SCATTER PLOT
learning_data %>% 
  ggplot(mapping = aes(x = sleep_d,
             y = a_rate, 
             colour = organize)) + 
  geom_point(alpha = 0.5) + 
  scale_colour_manual(values=c("red", "blue")) + 
  labs(title= "Student's academic rating and duration of sleep(hr) based on self-organisation", 
       x = "Sleep duration(hr) per day", 
       y = "Academic rating", 
       colour = "self-organisation",
       caption = "This survey was conducted with students enrolled at the University of Auckland in 2023.
       The darker dots in blue and red represent the overlap of the responses")
 