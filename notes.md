Notes
=====

51 total "States"

The normal 50

Minus TX, HI

Add DC, PR, GU

Removed those with percent = 0 - should be all those missing

Note: For county and state populations there will be some error.
County populations were calculated using vaccination percents and counts, so they may vary slightly by day or type of count.
This was done since some counties did not submit data or were unknown, so they are not being included

Considering only doing dates after August or September - will speed up downloading of data and avoids issues with vaccine eligibility
Should also mean there are high enough vax rates to estimates populations

Line graph shiny app shows something is wrong with the state rates!  SEE WA!!!

Order of files (for MakeFile: import_data.R -> clean_vax_data.R -> state_levels.R -> today.R -> (figures_today.R, shiny_today.R, line_graph.R)
line_graph_counties.R is straight from clean_vax_data.R
