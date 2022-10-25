---
pre: <b>10/24. </b>
title: "Iteration"
weight: 20
summary: "Iterate through elements and give our function superpowers."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [The Data][]
-   [A Refresher on our `pet_split()` Function][]
-   [Break it Down][]
    -   [Arbitrary Output][]
    -   [Test for Each Option][]
    -   [Remove the Known Options to Find "Other"][]
    -   [Turn it Back into a Function][]

## Overview

Iteration allows us to tell R to work on a whole sets of things at once: multiple files, multiple columns, multiple whatever. This can save quite a bit of time. It also lets us to work on problems with dependence, where the decisions of each step depends on the result of the previous step.

For our worksheet today, we are going to be solving some annoyances of the past. I am going to walk you though modifying our `pet_split()` function from last week's functions worksheet to make it even more generalizable.

## The Data

We are going to be using class survey data for lab today. Please load it in using the following:

``` r
survey = read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/main/content/class_worksheets/4_r_rstudio/data/survey_data.csv")
```

## A Refresher on our `pet_split()` Function

Recall from last week that our `pet_split()` function looked at the `pets` column in our `survey` dataframe, and tidy-ed up the column so that instead of having a single character with multiple pets in it, we had a dataframe with `TRUE` and `FALSE` for each pet type, along with "other." You can see the finished function below:

``` r
pet_split = function(pet_vector) {
  
  # make new dataframe for output
  pet_output = data.frame(
  "id" = 1:length(pet_vector),
  "dog" = NA,
  "cat" = NA,
  "fish" = NA,
  "bird" = NA,
  "reptile" = NA,
  "rock" = NA,
  "none" = NA,
  "other" = NA)
  
  # get a binary for each known pet type
  pet_output$dog = grepl(pattern = "dog", x = pet_vector, ignore.case = TRUE)
  pet_output$cat = grepl(pattern = "cat", x = pet_vector, ignore.case = TRUE)
  pet_output$fish = grepl(pattern = "fish", x = pet_vector, ignore.case = TRUE)
  pet_output$bird = grepl(pattern = "bird", x = pet_vector, ignore.case = TRUE)
  pet_output$reptile = grepl(pattern = "reptile", x = pet_vector, ignore.case = TRUE)
  pet_output$rock = grepl(pattern = "rock", x = pet_vector, ignore.case = TRUE)
  pet_output$none = grepl(pattern = "none", x = pet_vector, ignore.case = TRUE)
  
  # remove all known pets and clean remaining text
  pet_vector = gsub(pattern = "dog", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = gsub(pattern = "cat", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = gsub(pattern = "fish", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = gsub(pattern = "bird", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = gsub(pattern = "reptile", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = gsub(pattern = "rock", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = gsub(pattern = "none", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = gsub(pattern = ",", pet_vector, replacement = "", ignore.case = TRUE)
  pet_vector = trimws(pet_vector)
  
  # Fill in "other"
  pet_output$other = pet_vector
  # Turn blanks into NAs
  pet_output[pet_output$other == "", "other"] = NA
  
  # return
  return(pet_output)
}

pet_split(pet_vector = survey$pets)
```

       id   dog   cat  fish  bird reptile  rock  none        other
    1   1 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    2   2 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    3   3  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE Plants (two)
    4   4 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    5   5  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    6   6  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    7   7 FALSE  TRUE FALSE FALSE   FALSE  TRUE FALSE         <NA>
    8   8  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    9   9 FALSE FALSE FALSE FALSE   FALSE FALSE FALSE Spider Plant
    10 10 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE         <NA>
    11 11  TRUE FALSE FALSE FALSE    TRUE FALSE FALSE         <NA>
    12 12  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    13 13 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE         <NA>
    14 14 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    15 15 FALSE FALSE FALSE FALSE    TRUE FALSE FALSE        Plant

Now, that is cool, but we can make it better. Specifically, if we look at our survey dataframe, we have the exact same problem in our `<DRINK>_days` columns and the `recreation` column. By the end of this worksheet, our `pet_split()` function will work on *any* column with comma separated values.

## Break it Down

Our first step is going to be writing the code to accomplish what we want, then we can package it as a function. I've gutted our `pet_split()` function below. We will be starting from that base and working to make it so that we never explicitly call for anything in our code. For example, instead of coding all of the possibilities of pet (dog, cat, fish, bird, reptile, rock, none) inside the function itself, we want to write our code such that it can accept *any* list of possibilities as an argument and work from that.

``` r
# set up a psudo argument
pet_vector = survey$pets

# make new dataframe for output
pet_output = data.frame(
"id" = 1:length(pet_vector),
"dog" = NA,
"cat" = NA,
"fish" = NA,
"bird" = NA,
"reptile" = NA,
"rock" = NA,
"none" = NA,
"other" = NA)

# get a binary for each known pet type
pet_output$dog = grepl(pattern = "dog", x = pet_vector, ignore.case = TRUE)
pet_output$cat = grepl(pattern = "cat", x = pet_vector, ignore.case = TRUE)
pet_output$fish = grepl(pattern = "fish", x = pet_vector, ignore.case = TRUE)
pet_output$bird = grepl(pattern = "bird", x = pet_vector, ignore.case = TRUE)
pet_output$reptile = grepl(pattern = "reptile", x = pet_vector, ignore.case = TRUE)
pet_output$rock = grepl(pattern = "rock", x = pet_vector, ignore.case = TRUE)
pet_output$none = grepl(pattern = "none", x = pet_vector, ignore.case = TRUE)

# remove all known pets and clean remaining text
pet_vector = gsub(pattern = "dog", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = gsub(pattern = "cat", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = gsub(pattern = "fish", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = gsub(pattern = "bird", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = gsub(pattern = "reptile", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = gsub(pattern = "rock", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = gsub(pattern = "none", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = gsub(pattern = ",", pet_vector, replacement = "", ignore.case = TRUE)
pet_vector = trimws(pet_vector)

# Fill in "other"
pet_output$other = pet_vector
# Turn blanks into NAs
pet_output[pet_output$other == "", "other"] = NA
```

### Arbitrary Output

The first step of our current code is to create a dataframe for our outputs. We still want to do that, but without us defining each possibility ourselves inside the function. Instead, we will provide a vector of possibilities, and have R iterate through those to make our columns. We can use a `for()` loop for that.

First, we'll create a vector of our possibilities, in this case our pets:

``` r
possible_columns = c("dog", "cat", "fish", "bird", "reptile", "rock", "none")
```

Next, we need code to iterate through those possibilities, and create a dataframe from them. We'll start with making what we know, a column for IDs which has as many rows as our intended input, `pet_vector` from above. Next, we will iterate through all possible options, and make a new column for each. Here I iterate through our `possible_columns` vector, and for each element (`option` in the loop) I create a column of `NA`s.

``` r
# make a base dataframe with rows for each of our cases.
pet_output = data.frame(
  "id" = 1:length(pet_vector)
  )

# iterate through all optinos and create a column with NAs for it
for(option in possible_columns){
  
  # make a new column with a character version of each possible option.
  pet_output[, as.character(option)] = NA
  
}
```

If we look at out output now, it is *exactly* the same as if we made each column ourselves, but now it is done by providing a vector of options. *And we can change those options to whatever we want*. This will come in handy later.

### Test for Each Option

Our next step, as before, is to test for each possible option and fill in the respective columns. We will use iteration here as well.

<div class="question">

Using the same principle as above, iterate over each option in `possible_columns` and use `grepl()` to test if the pet appeared in that case. Fill the respective columns. *Make sure that `pet_vector` and `possible_columns` are reset to normal before you try!*

</div>

<div class="answer">

The following code will iterate through `possible_columns` and replace the pattern `grepl()` is looking for with each option. It will test for that option, and save the results in the corresponding column.

    for(option in possible_columns){
      
      # fill dataframe iterativly.
      pet_output[ , option] = grepl(option, pet_vector, ignore.case = TRUE)
      
    }

</div>

### Remove the Known Options to Find "Other"

Once we have our "knowns" taken care of, we can work on the others. The process is nearly identical, just swap `grepl()` with `gsub()` and apply it to `pet_vector` like before.

<div class="question">

Iterate over each option in `possible_columns` and use `gsub()` to remove all of our known possibilities (and commas) from `pet_vector`. You can then use `trimsws()` to remove the extra spaces. Assign the remaining values to the "other" column of `pet_output`.

</div>

<div class="answer">

The following will remove all known possibilities, clean the remainder, and assign it to the 'other' column.

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
    pet_output[pet_output$other == '', 'other'] = NA

</div>

### Turn it Back into a Function

If we look at our code all together now, it looks like the following. If we run it, it will return the exact same thing as our old `pet_split()` function, but instead of each option being hand-coded by us, it knows how to work with any given vector of options and create our desired output.

``` r
# make dummy argument
pet_vector = survey$pets

# set all known options
possible_columns = c("dog", "cat", "fish", "bird", "reptile", "rock", "none")

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
pet_output[pet_output$other == '' & !is.na(pet_output$other), 'other'] = NA
```

If we turn it into a function, it will look like this:

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

pet_split(pet_vector = survey$pets,
          possible_columns = c("dog", "cat", "fish", "bird", "reptile", "rock", "none"))
```

       id   dog   cat  fish  bird reptile  rock  none        other
    1   1 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    2   2 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    3   3  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE Plants (two)
    4   4 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    5   5  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    6   6  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    7   7 FALSE  TRUE FALSE FALSE   FALSE  TRUE FALSE         <NA>
    8   8  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    9   9 FALSE FALSE FALSE FALSE   FALSE FALSE FALSE Spider Plant
    10 10 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE         <NA>
    11 11  TRUE FALSE FALSE FALSE    TRUE FALSE FALSE         <NA>
    12 12  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE         <NA>
    13 13 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE         <NA>
    14 14 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE         <NA>
    15 15 FALSE FALSE FALSE FALSE    TRUE FALSE FALSE        Plant

That's pretty cool, but what do you think would happen if we tried it on another column?

``` r
pet_split(pet_vector = survey$tea_days,
          possible_columns = c("monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"))
```

       id monday tuesday wednesday thursday friday saturday sunday other
    1   1  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE   TRUE  <NA>
    2   2  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    3   3  FALSE   FALSE      TRUE    FALSE  FALSE    FALSE  FALSE  <NA>
    4   4  FALSE   FALSE     FALSE    FALSE  FALSE     TRUE  FALSE  <NA>
    5   5  FALSE   FALSE     FALSE    FALSE   TRUE    FALSE   TRUE  <NA>
    6   6  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    7   7  FALSE   FALSE      TRUE    FALSE  FALSE    FALSE   TRUE  <NA>
    8   8  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    9   9  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    10 10  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    11 11  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    12 12  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    13 13  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    14 14  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>
    15 15  FALSE   FALSE     FALSE    FALSE  FALSE    FALSE  FALSE  <NA>

While it now has a bit of an odd name, our function can now work on *any* column! It is hard to express how big of a deal that is. We now have a single general tool that can adapt itself to several situations. The input is *arbitrary*, as long as it is formatted the same way (values separated by commas), we can put *anything* through this function and get a nice tidy dataframe back. A whole new universe of possibilities just opened.

<div class="question">

Try our function on some other columns in the `survey` dataframe!

</div>

  [Overview]: #overview
  [The Data]: #the-data
  [A Refresher on our `pet_split()` Function]: #a-refresher-on-our-pet_split-function
  [Break it Down]: #break-it-down
  [Arbitrary Output]: #arbitrary-output
  [Test for Each Option]: #test-for-each-option
  [Remove the Known Options to Find "Other"]: #remove-the-known-options-to-find-other
  [Turn it Back into a Function]: #turn-it-back-into-a-function
