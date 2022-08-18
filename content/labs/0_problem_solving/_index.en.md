---
pre: <b>0. </b>
title: "Problem Solving"
author: "Lindsay Poirier"
weight: 1
summary: "This lab will introduce you to resources and techniques for problem solving in R. You should reference this lab often throughout the semester for reminders on best practices for addressing errors and getting help."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Introduction][]
    -   [Learning Goals][]
-   [Interpreting Error Messages][]
-   [Preparing to Get Help][]
-   [Referencing Resources][]
    -   [Help pages][]
    -   [Cheatsheets][]
-   [Searching the Web][]

{{% notice note %}}

This lab is a copy of SDS professor Dr. Lindsay Poirier's <a href="https://sds-192-intro-fall22.github.io/sds-192-public-website-quarto/problem-solving.html">problem solving lab</a>.

{{% /notice %}}

## Introduction

This lab will introduce you to resources and techniques for problem solving in `R`. You should reference this lab often throughout the semester for reminders on best practices for addressing errors and getting help.

### Learning Goals

-   Interpret error messages in `R`
-   Read `R` cheatsheets
-   Access `R` help pages
-   Reference Stack Overflow and other online resources for help

## Interpreting Error Messages

Throughout this week, we have taken a look at different error messages that `R` presents when it can't evaluate our code. Today, we will consider these in more detail. First, it's important to make some distinctions between the kinds of messages that `R` presents to us when attempting to run code:

Errors

:   Terminate a process that we are trying to run in R. They arise when it is not possible for `R` to continue evaluating a function.

Warnings

:   Don't terminate a process but are meant to warn us that there may be an issue with our code and its output. They arise when `R` recognizes potential problems with the code we've supplied.

Messages

:   Also don't terminate a process and don't necessarily indicate a problem but simply provide us with more potentially helpful information about the code we've supplied.

Check out the differences between an error and a warning in `R` by reviewing the output in the Console when you run the following code chunks.

#### Error in `R`

``` r
sum("3", "4")
```

    Error in sum("3", "4"): invalid 'type' (character) of argument

#### Warning in `R`

``` r
vector1 <- 1:5
vector2 <- 3:6
vector1 + vector2
```

    Warning in vector1 + vector2: longer object length is not a multiple of shorter
    object length

    [1]  4  6  8 10  8

So what should you do when you get an error message? How should you interpret it? Luckily, there are some clues and standardized components of the message the indicate why `R` can't execute the code. Consider the following error message that you received when running the code above:

Error in sum("3", "4") : invalid 'type' (character) of argument

There are three things we should pay attention to in this message:

1.  The word "Error" indicates that this code **did not** run.
2.  The text immediately after the word "in" tells us which specific function did not run.
3.  The text after the colon gives us clues as *why* the code did not run.

Reviewing the error above, I can guess that there was a problem with the argument that I supplied to the `sum()` function, and specifically that I supplied a function of the wrong type.

<div>

> **Exercise 1**
>
> Run the codes below and check out the error messages. Review the code to fix each of the errors. Note that each subsequent code chunk relies on the previous code chunk, so you will need to fix the errors in order and run the chunks in order.

</div>

``` r
# Create three vectors
a <- 1, 2, 3, 4, 5
b <- "a", "b", "c", "d", "e"
c <- TRUE, FALSE, TRUE, TRUE, FALSE
```

    Error: <text>:2:7: unexpected ','
    1: # Create three vectors
    2: a <- 1,
             ^

``` r
# Add the values in the vector a
a_added <- add(a)
```

    Error in add(a): could not find function "add"

``` r
# Multiply the previous output by 3
three_times_a_added <- added_a * 3
```

    Error in eval(expr, envir, enclos): object 'added_a' not found

``` r
# Create a dataframe with col1 and col2
df <- data.frame(
  col1 = c(1, 2, 3)
  col2 = c("a", "b", "c")
```

    Error: <text>:4:3: unexpected symbol
    3:   col1 = c(1, 2, 3)
    4:   col2
         ^

``` r
# Add a new column to df
df$col3 <- c(TRUE, FALSE)
```

    Error in df$col3 <- c(TRUE, FALSE): object of type 'closure' is not subsettable

## Preparing to Get Help

When we do get errors in our code and need to ask for help in interpreting them, it's important to provide collaborators with the information they need to help us. Sometimes when teaching `R` I will hear things like: "My code doesn't work!" or "I'm stuck and don't know what to do," and it can be challenging to suss out the root of the issue without more information. Here are some strategies for describing issues you are having with your code:

1.  Reference line numbers. Notice the left side of this document has a series of numbers listed vertically next to each line? These are known as line numbers. Oftentimes, if you are having an issue with your code and ask me to review it, I will say something like: "Check out line 53." By this I mean that you should scroll the document to the 53rd line. You can similarly tell me or your peers which line of your code you are struggling with.

2.  Compose good reproducible examples. A good reproducible example includes all of the lines of code that we need to reproduce an output on our own machines. This means that if you create a vector in a previous code snippet and then supply it as an argument in another code snippet, you are going to want to make sure that both of these lines of code appear in your reproducible example. Further, if the functions that you are using are from certain packages, you will want to make sure the `library()` call to load that package is in your reproducible example.

3.  Use the code and code block buttons in Slack to share example code. First, when we copy and paste code from RStudio into programs like Slack and email, we can't see the output. Second, certain characters like quotation marks and apostrophes are treated differently across these programs. For example, run the code chunk below and check out the output in your Console. The first line of code I typed directly into RStudio. The second I copied over from Slack.

``` r
# typed directly into RStudio
toupper("apple")
# copied from Slack
toupper(“apple”)
```

    Error: <text>:4:9: unexpected input
    3: # copied from Slack
    4: toupper(“
               ^

Notice the slight differences in the quotation marks? `R` recognizes the first but doesn't recognize the second, even though I used the same keyboard key to create both. This is due to the fact that these two systems use different character encodings.

The Code button (for a single line of code) and Code Block button (for multiple lines of code) in Slack are useful tools for composing code and avoiding character encoding issues. If you click these buttons when typing a Slack message, you can enter code in the red outlined box that appears, and this will easily copy to RStudio. I will ask you to always use these features when copying code this semester.

<div>

> **Tip**
>
> In Slack, you can also wrap text backticks (\` \`) to have it output in a single-line code block, and three backticks (\`\`\` \`\`\`) to have it output as a multi-line code block.

</div>

<div>

> **Exercise 2**
>
> Copy and paste one line of code from this lab **as a threaded comment** on the Slack message I posted on September 7, 2022. Be sure the text is formatted as code.

</div>

# Referencing Resources

As I've mentioned in class before, I don't expect you to come away from this class memorizing every function that we discuss and all of their parameters. There are a number of resources available to help you recall how certain functions work.

## Help pages

One resource we've already discussed are the `R` help pages. I tend to use the help pages when I know the function I need to use, but can't remember how to apply it or what its parameters are. Help pages typically include a description of the function, its arguments, details about the function, the values it produces, a list of related functions, and examples of its use. We can access the help pages for a function by typing the name of the function with a question mark in front of it into our Console (e.g. `?log` or `?sum`). Some help pages are well-written and include helpful examples, while others are spotty and don't include many examples.

<div>

> **Exercise 3**
>
> Access the help pages for the function `sort()`. Write code below to sort the vector `a` (which you created in an earlier step) in decreasing order.

</div>

``` r
# Write code here. 
```

## Cheatsheets

The `R` community has developed a series of cheatsheets that list the functions made available through a particular package and their arguments. I tend to use cheatsheets when I know what I need to do to a dataset in R, but I can't recall the function that enables me to do it.

<div>

> **Exercise 4**
>
> Navigate to [this cheatsheet][] for base `R`. Imagine we collected the temperature of our home each day for the past ten days (see code below). Let's say we wanted to find how each day ranked from coolest to hottest. For instance, I wanted to know the ranking for day 1 vs. day 2 vs. day 3, and so on. Using the cheatsheet, find the function that will allow you to generate a ranking of each day's temperature. Search the help pages for this function to determine how to randomly rank two days with the same temperature. Write a comment to yourself describing how this function is different than sorting the data.

</div>

``` r
#Create a vector of temperatures
temps_to_factor <- c(68, 70, 78, 75, 69, 80, 66, 66, 79)

# Write code below to rank the days with random ties


# Replace this line with a comment to yourself describing how this function is different than sorting the data. 
```

# Searching the Web

I encourage you to search the web when you get errors in your code. Others have likely experienced that error before and gotten help from communities of data analysts and programmers. However, you should **never copy and paste code directly from Stack Overflow**. This violates the course policies on Academic Honesty. Instead you should use these resources to take notes and learn how to improve and revise code. Any time you reference Stack Overflow or any other Web resource to help you figure out an answer to a problem, you should cite that resource in your code. Here is how you would cite that post in APA format:

> Username. (Year, Month Date). *Title of page (Question/Topic)*. Stack Overflow. URL

<div>

> **Exercise 5**
>
> Add a comment to the code chunk above, citing [this Stack Overflow][] post. Be sure to cite the post properly. You can read through the post to double check your answers.

</div>

  [Introduction]: #introduction
  [Learning Goals]: #learning-goals
  [Interpreting Error Messages]: #interpreting-error-messages
  [Preparing to Get Help]: #preparing-to-get-help
  [Referencing Resources]: #referencing-resources
  [Help pages]: #help-pages
  [Cheatsheets]: #cheatsheets
  [Searching the Web]: #searching-the-web
  [this cheatsheet]: https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf
  [this Stack Overflow]: https://stackoverflow.com/questions/54017285/difference-between-sort-rank-and-order
