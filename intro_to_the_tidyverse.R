library("nycflights13")
library("tidyverse")

#main functions

#function selects rows that contained values specified
filter(flights,month==1,day==1)

#arrange rows by columns in order
arrange(flights, year, month, day)

#desc() can be used to organize column
arrange(flights,desc(day),year,month)

##############
###SELECT()###
##############

#select() picks specfic column in order
select(flights,month, year,day)

#selects in sequenc
select(flights,year:day)

#selects anything not in sequence
select(flights,-(year:day))

#selects everything but only reorders a few
select(flights, air_time,everything())

#starts with statement selects all columns that start with
select(penguins,species, starts_with("bill"), body_mass_g) |>
  head(4)

###########
###MUTATE##
###########

flights_sml <- select(flights,year:day,ends_with("delay"),          distance,air_time 
) 

#mutate() adds columns that are calculated from other values at the end
mutate(flights_sml,gain = arr_delay - dep_delay, speed = distance / air_time * 60 )

###############
###TRANSMUTE###
###############

#transmute() only selects and creates the columns specified
transmute(flights,dep_time, hour = dep_time %/% 100, minute = dep_time %% 100)



#rename(data,newname=oldname) 
colnames(flights_sml)
rename(flights_sml,c("Year"="year","Month"="month"))



#groups variables and applies function to create a or a few new columns
grouped_flights<- flights %>% 
  group_by(year,month,day)%>%
  #summarize instead of mutate (adds calculated columns) or permute (only makes calculated colums) which uses preexisting data, not grouped data
  summarize(Mean_dep_delay=mean(subset(dep_delay,dep_delay!=is.na(dep_delay))), delay_plus2=Mean_dep_delay+2)


#COUNT
count(flights_sml,year,month,day)
