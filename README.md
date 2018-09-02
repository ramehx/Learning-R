<html> <head> </head>
<body>

# Learning-R
Learning R Language
 
### Importing libraries:
library(dplyr)

### Importing data from packages:
data(gapminder)

### Variable Types: 
numeric: int and floats <br />
character: char or strings <br />
logical: booleans <br />

### Assigning values to a variable:
apples <- 5 <br />
oranges <- 4 <br />
my_string <- "Teste R" <br />

### Operations
fruits <- apples + oranges

### Booleans
logica <- TRUE

### Functions to retrieve info about the dataframes / variables
str(variable)  <br />
glimpse(dataset)

### Class Method 
#### 'class' returns the variable type
class(my_numeric)

### UNIQUE
unique(cars$ncyl)

### Vectors
#### vectors are unordered and have the same type
#### if you add one single char type value, all the elements of the vector turn to char type
vetor <- c(1, 2, 0, -5, 100)

#### Assigning labels to the vector's elements using 'names' method:
names(vetor) = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

#### You can also create a label vector to simplify atributtion and create 'dictionaries':
nomes <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")  <br />
names(vetor) <- nomes

#### Operation with vectors
vetor1 <- c(1, 2, 3, 4, 5) <br />
vetor2 <- c(0, 1, 3, -1, 10) <br />
vetor_soma <- vetor1 + vetor2  <br />   

### SUM method
vetor2_soma <- sum(vetor2) <br />
vetor_soma <- sum(vetor1, vetor2) <br />

### Accessing elements from a vector
#### In R, the first element is reffered as position 1, not 0 as in python
vetor3 <- vetor2[3]   <br />
vetor4 <- vetor1[c(1:3)]    <br />
poker_midweek <- poker_vector[c(2:4)]   <br />

#### Accessing through element label:
vetor3 <- vetor["Monday"]

#### Comparison: returns booleans 
vetor_comparison <- vetor > 2

#### Selecting values corresponding to the boolean vector
vetor_comparado <- vetor[vetor_comparison]

### MEAN method:
media <- mean(vetor)

### MATRIX
#### Fills a matrix 3x3 with range 1:9 by row
matriz = matrix(1:9, nrow = 3, byrow = TRUE)
#### Fills a matrix with vector's elements
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE)
 

### FACTOR
#### describes categorical variables (ex: sex, color, etc)
#### factor method defines levels (i.e., the unique cathegories:
survey_vector <- c("M", "F", "F", "M", "M") <br />
factor_survey_vector <- factor(survey_vector)

#### Specify the levels of factor_survey_vector
#### Levels may also be used to exhibit the unique cathegories of a variable (ex: levels(sex) >> male, female )
levels(factor_survey_vector) <- c("Female", "Male")

#### ordering the cathegory levels
temperature_vector <- c("High", "Low", "High","Low", "Medium")  <br />
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))




### DATASETS

#### head(dataset) : returns the first lines
#### tail(dataset):  returns the last lines
#### str(dataset): checks the structure of the dataframe

#### data.frame(vetor1, vetor2, vetor3, vetorn...)    creates a dataframe from one or multiple vectors

#### subset select data according to specified conditions
subset(df, subset = column1 > 1)


### LISTS
#### Lists can be constructed by list() function, with any elements, such as strings, dataframes, vectors, matrixes, numbers, etc. 
lista <- list("a", "b", 1, 7, "dsfdsdf")   <br />
lista2 <- list(1, "a", vetor1, df, matriz1)

#### labeling list's elements
lista <- list(vec = vetor1, mat = matriz1, df=my_df)

#### selecting elements
#### select the 2nd element from a vector 'vetor1' in the 3rd position of the list 'lista2'
lista2 [[3]] [2]  or  <br />
lista2$vetor1[2]  or  <br />

#### adding new elements with name to the list
lista1 <- c(lista2, ano=1980)


### FILTER
filter(people, hair_color == "none", eye_color == "black")
#### to filter by discrete values
filter(cars, ncyl %in% c(4, 6, 8))

### PIPE WITH FILTER
#### use filter to select values from a column, pipe this selection into a dataset and then apply to a new dataset
filtered_dataset <- dataset  %>%  <br />
  filter(coluna == "blue")   <br />


### MUTATE
#### change values iteratively according to a condition
#### ifelse works as excel's 'if' function
mutate(num_char_cat = ifelse(num_char < med_num_char, "below median", "at or above median"))

### TABLE
#### May be used to create a 2-way table to summarize the data in two columns
table(df$a, df$b)

### DROPLEVELS
#### drop all the columns that don't fill a specified condition (filter or factor)
comics <- comics %>%      <br />
  filter(align != "Reformed Criminals") %>%      <br />
  droplevels()                   <br />

### SUMMARIZE
#### apply function(s) in a dataframe
gap2007 %>%
  group_by(continent) %>%
  summarize(mean(lifeExp), median(lifeExp))

 </body>
</html>
