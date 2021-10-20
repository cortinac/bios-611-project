BIOS 611 Project
=================

To build the Dockerfile:
`docker build -t . bios611`

To set up the RStudio environment:
`docker run -e PASSWORD=pw --rm -v $(pwd):/home/rstudio -p 8787:8787 -t bios611`

