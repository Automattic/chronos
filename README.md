# Chronos

Chronos is an R script that helps you analyze the distribution of time between two events.

## Installing R

If you've never used R before, you'll need to [install R](https://cran.r-project.org/mirrors.html) and optionally download a tool like [RStudio](https://www.rstudio.com/products/rstudio/download/) to run this script. Use `setwd()` to change the working directory to match the location of this script.

## How it works

In order for the script to work, all you need to do is to generate a CSV file with two columns, one containing the unix timestamp of the first event and the second containing a unix timestamp of the second event:

```
1350268044,1408676495
1307322538,1350061315
1307676110,1340667657
1307661905,1337311786
1307758702,1428877904
1307654497,1385588891
1308368305,1317787248
1307657774,1428201852
```

Add your CSV to the `data` directory, then update the last line of `chronos.R` to reference that file instead of the example file.

To analyze the data, within RStudio simply load the script using `source("chronos.R")`.

Here's the analysis of the included example data:

```
Distribution:
5% within 2 minutes 
10% within 5 minutes 
15% within 1 hour 21 minutes 
20% within 1 day 38 minutes 
25% within 3 days 2 hours 58 minutes 
30% within 6 days 9 hours 20 minutes 
33.33333% within 11 days 
35% within 14 days 
40% within 23 days 
45% within 42 days 
50% within 67 days 
55% within 95 days 
60% within 148 days 
65% within 210 days 
66.66667% within 232 days 
70% within 288 days 
75% within 390 days 
80% within 550 days 
85% within 677 days 
90% within 920 days 
95% within 1288 days 
100% within 1715 days 

Percentage by certain durations:
13% within 30 minutes
14% within 1 hour
17% within 5 hours
20% within 1 day
30% within 7 days
```

## Contact

This script was originally created by [@mhmazur](https://twitter.com/mhmazur) - feel free to reach out if you have any questions.
