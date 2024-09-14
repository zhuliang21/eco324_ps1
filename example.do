**** Install required packages ****

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

****  Project Code ****

* clear environment
clear all
set more off

* set working directory
global eco324_ps1 "\\mysbfiles.campus.stonybrook.edu\liangzhu\eco324\ps1\"
// Note, you need to replace "\liangzhu\eco324\ps1\" with your own username and folder path


* open logging
log using "${eco324_ps1}example.log", replace

* import data
import delimited using ${eco324_ps1}verboven_cars.csv, clear

* close logging
log close