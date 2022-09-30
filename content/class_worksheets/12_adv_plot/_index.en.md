---
pre: <b>10/3. </b>
title: "Advanced Plotting"
weight: 10
summary: "How to make our plots actually look nice."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [The Data][]
-   [Problem Sets][]
    -   [1. Install Esquisse][]
    -   [2. Learning the Esquisse UI][]

## Overview

Visualizing data is very important for understanding that data. All sorts of otherwise unknown patterns can slip by if we don't take the time to look at our data. For example:

![Datasaurus - Alberto Cairo][]

While the Datasaurus is fun, it is also a cautionary tale. Along the top of the plot there are various numerical representations of the data, all of which look completely normal! Such oddities can easily slip past us without proper visualization.

Visualization also serves another crucial purpose; to communicate our findings with other people. Dealing with and understanding data is an acquired skill, one you're already more familiar with than the vast majority of people. Visualizations often allow you to quickly communicate your findings with people who are not as well acquainted with data.

Today we will be learning some more advanced plotting tools. While we will often rely on the 5 canonical plots we learned before, a lot can be done to spruce them up. We will primarily be using the `ggplot2` package for this task. While it is very powerful, it takes more effort to make even a simple ggplot. That effort is often worth it however if the intent is to share your visualization.

I highly recommend you open up the [ggplot2 cheatsheet][] while you work.

## The Data

Load in the data for today by running the following:

``` r
nbi_hampshire = read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/adv_plot/content/class_worksheets/12_adv_plot/data/nbi_hampshire.csv")
```

Today we will be using data from the 2022 [National Bridge Inventory Dataset][]. Specifically, we will be looking at vehicle bridges in Hampshire county (where we are). We're going to look at what kinds of variables might contribute to poor bridge conditions, where there are poor bridge conditions, and which entities are responsible for maintaining them. The [data documentation][] for this dataset is quite thick, so I will provide you with a data dictionary for today.

STRUCTURE_NUMBER_008
:   Unique ID for the bridge

COUNTY_CODE_003_L
:   Name of the county where the bridge is located

ROUTE_PREFIX_005B_L
:   Route signing prefix for the inventory route

MAINTENANCE_021_L
:   The actual name(s) of the agency(s) responsible for the maintenance of the structure

YEAR_BUILT_027
:   The year of construction of the structure

ADT_029
:   The average daily traffic volume for the inventory route based on most recent available data

STRUCTURE_KIND_043A_L
:   The kind of material and/or design of the structure

STRUCTURAL_EVAL_067
:   A rating of the structural evaluation of the bridge based on inspections of its main structures, substructures, and/or its load ratings

BRIDGE_IMP_COST_094
:   Estimated costs for bridge improvements

## Problem Sets

### 1. Install Esquisse

Today we will be using a package called `esquisse` to help us make our plots. It provides an interactive interface to put together the basic components of our plots. It is not perfect, and cannot be used to create a fully realized visualization, but it can often do the first 50% for you pretty quickly. Install it using the following:

``` r
install.packages("esquisse")
```

{{% notice info %}}
You will need to fully close R Studio and restart it after installing `esquisse`. This is so the addin functionality can work.
{{% /notice %}}

### 2. Learning the Esquisse UI

Once you have restarted R Studio and re-loaded the data, we can start using using `esquisse` to build draft plots. Start the UI by going to the **Addins** menu at the top of R Studio and clicking on the **'ggplot2' builder** option under `esquisse`.

![][1]

`esquisse` will load for a second, and then ask you to select a data source. Pick our `nbi_hampshire` dataframe and click **Import Data**.

![][2]

After you have imported your data, you will be taken to the plot builder. I have created a diagram of the different elements below. Along the top are the variables from your dataframe. You can click and drag the variables into the various element areas below. On the left of this section will be a display of what plot `esquisse` thinks may work well given your variables and elements, but you can click on it to manually change it. In the center is the plot preview, which will automatically update as you make changes. At the bottom is the options bar, with several other menus you can go through to adjust your plot. Importantly, in the far right option menu you can copy the code which will generate the plot you are looking at! You will want to copy that code into your document so you can remake this plot later, and further adjust it.

![][3]

  [Overview]: #overview
  [The Data]: #the-data
  [Problem Sets]: #problem-sets
  [1. Install Esquisse]: #install-esquisse
  [2. Learning the Esquisse UI]: #learning-the-esquisse-ui
  [Datasaurus - Alberto Cairo]: img/datasaurus.png
  [ggplot2 cheatsheet]: https://www.rstudio.org/links/data_visualization_cheat_sheet
  [National Bridge Inventory Dataset]: https://www.fhwa.dot.gov/bridge/nbi/ascii.cfm
  [data documentation]: https://www.fhwa.dot.gov/bridge/mtguide.pdf
  [1]: img/esquisse_1.png
  [2]: img/esquisse_2.png
  [3]: img/esquisse_3.png
