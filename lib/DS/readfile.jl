using CSV, DataFrames, JSONTables, XLSX, Feather

function load_data(filename::String)
try
    # Check for file extension
    if occursin(".csv", filename)
        df = CSV.read(filename, DataFrame)
        return df
    elseif occursin(".json", filename)
        df = JSONTables.arraytable(filename) |> DataFrame
        return df
    elseif occursin(".xlsx", filename)
        df = XLSX.readtable(filename) |> DataFrame
        return df
    elseif occursin(".feather", filename)
        df = Feather.read(filename) |> DataFrame
        return df
    else
        println("File extension not supported")
    end
    catch e
        println("Error: ", e)
    end
end

