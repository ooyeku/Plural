#=
ex. Plural.run()

Quick start applicaton (launch REPL and upload all libs)

=#
# include("install_packages.jl")

function install_dep()
    include("install_packages.jl")
end

# Print welcome graphics (ASCII art of Plural with Julia logo)
function welcomeimage()
    println("_|_|_")
    println("_|_|_|_")
    println("_|y=mx+b|_")
    println("_|_e=mc^2_|_")
    println("_|_|_fx|=?|-|")
    println("_|_|_|x|x|o|_|_")
    println("_|_|_|o|x|x|_|_|_")
    println("_|_|_|x|o|o|_|_|_|_")
    println("_|_|_|_|_|_|_|_|_|_|_")
    println("_|_ _ Julia_ _ _ _  _|_")
    println("_|_|_||_||_||_||_||_|_|_")
    println("_|_ _ Python _ _ _ _ _|_")
    println("_|_|_||_||_||_||_||_|_|_")
    println("_|_ _ _ R _ _ _ _|_")
    println("_|_|_||_||_||_||_||_|_|_")
    println("_|_ _ Plural _ _ _ _|_")
    println("_|_|_||_||_||_||_||_|_|_")
    println("|||||||||||||||||||||||||")
    println("|                   |")
    println("|                     |")
    println("|     ---     ---       |")
    println("|     [*]-----[*]        |")
    println("|          Y            |")
    println("|     ___________     |")
    println("|     |_|_|_|_|_|   |")
    println("|                 |")
    println("🎶🎶🎶🎶🎶🎶🎶🎶🎶🎶")
    println(" Welcome to Plural! ")
end

welcomeimage()