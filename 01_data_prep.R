library(tidyverse)

pop <- read_delim(here::here("data", "eph2017_pobulacion.csv"), delim = ";")

#rename
pop <- 
  pop %>% 
  rename(age = P02, sex = P06, language = ED01, years_scho = añoest)

#check your work
head(pop$years_scho)

#create hhid and a dummy for female
pop <- 
  pop %>% 
  mutate(hhid = paste(UPM, NVIVI, NHOGA, sep = "_"),
         female = as.numeric(sex == 6))

#change variable type
pop <- 
  pop %>% 
  mutate(years_scho = as.integer(years_scho))

#select variables
pop <- 
  pop %>% 
  select(c("hhid", "age", "female", "years_scho", "language"))

#select sample of observations
pop <- 
  pop %>% 
  filter(age >= 8 & age <=17)

#check work
table(pop$age)
