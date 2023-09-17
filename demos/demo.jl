include("src/Plural.jl")

msg = """
Welcome to Plural, a Julia package for data science and machine learning.
Plural was designed from the ground up to incorporate the best features of
R, Python and Julia.  Plural is a Julia package, but it can be used as a
standalone application.  Plural is a work in progress, so please be patient!
"""

msg2 = """
Example functions include:
loading popular datasets (e.g. iris, mtcars, diamonds, etc.)
loading popular R packages (e.g. tidyverse, janitor, ggplot2, etc.)
example usage:
load_data() # loads datasets of various types (e.g. csv, json, xlsx, feather)
load_tidyverse() # loads tidyverse package
load_janitor() # loads janitor package
load_economics() # loads economics dataset
load_iris() # loads iris dataset
"""

tidyexample = """
----------------------------------------------------
Here is an example of loading the tidyverse package:
julia> using Plural
julia> load_tidyverse()
"""

tidyexample2 = """
julia> df = load_iris()
julia> first(df, 5)
"""

tidyexample3 = """
Here is a summary of the iris dataset using the rsummary() function:

julia> rsummary(df)
"""

tidyexample4 = """
The rsummary() function is a wrapper for the R summary() function:
"""

function demo()
    println(msg)
    println(msg2)
    sleep(4)
    @info "Demo:"
    println(tidyexample)
    @info "Loading tidyverse package"
    load_tidyverse()
    sleep(1)
    println(tidyexample2)
    @info "Loading iris dataset"
    sleep(1)
    df = load_iris()
    first(df, 5)
    sleep(4)
    println(tidyexample3)
    rsummary(df)
    sleep(4)
    println(tidyexample4)
end

demo()