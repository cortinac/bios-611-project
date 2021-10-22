BIOS 611 Project
=================

To build the Dockerfile:

`docker build -t . bios611`

To set up the RStudio environment:

`docker run -e PASSWORD=YOURPASSWORD --rm -v $(pwd):/home/rstudio/project -p 8787:8787 -t bios611`

