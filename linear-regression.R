# Scatterplot with regression line
ggplot(data = bdims, aes(x = hgt, y = wgt)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)


# Linear model for weight as a function of height
lm(hgt ~ wgt, data = bdims)
