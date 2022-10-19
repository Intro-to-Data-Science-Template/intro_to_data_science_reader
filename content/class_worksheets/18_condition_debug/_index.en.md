---
pre: <b>10/19. </b>
title: "Debugging and Conditions"
weight: 18
summary: "Tools to fix errors and test conditions."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [Our Toolbox][]
-   [Debugging Example][]
-   [Puzzle 1][]
-   [Puzzle 2][]

## Overview

Code will hardly ever work exactly as you want the first try. Especially early on, coding is an exercise in incremental improvements. Debugging, or identifying and removing "buggy" code that doesn't work as intended, is the skill that lets us identify what is wrong so we can make those improvements.

Today's worksheet is presented as a series of puzzles. Each puzzle will be a function that has something wrong with it. I will provide an input, and the desired output. Your task is to use the debugging tools we learned to figure out what is wrong with the function, and correct it. I will walk through an example first so you get the idea.

## Our Toolbox

We will be using two main tools for debugging, `debugonce()` and `browser()`. Each accomplishes the same thing is slightly different ways. These functions let you pause the execution of code mid-way inside a function, and see what is going inside our mini-R universes. This is very helpful, as opposed to just running code in your global environment, you can't normally run code inside a function line-by-line to see what is happening to the data at each step. `debugonce()` and `browser()` let you do that. This is also very helpful while building new functions.

`debugonce()` accepts a function name, and the next time you run a function, it will drop you into the mini-universe of that function for you to look around. You can tell it worked because your console will change slightly.

![][1]

The figure above shows what the browser window will look like. While in the browser, you can execute R code like normal, but there are a few differences.

1.  Instead of the regular `>` prompt in the R console, you will see `Browse[#]>` indicating you are in the *browser*. It still works mostly like the normal console, with a few extra commands.</br>
        a) You can press `Enter` or enter the letter `n` to go to the next line of code.</br>
        b) You can enter `c` to continue to the end of the function</br>
        c) You can enter `q` to quit and leave the browser
2.  The script pane is replaced with a function inspector walking you through the function you are debugging. You normally can't type in this window. The current line, what will be executed next time you press enter or `n` is highlighted.
3.  A few new buttons show up. These are the same as the commands described in \#1.

We can also use the `browser()` function to call the browser at a specific spot within a function. Simply add the `browser()` function anywhere inside a function you are writing and define the function again by executing it. Now, whenever you run that function, the browser will open wherever you added `browser()`. You will have to remove it from your function once you finish debugging.

## Debugging Example

Here is an example function that needs some debugging. This one is relatively short, and you may be able to figure out the problem without debugging. This will not always be the case, as functions will routinely extend for a dozen or several dozen lines with multiple other function inside of them creating nested mini-universes. The debugging process will always be the same though: figure out what function the problem is in, then go inside and follow the process step-by-step.

This function is meant to accept a numeric vector, and then output the mean, median, and mode. Instead, it results in the error shown below.

``` r
example_vector = c(1, 2, 6, 8, 4, 2, 8, 2, 7, 10, 33)

example_function = function(num_vec) {
  
  # get the mean
  vec_mean = mean(num_vec)
  
  # get the median
  vec_median = median(num_vec)
  
  # get the mode
  vec_mode = mode(num_vec)
  
  # create named vector for output
  output = c("mean" = vec_mean, "median" = vec_median, "mode" = vec_mode)
  
  # make sure all results are numeric
  if(!all(is.numeric(output))){stop("Not all values are numeric!")}
  
  # return results
  return(output)
}

example_function(example_vector)
```

    Error in example_function(example_vector): Not all values are numeric!

How would we go about fixing this? We only have one function, so we know where things must be going wrong. We'll use `debugonce()` to get a peak inside. Copy the above function code into your console and execute it to add the function to your environment. Run `example_function()` on `example_vector` to make sure you are getting the same output as we did here.

Once you have done that, run `debugonce(example_function)`, then run `example_function(example_vector)` again. You will be dropped into the browser, looking around inside `example_function()`. Step through the code execution one line at a time by pressing the Enter key. Watch the environment pane each step of the way and see if you can catch where the error will happen. Once you get in the spot in the function the error occurs, it will boot you out of the browser back to the global environment.

As you step through the function you should notice the at line `vec_mode = mode(num_vec)` produces an output of `"numeric"`, which would be causing our error in the next line, `if(!all(is.numeric(output))){stop("Not all values are numeric!")}`. That code asking, if all output is not (because `!`) numeric, then run `stop()`.

We could use `browser()` to check that section more quickly using the following:

``` r
example_vector = c(1, 2, 6, 8, 4, 2, 8, 2, 7, 10, 33)

example_function = function(num_vec) {
  
  # get the mean
  vec_mean = mean(num_vec)
  
  # get the median
  vec_median = median(num_vec)
  
  # -------------------------------------------------------------Browser will stop execution here.
  browser()
  
  # get the mode
  vec_mode = mode(num_vec)
  
  # create named vector for output
  output = c("mean" = vec_mean, "median" = vec_median, "mode" = vec_mode)
  
  # make sure all results are numeric
  if(!all(is.numeric(output))){stop("Not all values are numeric!")}
  
  # return results
  return(output)
}

example_function(example_vector)
```

If you re-define our `example_function()` using the code above then try to use it, it will always stop at the `browser()` function to let us look around. Try it out yourself!

## Puzzle 1

<div class="question">

The following function will intake a vector of character names, and output a dataframe with 6 columns. The function will have each character flip a coin. If they get a heads, they can flip again, up to a max of three. If a character flips heads three times, the `lucky` column should be set to `TRUE`. Run the following several times. Every so often, a character will appear where they did not flip heads all three times, but get a `TRUE` in the lucky column. Fix this error.

``` r
char_vec = c("Spike Spiegal", "Doreamon", "Sherlock Holmes", "Tiana", "Crush", "Thor", "Rhys", "Buffy", "Sasha Braus", "Catra", "Pikachu", "My Melody", "Claire Fraser", "Shinchan", "Kakashi")

puzzle_1 = function(characters) {
  
  # sort chars by alphabetical order
  sorted_char = sort(char_vec)
  
  # get the first letter of each name
  char_letters = substr(x = sorted_char, start = 1, stop = 1)
  
  # create a dataframe of character and their initial
  char_df = data.frame("char_name" = sorted_char, "char_initial" = char_letters)
  
  # randomly flip a count for each char
  char_df$toss_1 = sample(x = c("heads", "tails"),
                          size = nrow(char_df),
                          replace = TRUE)
  
  # for each that got heads, flip again, those with tails are out
  char_df$toss_2 = ifelse(char_df$toss_1 == "heads",
                          sample(x = c("heads", "tails"),
                                 size = nrow(char_df),
                                 replace = TRUE),
                          NA)
  
  # do it again
  char_df$toss_3 = ifelse(char_df$toss_1 == "heads",
                          sample(x = c("heads", "tails"),
                                 size = nrow(char_df),
                                 replace = TRUE),
                          NA)
  
  # add TRUE / FALSE for those with 3 heads
  ## set to TRUE if the 3rd toss is heads
  ## (as the other two had to be heads to toss a third time)
  char_df$lucky = ifelse(char_df$toss_3 == "heads", TRUE, FALSE)
  
  ## fill NAs with FALSE
  char_df[is.na(char_df$lucky), "lucky"] = FALSE
  
  # return results
  return(char_df)
}

puzzle_1(char_vec)
```

</div>

## Puzzle 2

<div class="question">

The following function will input our survey dataframe, and is meant to output the number of times people responded `TRUE` to a question. The correct output is 33, however it is currently outputting 110. Debug this function to fix the issue.

``` r
# load data
survey = read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/main/content/class_worksheets/4_r_rstudio/data/survey_data.csv")

puzzle_2 = function(survey_dataframe) {
  
  # pivot the survey data from wide to long
  survey_long = tidyr::pivot_longer(survey_dataframe, cols = -fav_char, values_transform = as.character)
  
  # get all the questions people answered TRUE
  all_true = survey_long[survey_long$value == TRUE, ]
  
  # count the number of rows (the number of questions with answers of TRUE)
  num_true = nrow(all_true)
  
  # return that number
  return(num_true)
}

puzzle_2(survey)
```

</div>

  [Overview]: #overview
  [Our Toolbox]: #our-toolbox
  [Debugging Example]: #debugging-example
  [Puzzle 1]: #puzzle-1
  [Puzzle 2]: #puzzle-2
  [1]: img/browser.png
