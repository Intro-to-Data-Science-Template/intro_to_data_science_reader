---
pre: <b>10/3. </b>
title: "Advanced Plotting"
weight: 12
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
    -   [3. Your First ggplot][]
    -   [4. ggplot2 Code][]

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

### 3. Your First ggplot

Open up the plot builder, and import the `nbi_hampshire` dataframe. For our first variable, click and drag `YEAR_BUILT_027` into the "X" elements box. This will put `YEAR_BUILT_027` on our X axis. Next, click and drag `STRUCTURAL_EVAL_067` into the "Y" element box to place in on the Y axis. In a moment the plot preview area should update, creating a scatter plot.

![][4]

You can continue adding variables to elements to further develop the plot.

<div class="question">

Click and drag the `ROUTE_PREFIX_005B_L` variable into the "color" element. How does this change the plot?

</div>

Once you have added the new element, click on the plot type window next to the variables. In the menu that pops up, select "Jitter." A jitter-ed scatter plot adds a little random noise to the dot locations so that multiple dots that are in the same spot can be seen.

![][5]

Once that is done, look toward the bottom of the plot builder at the options menus. In the "Labels & Title" menu, add a title, labels for the X and Y axes, and a label for the colors.

![][6]

You can add further refinements if you would like. Once you are done, go to the last option menu that says "Code." Open that menu to see the `ggplot2` code creating your plot! Copy the code and paste it into a script to continue working on it.

![][7]

### 4. ggplot2 Code

`esquisse` is a helpful shortcut in getting started, but you will almost always need to do some fine-tuning of the resulting code. The first step of that however is understanding all the component parts.

`ggplot` builds plots in layers. It combines those layers using a (completely unique, not used for anything else) syntax which uses the `+` sign to combine layers. The most common layers are as follows, and you should be able to see them in your `esquisse` output.

`ggplot(<DATA>) +`
:   Here is where you define the dataframe you are working with. You can use the column names from this dataframe in the rest of the ggplot code without using the dataframe name and `$`.

`aes(x = <VARIABLE>, y = <VARIABLE>, color = <VARIABLE>) +`
:   The `aes()` or "aesthetic mappings" tell ggplot what variables belong where. These are the elements boxes we see in `esquisse`. You can either define the `aes` alone, in which case it will use the same variables for all layers of the plot. Alternatively, you can define the `aes` for a specific `geom_XXXX()` layer as we will see next.

`geom_jitter(size = <VALUE>) +`
:   Next up comes out `geom_XXXX()` layers. One geom defines one type of plot to layer on. For example, here we have a `geom_jitter()` which adds a jittered scattered plot layer. We could also use a `geom_bar()` for a bar plot, a `geom_histogram()` for a histogram, etc. We could define `aes` inside a geom if we wanted, instead of outside like we did before, in which case the data would *only apply for that layer*. We could thus theoretically layer on multiple datasets in one plot.

`labs() +`
:   The `labs()` function lets us add labels, titles, and captions to our plot. You will usually at least want to add the `title = <CHARACTER>`, `x = <CHARACTER>`, and `y = <CHARACTER>` arguments.

`theme_minimal()`
:   ggplot has a number of pre-defined themes you can use. You can find the one you like most, but I typically use `theme_minimal()` as it cuts away everything that isn't useful.

All of these elements build up to something that will look about like this:

``` r
ggplot(nbi_hampshire) +
  aes(
    x = YEAR_BUILT_027,
    y = STRUCTURAL_EVAL_067,
    color = ROUTE_PREFIX_005B_L
  ) +
  geom_jitter(size = 1.5) +
  labs(title = "Vehicle Bridges in Hampshire County",
       x = "Year",
       y = "Structural Evaluation Score",
       color = "Type") +
  theme_minimal()
```

<img src="12_adv_plot_files/figure-gfm/unnamed-chunk-5-1.png" width="768" />

<div class="question">

Create a box plot using ggplot/esquisse which shows `STRUCTURAL_EVAL_067` by `MAINTENANCE_021_L`.

</div>

  [Overview]: #overview
  [The Data]: #the-data
  [Problem Sets]: #problem-sets
  [1. Install Esquisse]: #install-esquisse
  [2. Learning the Esquisse UI]: #learning-the-esquisse-ui
  [3. Your First ggplot]: #your-first-ggplot
  [4. ggplot2 Code]: #ggplot2-code
  [Datasaurus - Alberto Cairo]: img/datasaurus.png
  [ggplot2 cheatsheet]: https://www.rstudio.org/links/data_visualization_cheat_sheet
  [National Bridge Inventory Dataset]: https://www.fhwa.dot.gov/bridge/nbi/ascii.cfm
  [data documentation]: https://www.fhwa.dot.gov/bridge/mtguide.pdf
  [1]: img/esquisse_1.png
  [2]: img/esquisse_2.png
  [3]: img/esquisse_3.png
  [4]: img/esquisse_4.png
  [5]: img/esquisse_5.png
  [6]: img/esquisse_6.png
  [7]: img/esquisse_7.png
