# Getting-and-Cleaning-Data-Course-Project
Repository for the [Coursera's Getting and Cleaning Data Course Project](https://www.coursera.org/course/getdata)

This script was created as an exercise for Coursera's Getting and Cleaning Data Project. It was created on a Mac OS with R (version 3.2.1) and it's probably going to work on all *nix operating systems with a recent version of R installed.
The script operates by downloading, elaborating and summarizing the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) published by UCI.


# Repository Contents
* README.md - this file
* CodeBook.md - a description of the output file
* run_analysis.R - The R script

# Usage
The script can be run in R Console or R-Studio by loading the source:

```r
source('run_analysis.R')
```

The source offers two main functions.
The `get_data()`function downloads the data. Use it only if you do not have the raw data in your working directory.
The `run_analysis()` function will perform the analysis on the raw data present in your working directory and output a `tidy_data.txt` file.


