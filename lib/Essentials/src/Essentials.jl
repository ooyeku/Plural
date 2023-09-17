module Essentials
include("ReadFile.jl")
include("MakeFeather.jl")
include("Clean.jl")
using .ReadFile, .MakeFeather, DataFrames, Feather, .Clean, Dates, BenchmarkTools
export make_date, dayofweek, count_missing, remove_missing, rename_col, shuffle, load, make_feather, make_date

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
    # read sample from feather
    @benchmark load("test.feather")
end

demo(df)

end # module Essentials
