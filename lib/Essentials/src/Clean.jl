module Clean
using DataFrames, Dates 
export make_date, dayofweek, count_missing, remove_missing, rename_col, shuffle

# Turn a column of a dataframe into a Date type with a specified format -(by column name)
function make_date(df::DataFrame, col::String, format::String)
    df[col] = Date.(df[!, col], format)
    return df
end

# Turn a column of a dataframe into a Date type with a specified format.  Save as a new column. -(by column index)
function make_date(df::DataFrame, col::Int, format::String, new_col::String)
    df[new_col] = Date.(df[!, col], format)
    return df
end

# Turn a column of a dataframe into a Date type with a specified format.  Save as a new column. -(by column name)
function make_date(df::DataFrame, col::String, format::String, new_col::String)
    df[new_col] = Date.(df[!, col], format)
    return df
end

# Turn a column of a dataframe into a Date with a  specified format.  Save as a new column. -(by Symbol)
function make_date(df::DataFrame, col::Symbol, format::String, new_col::Symbol)
    df[new_col] = Date.(df[!, col], format)
    return df
end 

# Turn a column of a dataframe into a Date type with a specified format.  Save as a new column. -(by column index)
function make_date(df::DataFrame, col::Int, format::String)
    df[!, col] = Date.(df[!, col], format)
    return df
end

# create a new day of the week column from a date column -(by column name)
function dayofweek(df::DataFrame, col::String)
    df[!, :dayofweek] = dayofweek.(df[!, col])
    return df
end

# create a new day of the week column from a date column -(by column index)
function dayofweek(df::DataFrame, col::Int)
    df[!, :dayofweek] = dayofweek.(df[!, col])
    return df
end

# count missing rows in a column -(by column name)
function count_missing(df::DataFrame, col::String)
    return sum(ismissing.(df[!, col]))
end

# count missing rows in a column -(by column index)
function count_missing(df::DataFrame, col::Int)
    return sum(ismissing.(df[!, col]))
end

# count missing rows in a dataframe -(by column name)
function count_missing(df::DataFrame)
    return sum(ismissing.(df))
end

# count missing rows in a dataframe -(by column index)
function count_missing(df::DataFrame)
    return sum(ismissing.(df))
end

# remove rows with missing values -(by column name)
function remove_missing(df::DataFrame, col::String)
    return df[.!ismissing.(df[!, col]), :]
end

# remove rows with missing values -(by column index)
function remove_missing(df::DataFrame, col::Int)
    return df[.!ismissing.(df[!, col]), :]
end

# rename a column -(by column name)
function rename_col(df::DataFrame, col::String, new_col::String)
    rename!(df, Symbol(col) => Symbol(new_col))
    return df
end

# rename a column -(by column index)
function rename_col(df::DataFrame, col::Int, new_col::String)
    rename!(df, Symbol(col) => Symbol(new_col))
    return df
end

# shuffle observations in a dataframe 
function shuffle(df::DataFrame)
    return df[shuffle(1:nrow(df)), :]
end


end # module Clean