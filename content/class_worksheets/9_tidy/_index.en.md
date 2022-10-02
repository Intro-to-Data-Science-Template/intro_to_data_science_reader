---
pre: <b>9/26. </b>
title: "Tidy Data Worksheet"
weight: 9
summary: "An intro to tidy data and pivoting."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [Problem Sets][]
    -   [1. What is "Tidy" Data][]
    -   [2. Re-Coding Data Types][]
    -   [3. Re-Coding Specific Data][]
    -   [4. Pivoting Data][]

## Overview

Making data tidy and keeping data tidy is one of the key responsibilities of any data scientist. All of our analyses, and by extension our ability to learn from data, is contingent on the predictable format of each cell of our dataframes containing the one piece of information we want to look at. Data is rarely in the format to start with, and it often takes a significant amount of time to get it that way. The process of getting data into a tidy format is often called *data cleaning*, *data wrangling*, or *data munging*.

Today we will learn a few early data cleaning skills, which we will add to for the rest of the semester. We will start with *re-coding* data, or changing how data is represented. We will then move on to changing the shape of data through *pivoting*.

## Problem Sets

### 1. What is "Tidy" Data

> Tidy datasets provide a standardized way to link the structure of a dataset (its physical layout) with its semantics (its meaning).

*Wickham, H. (2014). Tidy Data. Journal of Statistical Software, 59, 1--23. https://doi.org/10.18637/jss.v059.i10*

All "tidy" data follows a predictable format. This format allows for pre-built code to work on this data in a predictable way, making the data science workflow significantly easier and less prone to errors. A "tidy" dataset adheres to the following format: all observations are rows, all variables are columns, and each cell is one value representing that intersection.

![From [R for Data Science][]][1]

<div class="question">

If seen in a cell from a dataframe, are the following examples of "tidy" data? Respond with TRUE or FALSE, and if FALSE explain why.

1.  42
2.  "3 cats"
3.  "Orange"
4.  "1993-2010"
5.  "NAME: Samantha Carter"

</div>

<div class="answer">

1.  TRUE
2.  FALSE. It is mixing two distinct pieces of information: how many things there were and what those things were.
3.  TRUE
4.  FALSE. It contains two pieces of data, a start year and an end year. If this was the difference between those two years, it would be tidy.
5.  FALSE. It contains a definition of the data, and the data itself. If we want this data to be about names, it should be in a NAME column.

</div>

### 2. Re-Coding Data Types

When we re-code data, we don't actually change the data; for example, we may re-code a variable that is initially `0` and `1` to `TRUE` and `FALSE`. Both of these represent the same thing, but R is better able to work on this `logical` data type if it is actually a `logical` in R, rather than a `numeric` representation.

We also often see the same problem arise with `character` data. Given `character` is the most permissive data type in R -- meaning it can store nearly anything -- sometimes R will use it to be safe, even if the data is not meant to be a `character`. Take the following vector as an example:

    [1] "1" "5" "8" "3" "1" "5"

It looks like a series of numbers, so it must be `numeric`, right? Unfortunately not. We can tell from the quotes around the numbers that R is actually treating this vector of numbers as a `character` vector. This will cause problems if we try to do any analysis with this vector, like say getting the mean:

``` r
mean(char_nums)
```

    Warning in mean.default(char_nums): argument is not numeric or logical:
    returning NA

    [1] NA

We get an error saying the *argument* to our `mean()` function is not numeric or logical, even though we can clearly tell the vector is all numbers! This is another case where re-coding comes in. We want to make sure R is understanding the data the same way we are. To change how this data is represented in R, we can *coerce* the class of the data to something else using the `as.XXXX()` family of functions.

There is an `as.XXXX()` function for every data type:

-   `as.character()`
-   `as.factor()`
-   `as.numeric()`
-   `as.logical()`

<div class="question">

Try re-coding the following two vectors using each of the `as.XXXX()` functions above. Can you understand each of the results? Some will fail!

-   `test_vec_1 <- c("1", "5", "45", "22", "99", "45")`
-   `test_vec_2 <- c(TRUE, FALSE, TRUE, TRUE, FALSE)`

</div>

<div class="answer">

-   tect_vec_1
    -   `as.character()` - Nothing happens. It's already a character.
    -   `as.factor()` - Turns the characters into a factor
    -   `as.numeric()` - Turns our numbers into a proper numeric vector
    -   `as.logical()` - R dosn't know how to turn these characters into logical
-   test_vec_2
    -   `as.character()` - Changes our `TRUE`s and `FALSE`s into the WORD 'TRUE' and 'FALSE'
    -   `as.factor()` - Turns the logicals into a factor, they no longer mean `TRUE` and `FALSE`, just categories with those names
    -   `as.numeric()` - `TRUE` and `FALSE` are often coded as 1 and 0, so R knows how to make that change
    -   `as.logical()` - Nothing happens.

</div>

### 3. Re-Coding Specific Data

We can flex our sub-setting muscles and use them to recode specific variables. Re-coding in this way is really just replacing the values, so you need to be very careful when doing so. The key insight here is that whenever you sub-set data, you can opt to modify that data as well.

Run the following code to load in our survey data to practice on:

``` r
survey <- read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/main/content/class_worksheets/4_r_rstudio/data/survey_data.csv")
```

Let's start with changing a single value. You won't actually do this often, but it's good to know. We can replace single cell by giving R the row and column of the specific value we want. For example, go look at the `survey` dataframe, and scroll through the `fav_art` column. There are some `NA`s in there. If we wanted to change one of those `NA`s because we later learned an individual had no favorite art, we could use our sub-setting to do that. Try the following:

``` r
survey[2, 13]
```

    [1] NA

``` r
survey[2, 13] = "None"
```

Now go look at our `survey` dataframe again. We can see that we replaced the value in the 2nd row, and the 13th column, or the `fav_art` of the person whose favorite character is "Doreamon". We can use any of our sub-setting tricks in the same way, such as calling columns by name. For example: `survey[2, 13] = "None"` and `survey[2, "fav_art"] = "None"` will do the exact same thing.

For a more practical example, let's look at our `nerd` column. This question asked if people identified with the label "nerd" to describe themselves. Right now it is a `logical` vector of `TRUE`s and `FALSE`s. Say we wanted to change that to "Yes" and "No" for the sake of presentation. We can use our sub-setting knowledge to do so:

``` r
survey[survey$nerd == TRUE, "nerd"] <- "Yes"
survey[survey$nerd == FALSE, "nerd"] <- "No"
```

Check out our `nerd` column now. The above code asked R to: Give me the `survey` dataframe, such that the rows are when `nerd` was `TRUE`, and the column was `nerd`, and assign all of those values to "Yes."

On the other hand, the next command asked R to: Give me the `survey` dataframe, such that the rows are when `nerd` was `FALSE`, and the column was `nerd`, and assign all of those values to "No."

Now, this is somewhat dangerous because we are replacing our data using this method. let's try a less destructive technique on another column. We can accomplish much the same thing using the `ifelse()` function. `ifelse()` takes three main arguments: a test of some kind, what to do if that test is `TRUE`, and what to do if that test is `FALSE`. For example, run the following lines:

First, we looked at the data, and what it actually is.

``` r
survey$fict
```

     [1] "Fiction"     "Fiction"     "Non-fiction" "Non-fiction" "Fiction"    
     [6] "Fiction"     "Fiction"     "Fiction"     "Fiction"     "Fiction"    
    [11] "Fiction"     "Fiction"     "Fiction"     "Fiction"     "Fiction"    

Next, we test if that data matched a certain *condition* using our `==` comparison, meaning "equal to".

``` r
survey$fict == "Fiction"
```

     [1]  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    [13]  TRUE  TRUE  TRUE

Last, we use `ifelse()` to use that test to give us outputs conditional on if the results was `TRUE` or `FALSE`.

``` r
ifelse(survey$fict == "Fiction", "I like fiction more", "I like non-fiction more")
```

     [1] "I like fiction more"     "I like fiction more"    
     [3] "I like non-fiction more" "I like non-fiction more"
     [5] "I like fiction more"     "I like fiction more"    
     [7] "I like fiction more"     "I like fiction more"    
     [9] "I like fiction more"     "I like fiction more"    
    [11] "I like fiction more"     "I like fiction more"    
    [13] "I like fiction more"     "I like fiction more"    
    [15] "I like fiction more"    

We can take that result and add it to our dataframe like so:

``` r
survey$fict_phrase = ifelse(survey$fict == "Fiction", "I like fiction more", "I like non-fiction more")
```

Now we've re-coded some data, but still have our original!

<div class="question">

Create a new column in our `survey` dataframe called `hotdog_text`, re-coding the `hotdog` column to: "I think a hot dog is a sandwich" for `TRUE` and "I do not think a hot dog is a sandwich" for `FALSE`.

</div>

<div class="answer">

survey$hotdog_text = ifelse(survey$fict == TRUE, 'I think a hot dog is a sandwich', 'I do not think a hot dog is a sandwich')

</div>

### 4. Pivoting Data

Pivoting data takes some time to wrap your head around. The following graphic is very helpful in that process:

![[Data Science Workshops][]][2]

Here we see two representations of the same data. The "wide" data is what we have been working with so far. Each row is a case or observation, and every column is a variable for that case. We can see cases 1, 2, and 3 in the figure, with variables A1, A2, and A3.

The "Long" format changes this slightly. Instead of having a column for each variable, there are instead two columns which represent all possible variables, a "key" column, and a "value" column. Each of our previous column names are now stored in the "Key" column, and the value from their cells is stored in the "Val." column. It's best to look at an example ourselves. Run the following:

``` r
library(tidyr)

survey_long <- survey |> pivot_longer(cols = -fav_char, values_transform = as.character)
survey_wide <- survey_long |> pivot_wider()
```

We now have two versions of our `survey` dataframe; one "long" and one "wide." Open up the "wide" dataframe. It should look just like our normal `survey` dataframe. Now open the "long" version, and look through the "name" column. You should recognize all of our former variable columns, the values of the related cells stored in the new "value" column, and `fav_char` being repeated multiple times for each column.

The code we used to do this comes from the `tidyr` package, part of the tidyverse family of packages. Because of this, it behaves a little differently from all other R code. Namely, we use a pipe `|>` to "pass" the data to the `pivot_X()` function, rather than include it as an argument inside the function itself. We also use a format for our arguments that no other functions use, the "-fav_char" argument. In tidy language, we are saying we want all the columns except our `fav_chars` to be turned from wide to long; `fav_chars` will be used as our ID to identify cases. While handy, I need to stress that *this syntax will not work with other kinds of functions, only tidyverse family functions*.

Why would we ever want to pivot our data like this? Sometimes it is helpful for certain visualizations and analyses, but it is also more efficient from a computer's perspective. In this format, if we had information for a variable, but we did not have that information for everyone, instead of including a whole column with a lot of `NA`s, we could simply omit that information from this table and nothing would really change.

  [Overview]: #overview
  [Problem Sets]: #problem-sets
  [1. What is "Tidy" Data]: #what-is-tidy-data
  [2. Re-Coding Data Types]: #re-coding-data-types
  [3. Re-Coding Specific Data]: #re-coding-specific-data
  [4. Pivoting Data]: #pivoting-data
  [R for Data Science]: https://r4ds.had.co.nz/tidy-data.html
  [1]: ./img/tidy-1.png
  [Data Science Workshops]: https://iqss.github.io/dss-workshops/RDataWrangling.html
  [2]: img/wide_vs_long.png
