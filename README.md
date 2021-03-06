COVID-19 Vaccination Rates and Social Vulnerability Index
=================

This project looks at the CDC's county-level vaccination data over time since August 1, 2021 and on November 31, 2021. The project looks at different indicators from the CDC's Social Vulnerability Index, along with other factors such as the county's metro status, to see if there is a relationship between these and county-level COVID-19 vaccination rates. The project looks at both the rate on November 31 and the change in rate from August 1 to November 1.

The final report can be found in report.pdf. This can be accessed using the following instructions:

First, use the following line in your shell to build the Docker image:

```
docker build . -t bios611
```

Then set up the RStudio environment using the next line. Note that YOURPASSWORD can be replaced by any unique password you would like to use.

```
docker run -e PASSWORD=YOURPASSWORD --rm -v $(pwd):/home/rstudio/project -p 8787:8787 -t bios611
```

RStudio can then be accessed at `localhost:8787` in your browser. To create the report, go to the terminal in RStudio and run the following two lines:

```
cd project
make project.pdf
```

Note that this requires an Internet connection in order to pull the data from the CDC API. This will take a few minutes to complete. Look for project.pdf in the project directory once R has finished running.

## Shiny App

The Shiny app creates a plot for a given county showing its vaccination rate over time since August. The dropdown menu allows you to search for and select a county, and the user can also select an age group and whether they want to look at the data for the complete vaccine series or just the first dose.


To start the Shiny app from within RStudio, create the Docker image above, and begin RStudio with the following bash command:

```
docker run -e PASSWORD=YOURPASSWORD --rm -v $(pwd):/home/rstudio/project -p 8080:8080 -p 8787:8787 -t bios611
```

Then enter RStudio by going to `localhost:8787` in your browser. In the RStudio terminal, make and launch the shiny app using the following lines:

```
cd project
make shiny
```

This will take a few minutes to run. Once it is finished running, access the app by going to `localhost:8080` in your browser.

To start the Shiny app directly from the command line, without running RStudio, use the following:

```
docker run -e PASSWORD=YOURPASSWORD --rm -v $(pwd):/home/rstudio/project -p 8080:8080 -it bios611 sudo -H -u rstudio /bin/bash -c "cd ~/project; make shiny"
```

After this is finished running, the app should be available at `localhost:8080` in your browser.

## Sources

Vaccination data from: https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-County/8xkx-amqh

SVI data from: https://www.atsdr.cdc.gov/placeandhealth/svi/documentation/SVI_documentation_2018.html
