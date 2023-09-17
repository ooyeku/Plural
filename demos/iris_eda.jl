# Demo exploratory work with the iris dataset

include("../lib/DS/clean.jl")
include("../src/Plural.jl")

# load the tidyverse package
load_tidyverse()

# load the iris dataset
df = load_iris()

# print the first 5 rows of the iris dataset
first(df, 5)

# print the last 5 rows of the iris dataset
last(df, 5)

# shuffle the iris dataset
df = shuffle(df)

# remove last column from the iris dataset (species)
df = df[:, 1:4]

# split the iris dataset into two halves
half1, half2 = cut_row(df, 75, 76)

# print the first 5 rows of the first half of the iris dataset
first(half1, 5)

# print the first 5 rows of the second half of the iris dataset
first(half2, 5)

# create half1x and half1y using cut_col
half1x, half1y = cut_col(half1, 2, 3)

# print the first 5 rows of half1x and half1y
first(half1x, 5)
first(half1y, 5)

# create half2x and half2y using cut_col   
half2x, half2y = cut_col(half2, 2, 3)

# print the first 5 rows of half2x and half2y
first(half2x, 5)
first(half2y, 5)

describe(half1x)
describe(half1y)

names(half1x) == names(half2x)
names(half1y) == names(half2y)

half1x