library(tidyverse)

pop <- read_delim(here::here("data", "eph2017_pobulacion.csv"), delim = ";")

#rename
pop <- 
  pop %>% 
  rename(age = P02, sex = P06, language = ED01, years_scho = añoest)

#check your work
head(pop$years_scho)

#create dummy
pop <- 
  pop %>% 
  mutate(female = as.numeric(sex == 6))

#change variable type
pop <- 
  pop %>% 
  mutate(years_scho = as.integer(years_scho))
