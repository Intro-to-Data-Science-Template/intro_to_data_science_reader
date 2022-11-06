---
pre: <b>11/7. </b>
title: "Data Cleaning"
weight: 24
summary: "Deal with messy data."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [The Data][]
-   [The Mess][]
    -   [Make a First Initial and Last Name Column][]
    -   [Clean Email Column][]
    -   [Fuzzy Match][]

## Overview

Data sets are rarely as clean as the ones we have used in class thus far. More often than not, cleaning the data takes the most time of any parts of a project. For context, the data cleaning for my dissertation took 2.5 years, while the actual analysis and writing only took about 1 year. The same pattern hold for every project I have been involved in, regardless of the environment.

To make things particularly difficult, no two data cleaning tasks are the same. Each new dataset you try to work with will bring with it it's own unique challenges. However, as you progress in your data science journey, you will start to collect a few tricks each time that will make the next cleaning task a bit easier. I hope to introduce you to a few tricks today that I think come in handy most often.

Today, to practice our data cleaning, we'll be solving a real problem I had to deal with. I ran a civic data lab at my last institution, which held weekly meetings to gather and work on data projects for the public good. COVID forced the group to switch modes from in-person to video call. When I wanted to create a comprehensive attendance sheet, I found that for the in-person meetings I had names, while for the online meetings I only had emails. I needed to figure out a way to merge these data sets. We'll be attempting a toy example of that for this worksheet.

## The Data

Load in the following two dataframe, both representing an attendance sheet from my civic data lab. `name_attend` is the in-person meetings with names, while `email_attend` is the online meetings with emails.

``` r
name_attend = read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/main/content/class_worksheets/26_data_cleaning/data/name_df.csv")

email_attend = read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/main/content/class_worksheets/26_data_cleaning/data/email_df.csv")
```

<div class="question">

Look over each of the dataframes. What are some of the difficulties in merging them?

</div>

## The Mess

We need to figure out a way to standardize our names and emails so that we can match them and get a full attendance count. I'm going to have us approach the problem as follows:

1.  Make a new column that always has initials and last name
2.  Make a new column for the email users without the smith domain
3.  Use approximate (fuzzy) matching to match the initial-names with the cleaned emails

### Make a First Initial and Last Name Column

For this problem, we're going to use some regex. Specifically, we'll make a regex to get the first letter of a first name, and all of a last name. I'll provide you with the formula, as learning regex is a *whole thing*, but I want you to know what it can do.

Below, I use `str_match_all()` to look through `name_attend$name` and find all the things that match the regex formula I provided for the `pattern` argument. This formula asks for the following:

-   Find one character that is a lower or uppercase letter (`([a-zA-Z]){1}`)
-   Skip anything else until you find a space (`.*`)
-   Find anything after the space (`(.+)`)
-   Give me back everything inside parentheses (so things 1 and 3 here)

[You can play around with the regex here if you would like to test changes.][] If you would like to put in the time to learn more about regex, [this tutorial is a great resource][], but that is beyond the scope of this class.

``` r
library(stringr)

name_matrix = str_match_all(name_attend$name, pattern = "([a-zA-Z]){1}.* (.+)")
```

`str_match_all()` returns a list with a length matching the number of names in `name_attend$name`. Each element of this list is a matrix (not a vector!) where the first column of the row is the full name from `name_attend$name`, the second is the fist parentheses from our regex formula (`([a-zA-Z]){1}`) which was a first initial, and the third is the second set of parenthesis from our regex formula (`(.+)`) which was the last name.

<div class="question">

You don't need to understand the regex for now, but do make sure you understand the output in `name_matrix` and how we can use it going forward.

</div>

Now that I have initials and last names, I can create a clean column combining the two using `sapply()`.

``` r
name_attend$init_last = sapply(name_matrix, FUN = function(name){
  
  # paste together the first initial and last name
  name_smoosh = paste0(name[1, 2], name[1, 3])
  
  # set it all to lower case
  name_smoosh = tolower(name_smoosh)
  
  # return
  return(name_smoosh)
  
})
```

If we look at our `name_attend` now at the `init_last` column, we can see the results. Step one complete.

### Clean Email Column

Our next step is cleaning up our email addresses a little. Specifically, we can remove the "@smith.edu" from all of them.

<div class="question">

Use `gsub()` or something similar to remove the smith domain from all of our email addresses in `email_attend`. Assign the cleaned addresses to a new column called `clean_email`.

</div>

### Fuzzy Match

Now with our `name_attend$init_last` and `email_attend$clean_email` columns, we have two things which could match fairly closely. Here we'll use some fuzzy matching by string distance to combine our dataframes. I'll provide the code to do so below, your task will be explaining how it works. Copy it into your R instance and try to figure it out.

``` r
library(stringdist)

match_matrix = stringdistmatrix(name_attend$init_last, email_attend$clean_email, method = "cosine")

best_match = vector("numeric", length = nrow(match_matrix))
for(i in 1:nrow(match_matrix)){
  
  best_match[i] = which(match_matrix[i,] == min(match_matrix[i,]))
  
}

name_attend$best_match = best_match
email_attend$best_match = 1:nrow(email_attend)
```

``` r
library(dplyr)

total_attendance = left_join(name_attend, email_attend, by = "best_match")
```

Sweeeeeeeeeeeet.

<div class="question">

Explain how the above code works to find the best fuzzy matches.

</div>

  [Overview]: #overview
  [The Data]: #the-data
  [The Mess]: #the-mess
  [Make a First Initial and Last Name Column]: #make-a-first-initial-and-last-name-column
  [Clean Email Column]: #clean-email-column
  [Fuzzy Match]: #fuzzy-match
  [You can play around with the regex here if you would like to test changes.]: https://regex101.com/r/Z44FT9/1
  [this tutorial is a great resource]: https://regexlearn.com/learn/regex101
