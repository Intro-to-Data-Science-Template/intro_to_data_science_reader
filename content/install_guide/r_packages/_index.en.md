---
pre: <b>6. </b>
title: "R Packages"
weight: 6
format:
  hugo:
    toc: true
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---



-   [Overview][]

## Overview

R uses a number of packages to work with data, which are largely community created. This means many of them do not come pre-installed with R. Here is a list of packages we will use this semester. You should be able to paste this into the R console and press enter to install them all at once.

    install.packages("tidyverse");
    install.packages("dplyr");
    install.packages("skimr");
    install.packages("ggplot2");
    install.packages("mosaic");
    install.packages("plotly");
    install.packages("todor");
    install.packages("compareDF");
    install.packages("future");
    install.packages("rvest");
    install.packages("rrefine");
    install.packages("tidycensus");
    install.packages("RSQLite");
    install.packages("sf");
    install.packages("statnet")

To make sure everything was installed, run the following command. It should return `TRUE`.

    all(c("tidyverse", "dplyr", "skimr", "ggplot2", "mosaic", "plotly", "todor", "compareDF", "future", "rvest", "rrefine", "tidycensus", "RSQLite", "sf", "statnet") %in% installed.packages()[,"Package"])

  [Overview]: #overview
