println("----------------------------------------")
println("Workbook to be used for drafts and ideas --delete as needed")
println("----------------------------------------")
# Language struct represents a programming language (R, Python or Julia)
# name, version
mutable struct Language
    name::String
    version::String
end

# Exchange struct represents a data exchange between languages
mutable struct Exchange
    from::Language
    to::Language
end


# Data struct representing universal data type (that can be passed
# between languages).  Data is a string, but can be converted to other
# types (e.g. Int, Float, etc.) as needed. Data is passed between languages
mutable struct Data
    data::String
    owner::Language
end


# ExchangeData function exchanges data between languages
function ExchangeData(exchange::Exchange, data::Data)
    if data.owner == exchange.from
        data.owner = exchange.to
        println("Data exchanged from $(exchange.from.name) to $(exchange.to.name)")
    elseif data.owner == exchange.to
        data.owner = exchange.from
        println("Data exchanged from $(exchange.to.name) to $(exchange.from.name)")
    else
        println("Data owner is not a part of the exchange")
    end
end

# Test framework
r = Language("R", "3.6.1")
julia = Language("Julia", "1.3.1")
python = Language("Python", "3.7.4")
r_to_julia = Exchange(r, julia)
julia_to_python = Exchange(julia, python)
python_to_r = Exchange(python, r)
data = Data("Hi from R", r)
println(data.data)
println(data.owner.name)
ExchangeData(r_to_julia, data)
println(data.owner.name)
ExchangeData(julia_to_python, data)
println(data.owner.name)
ExchangeData(python_to_r, data)
println(data.owner.name)

