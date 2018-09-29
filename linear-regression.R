# Scatterplot with regression line
ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# correlation between 2 variables
# a negative value = inverse correlation
# a value between -0.2 and 0.2 = low correlation
# 0.5 < x < 0.8 = good correlation
# 0.8 < x = strong correlation
cor(bdims.hgt, bdims.wgt)

# Linear model for weight as a function of height
lm(hgt ~ wgt, data = bdims)

# Show the coefficients
coef(mod)

# Show the full output
summary(mod)

# takes a model object as an argument and returns a data frame that contains the data on which the model was fit
 augment(mod)


# Predict the weight of ben
predict(mod, newdata=ben)

