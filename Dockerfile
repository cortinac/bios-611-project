FROM rocker/verse
RUN R -e "install.packages(\"RSocrata\")"
RUN R -e "install.packages(\"shiny\")"
RUN R -e "install.packages(\"plotly\")"
RUN R -e "install.packages(\"tinytex\"); tinytex::install_tinytex()"
