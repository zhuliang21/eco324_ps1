# Stata Beginer Guide

## Basic commands

Open a log file

```stata
log using "log_file.log", replace

* Run your commands here

log close
```

Import csv data file to Stata

```stata
import delimited "data.csv", clear
```

Rename a variable

```stata
rename old_name new_name
```

Generate a new variable

```stata
* Generate a new variable by existing variables
gen new_var = old_var1/100

* Generate a new variable by grouping existing variables
egen new_var = group(old_var)

* Generate a new variable by summing existing variables
egen new_var = sum(old_var)
```

Drop a variable

```stata
drop var_name
```

Run a regression

```stata
* Run a simple OLS regression
reg y x1 x2
```

Summary statistics

```stata
* Summary statistics for all variables
summarize

* Summary statistics for a specific variable
summarize var_name
```

Construct a set of variables and call them by *

```stata
* Construct a set of variables (IV)
IV1_fuel = ...
IV1_height = ...
IV1_weight = ...

* using IV1* to call all variables starting with IV1, e,g, 
summarize IV1*
```

## Install third party packages

For example, package `ivreghdfe` is for running IV regression with fixed effects. It is not included in the official Stata package. You can install it by running the following command in Stata:

```stata
* Install ftools (remove program if it existed previously)
cap ado uninstall ftools
net install ftools, from("https://raw.githubusercontent.com/sergiocorreia/ftools/master/src/")

* Install reghdfe
cap ado uninstall reghdfe
net install reghdfe, from("https://raw.githubusercontent.com/sergiocorreia/reghdfe/master/src/")

* Install ivreg2, the core package
cap ado uninstall ivreg2
ssc install ivreg2

* Finally, install this package
cap ado uninstall ivreghdfe
net install ivreghdfe, from("https://raw.githubusercontent.com/sergiocorreia/ivreghdfe/master/src/")
```

Here is the GitHub repository for `ivreghdfe`: [ivreghdfe](https://github.com/sergiocorreia/ivreghdfe) in case you want to check.

## IV regression with fixed effects

```stata
* Run IV regression with fixed effects
ivreghdfe y (x1 = IV*) x2 x3, absorb(fe_var)
```

it will run a regression of y on x1, x2, x3, with x1 being instrumented by all IVs starting with IV, and fixed effects of fe_var.
