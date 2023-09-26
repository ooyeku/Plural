# Demo exploratory work with the iris dataset

# include("../lib/DS/clean.jl")
include("../src/Plural.jl")
include("../lib/Essentials/src/Essentials.jl")
using .Plural, .Essentials

# load the tidyverse package
Essentials.load_tidyverse()

# load the iris dataset
df = Essentials.load_iris()

# print the first 5 rows of the iris dataset
first(df, 5)

# print the last 5 rows of the iris dataset
last(df, 5)

# shuffle the iris dataset
df = Essentials.shuffle(df)

# remove last column from the iris dataset (species)
df = df[:, 1:4]

# split the iris dataset into two halves
half1, half2 = Essentials.cut_row(df, 75, 76)

# print the first 5 rows of the first half of the iris dataset
first(half1, 5)

# print the first 5 rows of the second half of the iris dataset
first(half2, 5)

# create half1x and half1y using cut_col
half1x, half1y = Essentials.cut_row(half1, 2, 3)

# print the first 5 rows of half1x and half1y
first(half1x, 5)
first(half1y, 5)

# create half2x and half2y using cut_col   
half2x, half2y = Essentials.cut_row(half2, 2, 3)

# print the first 5 rows of half2x and half2y
first(half2x, 5)
first(half2y, 5)

using Statistics, StatsBase
describe(half1x)
describe(half1y)

names(half1x) == names(half2x)
names(half1y) == names(half2y)

half1x

Plural.show_environment()
Plural.memory_usage()