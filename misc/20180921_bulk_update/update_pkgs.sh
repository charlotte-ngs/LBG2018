#!/bin/bash

sudo su - -c "R -e \"pkgs <- installed.packages();ii <- is.na(pkgs[, "Priority"]);pkgs <- pkgs[ii, 1];install.packages(pkgs, repos='http://cran.rstudio.com/')\""
