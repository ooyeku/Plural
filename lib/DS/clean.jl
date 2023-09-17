using DataFrames, Dates, RCall

# turns a column of a dataframe into a Date type with a specified format
function make_date(df::DataFrame, col::String, format::String)
    df[!, col] = Date.(df[!, col], format)
    return df
end

# create a new day of the week column from a date column
function make_weekday(df::DataFrame, col::String)
    df[!, :weekday] = Dates.dayname.(df[!, col])
    return df
end

# returns the index of missing vales in a column of a dataframe
function missing_index(df::DataFrame, col::String)
    return findall(ismissing, df[!, col])
end

# check for missing values
missing_r(dataset) = R"""sum(is.na($dataset))"""

# check for missing values and return the sum from R
function missing_j(dataset)
    R"""m <- sum(is.na($dataset))"""
    m = @rget m
end

# check for duplicated rows
duplicated_r(dataset) = R"""sum(duplicated($dataset))"""

# check for duplicated rows and return the sum from R
function duplicated_j(dataset)
    R"""d <- sum(duplicated($dataset))"""
    d = @rget d
end

# delete na rows
dropna_r(dataset) = R"""na.omit($dataset)"""

# delete na rows and return the dataframe from R
function dropna_j(dataset)
    R"""d <- na.omit($dataset)"""
    d = @rget d
end

# delete duplicated rows
dropdupe_r(dataset) = R"""unique($dataset)"""

# delete duplicated rows and return the dataframe from R
function dropdupe_j(dataset)
    R"""d <- unique($dataset)"""
    d = @rget d
end
