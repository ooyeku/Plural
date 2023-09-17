module MakeFeather
include("ReadFile.jl")
using Feather, DataFrames, .ReadFile
export make_feather

# load data from file and save as feather file
function make_feather(filename::String)
    try
        df = load(filename)
        Feather.write(filename * ".feather", df)
    catch e
        error("Error making feather file: $e")
    end
end

# load data from DataFrame and save as feather file
function make_feather(filename::String, df::DataFrame)
    try
        Feather.write(filename * ".feather", df)
    catch e
        error("Error making feather file: $e")
    end
end

# load data by select columns from DataFrame and save as feather file
function make_feather(filename::String, df::DataFrame, cols::Array{String,1})
    try
        Feather.write(filename * ".feather", df[cols])
    catch e
        error("Error making feather file: $e")
    end
end

end # module MakeFeather