FROM rocker/r-base:4.2.1

LABEL maintainer "Arnfinn Hykkerud Steindal <arnfinn.steindal@gmail.com>"

# system libraries of general use
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libcurl3-gnutls=7.79.1-3~exp2 \
    libcurl4-gnutls-dev=7.79.\* \
    libssl-dev=1.1.\* \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# basic R functionality
RUN R -e 'install.packages(c("curl", "rlang", "methods", "shiny", "shinyjs", "shinyalert", "dplyr", "magrittr", "jsonlite", "ggplot2", "plotly"), repos="https://cloud.r-project.org/")'

CMD ["R"]
