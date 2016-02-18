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
33.33333% within 10 days 22 hours 9 minutes 
35% within 13 days 3 hours 19 minutes 
40% within 22 days 6 hours 5 minutes 
45% within 41 days 2 hours 7 minutes 
50% within 66 days 22 hours 37 minutes 
55% within 94 days 18 hours 30 minutes 
60% within 147 days 20 hours 42 minutes 
65% within 209 days 11 hours 25 minutes 
66.66667% within 231 days 19 hours 47 minutes 
70% within 287 days 6 minutes 
75% within 389 days 3 hours 26 minutes 
80% within 549 days 2 hours 29 minutes 
85% within 676 days 7 hours 36 minutes 
90% within 919 days 2 hours 52 minutes 
95% within 1287 days 2 hours 19 minutes 
100% within 1714 days 5 hours 46 minutes 

Percentage by certain durations:
13% within 30 minutes 
14% within 1 hour 
17% within 5 hours 
20% within 1 day 
30% within 7 days 
```

## Contact

If you have any suggestions, find a bug, or just want to say hey drop me a note at [@mhmazur](https://twitter.com/mhmazur) on Twitter or by email at matthew.h.mazur@gmail.com.

## License

MIT © [Matt Mazur](http://mattmazur.com)
