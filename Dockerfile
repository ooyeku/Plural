# Use the official Julia image from the Docker Hub
FROM julia:latest

# install R
RUN apt-get update && apt-get install -y r-base

# install R packages
RUN R -e "install.packages('tidyverse', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('janitor', repos='http://cran.us.r-project.org')"

# install Python
RUN apt-get update && apt-get install -y python3-pip


# install utils (ex htop etc)
RUN apt-get update && apt-get install -y htop

# install git
RUN apt-get update && apt-get install -y git

# install wget and curl
RUN apt-get update && apt-get install -y wget
RUN apt-get update && apt-get install -y curl

# install tree
RUN apt-get update && apt-get install -y tree

# install tmux
RUN apt-get update && apt-get install -y tmux

RUN R -e "install.packages('devtools', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('tidyverse', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('janitor', repos='http://cran.us.r-project.org')"

# Set the working directory to /usr/myapp in the container
WORKDIR /julia/

# install tidyverse and janitor to julia (using Conda.jl)
RUN julia -e 'using Pkg; Pkg.add("Conda"); using Conda; Conda.add("r-tidyverse"); Conda.add("r-janitor")'

# Copy the current directory contents (where the Dockerfile is located) into the container at /usr/myapp
COPY . .

# Copy the Julia script
COPY src/install_packages.jl .

# Run the Julia script to install the packages
RUN julia src/install_packages.jl

# Run src/Plural.jl whenever a container starts
CMD ["julia"]