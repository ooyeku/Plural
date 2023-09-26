#=
install_packages:
- Julia version: 
- Author: olayeku
- Date: 2023-09-17
=#

using Pkg

# install packages
Pkg.add("RCall")
Pkg.add("DataFrames")
Pkg.add("CSV")
Pkg.add("JSONTables")
Pkg.add("XLSX")
Pkg.add("Feather")
Pkg.add("StatsBase")
Pkg.add("Conda")
Pkg.add("StatsPlots")
Pkg.add("Plots")
Pkg.add("Dates")
Pkg.add("BenchmarkTools")
Pkg.add("DataFramesMeta")
Pkg.add("Flux")

# build packages
Pkg.build("RCall")
Pkg.build("DataFrames")
Pkg.build("CSV")
Pkg.build("JSONTables")
Pkg.build("XLSX")
Pkg.build("Feather")
Pkg.build("StatsBase")
Pkg.build("StatsPlots")
Pkg.build("Plots")
Pkg.build("Dates")
Pkg.build("BenchmarkTools")
Pkg.build("DataFramesMeta")
Pkg.build("Flux")
Pkg.build("Conda")