module Essentials
include("readFile.jl")
include("makeFeather.jl")
include("clean.jl")
include("ds.jl")
using  DataFrames, Feather, Dates, BenchmarkTools
export load, make_feather, clean, load_iris, load_mtcars,
load_diamonds, load_mpg, load_txhousing, load_economics,
load_midwest, rsummary, tabyl_r, tabyl_j, colnames_r, colnames_j, coltypes_r,
coltypes_j, nrow_r, nrow_j, ncol_r, ncol_j, ggplot_r, install_tidyverse,
install_janitor, load_tidyverse, load_janitor, loadggplot2


# create sample data
df = DataFrame(
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    c = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    d = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    e = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    f = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    g = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    h = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    i = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    j = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
)

function demo(df::DataFrame)
    # write sample to feather
    @benchmark make_feather("test", df)
    @benchmark load("test.feather")
end

end # module Essentials
