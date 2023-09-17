module ReadFile
using CSV, DataFrames, JSONTables, XLSX, Feather
export load

function load(filename::String)
    try
        if endswith(filename, ".csv")
            return CSV.read(filename)
        elseif endswith(filename, ".json")
            return DataFrame(loadjson(filename))
        elseif endswith(filename, ".xlsx")
            return DataFrame(XLSX.readtable(filename, "Sheet1")...)
        elseif endswith(filename, ".feather")
            return Feather.read(filename)
        else
            error("Unknown file type")
        end
    catch e
        error("Error reading file: $e")
    end
    end

end # module ReadFile