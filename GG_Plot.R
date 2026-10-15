library('tidyverse')
library('palmerpenguins')
penguins

#takes a peak at dataset penguins
glimpse(penguins)

#data
ggplot(data=penguins)

#with mapping
ggplot(data=penguins, mapping = aes(x=flipper_length_mm,y=body_mass_g)) +
  geom_point()

#add some color
#with mapping
ggplot(data=penguins, mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species)) +
  geom_point()

#linear model
ggplot(data=penguins, mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species)) +
  geom_point()+
  geom_smooth(method = "lm")

#we will add color in geom_point so that the linear model is for all species
#linear model
ggplot(
  data=penguins, 
  mapping = aes(x=flipper_length_mm,y=body_mass_g)
  ) +
  geom_point(mapping = aes(color=species))+
  geom_smooth(method = "lm")
 
#points will also be shaped- in addition to being colored-by species 
ggplot(
  data=penguins, 
  mapping = aes(x=flipper_length_mm,y=body_mass_g)
) +
  geom_point(mapping = aes(color=species,shape=species))+
  geom_smooth(method = "lm") 


ggplot(
  data=penguins, 
  mapping = aes(x=flipper_length_mm,y=body_mass_g)
) +
  geom_point(mapping = aes(color=species,shape=species))+
  geom_smooth(method = "lm") +
  labs(
    title = "Body Mass and Flipper Length",
    subtitle = "Dimensions for Adelie, Chinstrap, & Gentoo Penguin", x = "Flipper Length (mm)", y = "Body Mass (g)",color="Species",shape='Species'
  )
  
nrow(penguins)

ggplot(
  data=penguins, 
  mapping = aes(x=bill_length_mm,y=bill_depth_mm)
) +
  geom_point(na.rm = TRUE)+
  geom_smooth(method="lm")

#with a caption
ggplot(
  data=penguins, 
  mapping = aes(x=species,y=bill_depth_mm)
) +
  geom_boxplot() +
  labs(caption = "Data from the palmerpenguins package")
 
#3 flipper length vs body mass, a third variable bill_depth is colored
ggplot(
  data=penguins, 
  mapping = aes(x=flipper_length_mm,y=body_mass_g)
) +
  geom_point(mapping=aes(color=bill_depth_mm)) 


#predict how this will look
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  #removes confidence band
  geom_smooth(se = FALSE)


#will these look different?
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )
#no, the arguments in ggplot are passed on to geom_point and geom_smooth, otherwise they have to be specified in each of those functions to get the same results.

###CATEGORICAL Variable

#bar plot of count by species
ggplot(penguins, aes(x = species)) +
  geom_bar()

#data is ordered by species using the fct_infreq plot
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()

###Numerical Variable

#histogram
ggplot(penguins, aes(x=body_mass_g)) +
  geom_histogram(binwidth=200)

#using geom density
ggplot(penguins,aes(x=body_mass_g))+
  geom_density()

#colors!
ggplot(penguins, aes(x=species))+
  geom_bar(color="red")

ggplot(penguins, aes(x=species))+
  geom_bar(color='black',fill=c("#4B4237","#D5A021","#EDE7D9"))



ggplot(diamonds, aes(x=carat))+
  geom_histogram(binwidth = 0.1)

#box plot one quantitative one categorical
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

#color coded density plot
ggplot(penguins, aes(x=body_mass_g,color =species))+
  geom_density(linewidth = 0.75)

#fill in with color, alpha is transparency
ggplot(penguins, aes(x=body_mass_g,color =species, fill=species))+
  geom_density(alpha = 0.5)

#colors bars based off species composition
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

#proportion of species
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position='fill')

#relationship between two numerical variable
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

#graphing three or more variables
ggplot(penguins, aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(aes(color=species,shape=island))


#facet wrapping, separates by island (~island)
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

#multiple numerical variables
ggplot(mpg,aes(x=hwy,y=displ))+
  geom_point((aes(color=manufacturer,shape=manufacturer)))

#three species scatterplot
ggplot(penguins, aes(x=bill_depth_mm,y=bill_length_mm))+
geom_point(aes(color=species))+
geom_smooth(aes(color=species),se=FALSE)+
  geom_smooth(color="black",se=FALSE)


#two legends
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species")


#how to get both color and shape as one legend
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  guides(color=guide_legend(title="Species Legend"),shape=guide_legend(title="Species Legend"))


#what type of question can you answer with with each of these
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")
ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")
#position = "fill" creates a proportion bar chart, the x shows the main category for the bars, the fill splits this into proportions of another category

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
ggsave(filename = "penguin-plot.png")
