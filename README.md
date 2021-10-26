BIOS 611 Project
=================

To build the Dockerfile:

```
docker build -t . bios611
```

To set up the RStudio environment:

```
docker run -e PASSWORD=YOURPASSWORD --rm -v $(pwd):/home/rstudio/project -p 8787:8787 -t bios611
```

## Shiny App

The Shiny app creates a plot for a given county showing its vaccination rate over time since August. The dropdown menu allows you to search for and select a county, and the user can also select an age group and whether they want to look at the data for the complete vaccine series or just the first dose.


To start the Shiny app from within R Studio, first begin R Studio with the following bash command:

```
docker run -e PASSWORD=YOURPASSWORD --rm -v $(pwd):/home/rstudio/project -p 8787:8787 -t bios611
```

Then enter R Studio by going to `localhost:8787` in your browser. In the terminal, launch the shiny app using the following line:


```
Rscript ~/project/line_graphs_counties.R
```

This will take a few minutes to run. Once it is finished running, access the app by going to `localhost:8080` in your browser.

To start the Shiny app directly from the command line, without running R studio, use the following:

```
docker run -e PASSWORD=YOURPASSWORD --rm -v $(pwd):/home/rstudio/project -p 8080:8080 -it bios611 sudo -H -u rstudio /bin/bash -c "cd ~/project; Rscript line_graphs_counties.R"
```

After this is finished running, the app should be available through `localhost:8080` in your browser.
