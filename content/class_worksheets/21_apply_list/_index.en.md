---
pre: <b>10/26. </b>
title: "List and Apply"
weight: 21
summary: "The list data type and apply family of functions."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [The Data][]
-   [Apply `pet_split()`][]
-   [Working with Lists][]
-   [Read ALL the Files!][]

## Overview

The apply family of functions can be a handy way to perform analyses and transformations of data quickly. Today we will be using both to improve some previous tasks. First we will be revisiting `pet_split()` (last time), and solving an old annoyance regarding reading in several data files.

## The Data

We are going to be using class survey data for lab today. Please load it in using the following:

``` r
survey = read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/main/content/class_worksheets/4_r_rstudio/data/survey_data.csv")
```

## Apply `pet_split()`

The first thing we will be doing today is combining our `pet_split()` function and `lapply()` in order to split all of our `<DRINK>_day` comma separated columns at once. I've provided our fully generalized version of `pet_split()` below. Run the following to add it to your environment.

``` r
pet_split = function(pet_vector, possible_columns){
  
  # make a base dataframe with rows for each of our cases.
  pet_output = data.frame(
    "id" = 1:length(pet_vector)
    )
  
  # iterate through all options and create a column with NAs for it
  for(option in possible_columns){
    
    # make a new column with a character version of each possible option.
    pet_output[, as.character(option)] = NA
    
  }
  
  # fill output df
  for(option in possible_columns){
    
    # fill dataframe iterativly.
    pet_output[ , option] = grepl(option, pet_vector, ignore.case = TRUE)
    
  }
  
  # clear all know options
  for(option in possible_columns){
    
    # remove all known options
    pet_vector = gsub(pattern = option, pet_vector, replacement = '', ignore.case = TRUE)
    
  }
  
  # clear commas and whitespace
  pet_vector = gsub(pattern = ',', pet_vector, replacement = '', ignore.case = TRUE)
  pet_vector = trimws(pet_vector)
  
  # Fill in 'other'
  pet_output$other = pet_vector
  # Turn blanks into NAs
  pet_output[pet_output$other == "" & !is.na(pet_output$other), 'other'] = NA
  
  # return output
  return(pet_output)
}
```

Once you've got the function in your environment, we are going to use `lapply()` to apply it over all the relevant columns in our `survey` dataframe.

<div class="question">

Use `lapply()` to apply `pet_split()` to all of the `<DRINK>_days` columns in our `survey` dataframe. Save the results as `drink_dfs`. **DO NOT** include the `()` after `pet_split` when providing it as an argument; it will produce an error.

</div>

You will have gotten a list object back. Recall that lists are super-vectors. In this case, our list will be length 5, which each element containing an entire dataframe!

## Working with Lists

Working with lists it tricky. Because they can contain *anything* it is hard to have set rules. The only one you can always rely on is that you need to use double square brackets `[[ ]]` to work with the **contents** of a list. For example, in our new `drink_dfs` list, we can ask for the content of the first element either by position (`drink_dfs[[1]]`) or by name (`drink_dfs[["coffee_days"]]`). If you only use a single square bracket with a list (`drink_dfs[1]`) you will get the actual **first element** of a list, which is a list of length 1 with whatever the contents are inside of it. Confusing, I know.

<div class="question">

Run `str()` on both of the following:

-   drink_dfs\[\[1\]\]
-   drink_dfs\[1\]

What are the differences between the two?

</div>

Once we subset the list using `[[ ]]`, we can treat it like it was a normal dataframe; auto-complete will even still work! Start typing `drink_dfs[["coffee_days"]]$` into the console and hit tab. All of the columns of that dataframe will appear as normal!

A list of dataframes is actually a handy structure though, because it will allow us to work with all of those dataframes simultaneously. In the following example, I use `lapply()` to perform a custom function on each of our drink dataframes all at once. First I subset to just the day columns, then a get the column sums for each day.

``` r
lapply(drink_dfs, FUN = function(drink){
  
  # for each drink, find what day is was most frequently consumed by our class
  
  # subset to the day columns
  days = drink[, c("monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday")]
  
  # get the column sums for each day
  # recall each row is a person in class, and each column is a day
  # so the column sums would be the number of people who had X drink per day
  class_consumed = colSums(days)
  
  # return output
  return(class_consumed)
  
})
```

    $coffee_days
       monday   tuesday wednesday  thursday    friday  saturday    sunday 
            4         5         5         2         2         3         5 

    $tea_days
       monday   tuesday wednesday  thursday    friday  saturday    sunday 
            0         0         2         0         1         1         3 

    $soda.pop_days
       monday   tuesday wednesday  thursday    friday  saturday    sunday 
            4         4         2         2         3         1         3 

    $juice_days
       monday   tuesday wednesday  thursday    friday  saturday    sunday 
            6         6         7         7         8         6         5 

    $none_days
       monday   tuesday wednesday  thursday    friday  saturday    sunday 
            4         3         1         4         2         2         2 

That would have taken so much more typing otherwise. An apply function like this can make our code much cleaner and easier to read. The same could be done with a `for()` loop though, and there are rather minimal differences in most cases. Do whatever makes most sense to you!

## Read ALL the Files!

I promised I would share how to read multiple files at once and here we are. This is actually a common way I use `lapply()`. First, we have to have a directory of data files with identical structures. For this example, we will use the data from lab 3 (aggregation and merging). First, specify the path to the data folder of lab 3. You will have to find the specific path on your computer.

``` r
# change this to match your system
lab_3_data = "path/to/lab-3-tidy-agg-merge-NAME/data/"
```

Next, we will get a vector of all the file paths of the data inside that folder using `list.files()`. I use the *pattern* argument here to say "I only want files that contain this." In this case, it is the "econ\_" prefix so I only get our "econ_acs5_YEAR.csv" files.

``` r
econ_data_paths = list.files(lab_3_data, pattern = "econ_", full.names = TRUE)
```

Now, we will use `lapply()` to read in all of the population dataframes from that lab at once.

``` r
all_econ_data = lapply(econ_data_paths, read.csv)
```

You now have a list of length 6 with all of the econ data from that lab! No copy and pasting required. You can even pivot and merge them all at once too. First, I'll pivot everything from long to wide:

``` r
library(tidyr)

all_econ_data_wide = lapply(all_econ_data,
      FUN = pivot_wider,
      id_cols = c("GEOID", "NAME"),
      names_from = "variable",
      values_from = c("estimate", "moe"))
```

Next, we'll use `basename()` to give each dataframe a year identifier (we'll just use the file name for now). I'll do this one in a `for()` loop, as it's easier to match the file names and our data list.

``` r
for(i in 1:6){
  
  # get the file name I want
  file_name = basename(econ_data_paths[i])
  
  # add that as a column to the matching list element
  all_econ_data_wide[[i]]$file_name = file_name
}
```

Now we can bind them all together. I'll use `do.call()` here. Really this is the only time I ever use it, and I don't know what else it is helpful for.

``` r
merged_econ = do.call(rbind, all_econ_data_wide)
```

<div class="question">

Repeat this process with the "pop_acs5_XXXX" CSVs from lab 3.

</div>

  [Overview]: #overview
  [The Data]: #the-data
  [Apply `pet_split()`]: #apply-pet_split
  [Working with Lists]: #working-with-lists
  [Read ALL the Files!]: #read-all-the-files
