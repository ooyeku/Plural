include("../lib/Essentials/src/Essentials.jl")
using .Essentials 
Essentials.install_tidyverse()
Essentials.install_janitor()
Essentials.load_tidyverse()
Essentials.load_janitor()

df = Essentials.load_economics()

example01 = begin 
    # What is the avg unemployment rate?
    println("What is the avg unemployment rate?")
    mean(df[!, :unemploy])
end

example02 = begin 
    # what is the total change in population?
    println("what is the total change in population?")
    sum(df[!, :pop])
end

example03 = begin 
    # what is the average change y/y change in population?
    println("what is the average change y/y change in population?")
    mean(df[!, :psavert])
end

example04 = begin 
    # what is the average change y/y change in unemployment?
    println("what is the average change y/y change in unemployment?")
    mean(df[!, :uempmed])
end

using Statistics, StatsBase
example05 = begin
    # what corolation is there between the change in unemployment and the change in population?
    println("what corolation is there between the change in unemployment and the change in population?")
    cor(df[!, :uempmed], df[!, :pop])
end


example06 = begin 
    # create a model using the change in unemployment to predict the change in population
    println("create a model using the change in unemployment to predict the change in population")
    f(x) = cor(df[!, :uempmed], df[!, :pop]) * x
    test = f.(df[!, :uempmed])
    df[!, :predicted_uempmed] = test
    df
    # create loss function
    loss(x) = sum((df[!, :pop] .- x).^2)
    println("loss: ", loss(test))
    # find the best fit
    best_fit = argmin(loss, -100:100)
    println("best fit: ", best_fit)
    println("loss: ", loss(best_fit))
end
