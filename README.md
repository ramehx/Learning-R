<html> <head> </head>
<body>

# Learning-R
Learning R Language
 
### Assigning values to a variable:
apples <- 5 <br />
oranges <- 4 <br />
my_string <- "Teste R" <br />

### Operations
fruits <- apples + oranges

### Booleans
logica <- TRUE

### Variable Types: 
numeric: int and floats <br />
character: char or strings <br />
logical: booleans <br />

### Class Method 
#### 'class' returns the variable type
class(my_numeric)

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






 </body>
</html>
