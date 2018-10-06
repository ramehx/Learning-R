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

# Linear model for weight as a function of height attributed to a variable 'mod' which class is linear model
mod <-lm(hgt ~ wgt, data = bdims)

# Show the coefficients of the linear model 'mod'
coef(mod)

# Show the full output
summary(mod)

# takes a model object as an argument and returns a data frame that contains only the data on which the model was fit
# fitted.values() may also be used
 augment(mod)

# Predicting the expected value of weight of a new individual "ben" which data is not in the original 'bdims' dataset
# 'mod' is the fitted model for weight as a function of height
predict(mod, newdata=ben)

# Multiple regression using 2 variables (age and parity) which explains a result variable bwt
birthweight <- lm(bwt ~ age + parity, data = babies )
