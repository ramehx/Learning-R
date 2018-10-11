# Scatterplot with regression line
ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Through geom_abline() method:
ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
  geom_point() + 
  geom_abline(data = coefs, aes(intercept = `(Intercept)`, slope = hgt),  color = "dodgerblue")


# correlation between 2 variables
# a negative value => inverse correlation
# a value between -0.2 and 0.2 => low correlation
# 0.5 < x < 0.8 => good correlation
# 0.8 < x => strong correlation
cor(bdims.hgt, bdims.wgt)

# check correlation between all variables in a dataframe with scatterplot
pairs(nyc)

# Linear model for weight as a function of height attributed to a variable 'mod' which class is linear model
mod <-lm(hgt ~ wgt, data = bdims)

# Show the coefficients of the linear model 'mod'
coef(mod)

# Show the full output
summary(mod)

# takes a model object as an argument and returns a data frame that contains only the data on which the model was fit
# fitted.values() may also be used
 augment(mod)

# augment may also be used to make predictions about new observations  
augment(mod, newdata = new_data, type.predict = "response")

# Predicting the expected value of weight of a new individual "ben" which data is not in the original 'bdims' dataset
# 'mod' is the fitted model for weight as a function of height
predict(mod, newdata=ben)

# MULTIPLE REGRESSION: uses 2 explanatory variables which explains a result variable. There are 2 ways:
# 1) one discrete variable (Ex: 2 dates), resulting in paralel lines
birthweight <- lm(bwt ~ age + parity, data = babies )

# 2) two continuous variables, interacting to the result:
birthweight <- lm(formula = bwt ~ age + parity + age:parity, data = babies )

# LOGISTIC REGRESSION - applied when the result variable is cathegorical (success and failure for example) 
# generalized linear models (GLM)
glm(formula = Acceptance~ GPA, data = MedGPA, family = binomial)

# scatterplot with jitter
data_space <- ggplot(MedGPA, aes(x=GPA, y=Acceptance)) + 
  geom_jitter(width=0, height=0.05, alpha = .5)

# add logistic curve
data_space + 
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se=FALSE)


## Using bins to define ranges of GPAs and calculating the mean (probability) in each bin
###############################

# binned points and line
data_space <- ggplot(MedGPA_binned, aes(mean_GPA, acceptance_rate)) + geom_line() + geom_point()

# augmented model. Creating the prediction on the scale of the response variable
MedGPA_plus <- augment(x=mod, newdate= MedGPA_binned, type.predict = "response")

# logistic model on probability scale
data_space +
  geom_line(data = MedGPA_plus, aes(x=GPA , y=.fitted), color = "red")
  
 
#### ODs - Likelyhood (probability) of happening of an event
###############################################
# compute odds for bins
MedGPA_binned <- MedGPA_binned %>%
  mutate(odds = acceptance_rate/(1 - acceptance_rate))
# using a log scale to get a linear function
  mutate(log_odds = log(acceptance_rate/(1-acceptance_rate)))

# plot binned odds
data_space <- ggplot(MedGPA_binned, aes(mean_GPA, odds)) +
  geom_line() + geom_point()

# compute odds for observations
MedGPA_plus <- MedGPA_plus %>%
  mutate(odds_hat = .fitted/(1 - .fitted))
# using a log scale to get a linear function
  mutate(log_odds_hat = log(.fitted/(1-.fitted)))

# logistic model on odds scale
data_space + 
  geom_line(data= MedGPA_plus, aes(x=GPA, y= odds_hat), color = "red")


