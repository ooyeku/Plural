#=
reader:
- Julia version: 1.9.3
- Author: olayeku
- Date: 2023-08-31
=#

# Struct for handling  directory paths
struct DirPath
    path::String
    files::Array{String, 1}
    dirs::Array{String, 1}
end

# DirPath constructor
function DirPath(path::String)
    files = readdir(path)
    dirs = filter(x -> isdir(joinpath(path, x)), files)
    return DirPath(path, files, dirs)
end

# DirPath method for listing files in a directory
files(dir::DirPath) = if length(dir.files) == 0
        return "No files in this directory"
    else
        return dir.files
    end

# DirPath method for listing dirs in a directory
dirs(dir::DirPath) = if length(dir.dirs) == 0
        return "No directories in this directory"
    else
        return dir.dirs
    end

# DirPath method for listing files and dirs in a directory
function ls(dir::DirPath)
    return if length(dir.files) == 0 && length(dir.dirs) == 0
        return "No files or directories in this directory"
    else
        return dir.files, dir.dirs
    end
end

struct Workspace
    dirpath::DirPath
    files::Array{String, 1}
    dirs::Array{String, 1}
    jlscripts::Array{String, 1}
    rscripts::Array{String, 1}
    pyscripts::Array{String, 1}
    jldirs::Array{String, 1}
    rdirs::Array{String, 1}
    pydirs::Array{String, 1}
    csvfiles::Array{String, 1}
    jsonfiles::Array{String, 1}
    txtfiles::Array{String, 1}
    mdfiles::Array{String, 1}
end

# Workspace constructor
function Workspace(dirpath::DirPath)
    files = filter(x -> isfile(joinpath(dirpath.path, x)), dirpath.files)
    dirs = filter(x -> isdir(joinpath(dirpath.path, x)), dirpath.dirs)
    jlscripts = filter(x -> endswith(x, ".jl"), files)
    rscripts = filter(x -> endswith(x, ".R"), files)
    pyscripts = filter(x -> endswith(x, ".py"), files)
    jldirs = filter(x -> endswith(x, ".jl"), dirs)
    rdirs = filter(x -> endswith(x, ".R"), dirs)
    pydirs = filter(x -> endswith(x, ".py"), dirs)
    csvfiles = filter(x -> endswith(x, ".csv"), files)
    jsonfiles = filter(x -> endswith(x, ".json"), files)
    txtfiles = filter(x -> endswith(x, ".txt"), files)
    mdfiles = filter(x -> endswith(x, ".md"), files)
    return Workspace(dirpath, files, dirs, jlscripts, rscripts, pyscripts, jldirs, rdirs, pydirs, csvfiles, jsonfiles, txtfiles, mdfiles)
end

# Workspace method for listing files in workspace
files(ws::Workspace) = if length(ws.files) == 0
        return "No files in this workspace"
    else
        return ws.files
    end

# Workspace method for listing dirs in workspace
dirs(ws::Workspace) = if length(ws.dirs) == 0
        return "No directories in this workspace"
    else
        return ws.dirs
    end

# Workspace method for listing files and dirs in workspace
ls(ws::Workspace) = if length(ws.files) == 0 && length(ws.dirs) == 0
        return "Empty workspace"
    else
        return ws.files, ws.dirs
    end

# Workspace method for listing Julia scripts in workspace
jlscripts(ws::Workspace) = if length(ws.jlscripts) == 0
        return "No Julia scripts in this workspace"
    else
        return ws.jlscripts
    end

# Workspace method for listing R scripts in workspace
rscripts(ws::Workspace) = if length(ws.rscripts) == 0
        return "No R scripts in this workspace"
    else
        return ws.rscripts
    end

# Workspace method for listing Python scripts in workspace
pyscripts(ws::Workspace) = if length(ws.pyscripts) == 0
        return "No Python scripts in this workspace"
    else
        return ws.pyscripts
    end

# Workspace method for listing CSV files in workspace
csvfiles(ws::Workspace) = if length(ws.csvfiles) == 0
        return "No CSV files in this workspace"
    else
        return ws.csvfiles
    end

# Workspace method for listing JSON files in workspace
jsonfiles(ws::Workspace) = if length(ws.jsonfiles) == 0
        return "No JSON files in this workspace"
    else
        return ws.jsonfiles
    end

# Workspace method for listing TXT files in workspace
txtfiles(ws::Workspace) = if length(ws.txtfiles) == 0
        return "No TXT files in this workspace"
    else
        return ws.txtfiles
    end

# Workspace method for listing MD files in workspace
mdfiles(ws::Workspace) = if length(ws.mdfiles) == 0
        return "No MD files in this workspace"
    else
        return ws.mdfiles
    end
