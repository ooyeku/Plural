module Plural
include("../lib/Essentials/src/Essentials.jl")
using .Essentials
export show_environment, memory_usage, Essentials

# show all variables in the environment
function show_environment()
    for name in names(Main)
        if name != :show_environment
            println(name)
        end
    end
end

# memory usage
function memory_usage()
    println("memory usage: ", Sys.free_memory() / 1000000, " MB")
end

end # module Plural