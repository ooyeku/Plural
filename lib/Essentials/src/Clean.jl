using DataFrames, Dates 

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

# shuffle observations in a dataframe (reorganize row indexes)
function shuffle(df::DataFrame)
   for i in 1:nrow(df)
        df[i, :] = df[rand(1:nrow(df)), :]
    end
    return df
end

# cut a dataframe into two halves -(by row index)
function cut_row(df::DataFrame, row1::Int, row2::Int)
    return df[1:row1, :], df[row2:end, :]
end

# cut a dataframe into two halves -(automatically split in half, removes middle row if odd number of rows)
function cut_row(df::DataFrame)
    row1 = floor(Int, nrow(df)/2)
    row2 = row1 + 1
    return df[1:row1, :], df[row2:end, :]
end

