include("../lib/Essentials/src/Essentials.jl")

install_tidyverse()
install_janitor()
load_tidyverse()
load_janitor()


example01 = begin 
    # What is the avg unemployment rate?
    df = load_economics()
    mean(df[!, :unemploy])
end

example02 = begin 
    # what is the total change in population?
    df = load_economics()
    sum(df[!, :pop])
end

example03 = begin 
    # what is the average change y/y change in population?
    df = load_economics()
    mean(df[!, :psavert])
end

example04 = begin 
    # what is the average change y/y change in unemployment?
    df = load_economics()
    mean(df[!, :uempmed])
end

example05 = begin
    # what corolation is there between the change in unemployment and the change in population?
    df = load_economics()
    cor(df[!, :uempmed], df[!, :pop])
end

using Plots
example06 = begin 
    # create a model using the change in unemployment to predict the change in population
    df = load_economics()
    f(x) = cor(df[!, :uempmed], df[!, :pop]) * x
    test = f.(df[!, :uempmed])
    df[!, :predicted_uempmed] = test
    df
    # create loss function
    loss(x) = sum((df[!, :pop] .- x).^2)
    # find the best fit
    best_fit = argmin(loss, -100:100)
    loss(best_fit)
    # plot the best fit
    plot(-100:100, loss, label="loss", xlabel="slope", ylabel="loss")
    plot!([best_fit], [loss(best_fit)], seriestype=:scatter, label="best fit")
end
