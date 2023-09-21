using RCall, StatsBase, DataFrames, CSV
export load_iris, load_mtcars, load_diamonds, load_mpg, load_txhousing, load_economics, load_midwest, rsummary, tabyl_r, tabyl_j, colnames_r, colnames_j, coltypes_r, coltypes_j, nrow_r, nrow_j, ncol_r, ncol_j, ggplot_r, install_tidyverse, install_janitor, load_tidyverse, load_janitor, loadggplot2


#=
Loading R libraries
=#
# install tidyverse
install_tidyverse() = R"""install.packages('tidyverse', repos='http://cran.us.r-project.org')"""
install_janitor() = R"""install.packages('janitor', repos='http://cran.us.r-project.org')"""
# Load tidyverse package
load_tidyverse() = R"""library(tidyverse)"""
# Load janitor package
load_janitor() = R"""library(janitor)"""
# Load ggplot2 package
loadggplot2() = R"""library(ggplot2)"""

#=Loading datasets
=#
# load iris dataset
function load_iris()
    R"""df <- iris"""
    iris = @rget df
    return iris
end

# load mtcars dataset
function load_mtcars()
    R"""df <- mtcars"""
    mtcars = @rget df
    return mtcars
end

# load diamonds dataset
function load_diamonds()
    R"""library(ggplot2)"""
    R"""df <- diamonds"""
    diamonds = @rget df
    return diamonds
end

# load mpg dataset
function load_mpg()
    R"""df <- mpg"""
    mpg = @rget df
    return mpg
end

# load txhousing dataset
function load_txhousing()
    R"""df <- txhousing"""
    txhousing = @rget df
    return txhousing
end

# load economics dataset
function load_economics()
    R"""df <- economics"""
    economics = @rget df
    return economics
end

# load midwest dataset
function load_midwest()
    R"""df <- midwest"""
    midwest = @rget df
    return midwest
end

# summarize with R summary(df)
rsummary(dataset) = R"""summary($dataset)"""

#=
Wrangling functions
=#
# wrapper for tably
tabyl_r(dataset, colindex = 1) = R"""tabyl($dataset[[$colindex]])"""

# wrapper for tabyl
function tabyl_j(dataset, colindex = 1)
    R"""t <- tabyl($dataset[[$colindex]])"""
    t = @rget t
end

# check column names
function colnames_r(dataset)
    R"""colnames($dataset)"""
end
function colnames_j(dataset)
    R"""c <- colnames($dataset)"""
    c = @rget c
end

# check column types
function coltypes_r(dataset)
    R"""sapply($dataset, class)"""
end
function coltypes_j(dataset)
    R"""c <- sapply($dataset, class)"""
    c = @rget c
end

# count number of rows
function nrow_r(dataset)
    R"""nrow($dataset)"""
end
function nrow_j(dataset)
    R"""n <- nrow($dataset)"""
    n = @rget n
end

# count number of columns
function ncol_r(dataset)
    R"""ncol($dataset)"""
end
function ncol_j(dataset)
    R"""n <- ncol($dataset)"""
    n = @rget n
end

#=
Plotting functions
=#
# wrapper for ggplot
function ggplot_r(dataset, x, y)
    # wrap x and y in quotes
    R"""ggplot($dataset, aes(x = $x, y = $y)) + geom_point()"""
end


#=
Statistical functions
=#
# wrapper for t.test