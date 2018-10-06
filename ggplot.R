
##GGPLOT2

library(ggplot2)

ggplot(email, aes(x = num_char, y = exclaim, color = factor(spam))) + geom_point()

#### Create side-by-side chart of 'align' on proportions of gender
ggplot(comics, aes(x = align, fill = gender)) + 
  geom_bar(position = "fill") +
  ylab("proportion")
  
  
#### Create side-by-side barchart of alignment by gender and vertical x label
ggplot(comics, aes(x = gender, fill = align)) + 
  geom_bar(position="dodge") +
  theme(axis.text.x = element_text(angle = 90))  


#### Plot of alignment broken down by gender (1 plot for each gender)
ggplot(comics, aes(x = align)) + 
  geom_bar() +
  facet_wrap(~ gender)


#### Create box plots of city mpg values by ncyl
ggplot(common_cyl, aes(x = as.factor(ncyl), y = city_mpg)) +
  geom_boxplot()

#### Create overlaid density plots 
ggplot(common_cyl, aes(x = city_mpg, fill = as.factor(ncyl))) +
  geom_density(alpha = .3)

#### Create hist of horsepwr
ggplot(cars, aes(horsepwr)) +
  geom_histogram() +
  ggtitle("Horse Power Plot")
  

#### Create hist of horsepwr with binwidth of 30 and including graph title
#### Piping the ggplot and filter into the variable is usual  
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 30) +
  ggtitle("Histogram with binwidth of 30")  

#### Create a facet grid crossing 2 variables "suv" and "ncyl"  
  common_cyl %>%
    ggplot(aes(x = hwy_mpg)) +
    geom_histogram() +
    facet_grid(ncyl ~ suv, labeller = label_both) +
    ggtitle("Mileage by suv and ncyl")

#### Side-by-side boxplot with 2 variables, one logical and other in log scale     
#### TIP: you can add 0.01 to the log var in order to avoid log(0) (infinite)
  email %>%
  mutate(log_num_char = log(num_char)) %>%
  ggplot(aes(x = spam, y = log_num_char)) +
  geom_boxplot()

#### Bloxplot with 6 intervals (breaks) of the x variable
ggplot(data = ncbirths, 
       aes(x = cut(weeks, breaks = 5), y = weight)) + 
  geom_boxplot()
  
#### Plor spam/non-spam bar chart of emails which word "dollar" appears more than 10 times
email %>%
  filter(dollar>10) %>%
  ggplot(aes(x = spam)) +
  geom_bar()

#### Scatterplot with coord_trans()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + coord_trans(x = "log10", y = "log10")

#### Scatterplot with scale_x_log10() and scale_y_log10()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + scale_x_log10() + scale_y_log10()

# multiple regression plot with interaction
ggplot(data = mario_kart, aes(x = duration, y = totalPr, color = cond)) + 
  geom_point() + 
  geom_smooth(method = "lm", se=FALSE)
