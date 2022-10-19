---
pre: <b>10/17. </b>
title: "Functions"
weight: 17
summary: "Create your own tools in R!"
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [The Data][]
-   [Functions Under the Hood][]
-   [Solving a Problem][]
-   [Make it General][]
-   [Try it Yourself][]

## Overview

Functions are the backbone of how R *does* things; we have refereed to them previously as "verbs" in the language of R. We have used several functions so far, either from base R, or from packages we have loaded in using `library()`. However, those are not all the functions available to us. The true power in R comes from our ability to *make our own functions to do anything we want*. That's what we'll be practicing today.

## The Data

We are going to be using class survey data for lab today. Please load it in using the following:

``` r
survey = read.csv("https://raw.githubusercontent.com/Intro-to-Data-Science-Template/intro_to_data_science_reader/main/content/class_worksheets/4_r_rstudio/data/survey_data.csv")
```

## Functions Under the Hood

We can peek behind the curtain on any of the functions we have used so far an see how they tick. All you have to do is enter the function into the console, and remove the `()` where the arguments go. Let's look at our friend `table()` by typing `table` into the console and hitting enter. You should see the following:

``` r
function (..., exclude = if (useNA == "no") c(NA, NaN), useNA = c("no", 
    "ifany", "always"), dnn = list.names(...), deparse.level = 1) 
{
    list.names <- function(...) {
        l <- as.list(substitute(list(...)))[-1L]
        if (length(l) == 1L && is.list(..1) && !is.null(nm <- names(..1))) 
            return(nm)
        nm <- names(l)
        fixup <- if (is.null(nm)) 
            seq_along(l)
        else nm == ""
        dep <- vapply(l[fixup], function(x) switch(deparse.level + 
            1, "", if (is.symbol(x)) as.character(x) else "", 
            deparse(x, nlines = 1)[1L]), "")
        if (is.null(nm)) 
            dep
        else {
            nm[fixup] <- dep
            nm
        }
    }
    miss.use <- missing(useNA)
    miss.exc <- missing(exclude)
    useNA <- if (miss.use && !miss.exc && !match(NA, exclude, 
        nomatch = 0L)) 
        "ifany"
    else match.arg(useNA)
    doNA <- useNA != "no"
    if (!miss.use && !miss.exc && doNA && match(NA, exclude, 
        nomatch = 0L)) 
        warning("'exclude' containing NA and 'useNA' != \"no\"' are a bit contradicting")
    args <- list(...)
    if (length(args) == 1L && is.list(args[[1L]])) {
        args <- args[[1L]]
        if (length(dnn) != length(args)) 
            dnn <- paste(dnn[1L], seq_along(args), sep = ".")
    }
    if (!length(args)) 
        stop("nothing to tabulate")
    bin <- 0L
    lens <- NULL
    dims <- integer()
    pd <- 1L
    dn <- NULL
    for (a in args) {
        if (is.null(lens)) 
            lens <- length(a)
        else if (length(a) != lens) 
            stop("all arguments must have the same length")
        fact.a <- is.factor(a)
        if (doNA) 
            aNA <- anyNA(a)
        if (!fact.a) {
            a0 <- a
            op <- options(warn = 2)
            a <- factor(a, exclude = exclude)
            options(op)
        }
        add.na <- doNA
        if (add.na) {
            ifany <- (useNA == "ifany")
            anNAc <- anyNA(a)
            add.na <- if (!ifany || anNAc) {
                ll <- levels(a)
                if (add.ll <- !anyNA(ll)) {
                  ll <- c(ll, NA)
                  TRUE
                }
                else if (!ifany && !anNAc) 
                  FALSE
                else TRUE
            }
            else FALSE
        }
        if (add.na) 
            a <- factor(a, levels = ll, exclude = NULL)
        else ll <- levels(a)
        a <- as.integer(a)
        if (fact.a && !miss.exc) {
            ll <- ll[keep <- which(match(ll, exclude, nomatch = 0L) == 
                0L)]
            a <- match(a, keep)
        }
        else if (!fact.a && add.na) {
            if (ifany && !aNA && add.ll) {
                ll <- ll[!is.na(ll)]
                is.na(a) <- match(a0, c(exclude, NA), nomatch = 0L) > 
                  0L
            }
            else {
                is.na(a) <- match(a0, exclude, nomatch = 0L) > 
                  0L
            }
        }
        nl <- length(ll)
        dims <- c(dims, nl)
        if (prod(dims) > .Machine$integer.max) 
            stop("attempt to make a table with >= 2^31 elements")
        dn <- c(dn, list(ll))
        bin <- bin + pd * (a - 1L)
        pd <- pd * nl
    }
    names(dn) <- dnn
    bin <- bin[!is.na(bin)]
    if (length(bin)) 
        bin <- bin + 1L
    y <- array(tabulate(bin, pd), dims, dimnames = dn)
    class(y) <- "table"
    y
}
```

That's pretty complex looking; and it is. However, the point is that *this is the same code that runs when we call `table`*. We could, it we wanted, type this out ourselves and create our own `table` function using the... `function()` function, like we see at the top the the previous code.

<div class="question">

Copy the code from the `table()` function, and assign it to a new function called `my_table()`. Run both of them on the `mint_choc` column from our survey data. Does the output make sense?

</div>

<div class="answer">

my_table = table

table(survey$mint_choc) my_table(survey$mint_choc)

</div>

Not all functions are as transparent. Try looking at the code behind the `sum()` function and you may be disappointed. The most basic functions in R are "primitives," and are actually calling a lower level programming language than we can access through R. Looking at `sum` we see:

``` r
function (..., na.rm = FALSE)  .Primitive("sum")
```

You may also be surprised to learn that pretty much everything in R is a function, though often a primitive one. For example, we can look at the `+` sign as a function by warping it in ticks like so:

``` r
`+`
```

    function (e1, e2)  .Primitive("+")

Neat.

## Solving a Problem

It's cool that we can make a copy of table, but why would we? We wouldn't really. What we would do is create our own functions. While there a *ton* of packages out there to do all sorts of things, sometimes you will just need to make something yourself. This is often the case when working with your own unique data sets.

Let's take a look at our survey data, specifically the `pets` column. As you can see below, we have some issues that violate our tidy data principles. Specifically, in our one column of pets, we have values on multiple types of pets. Ideally, we would like a column for each type of pet, and then a `TRUE` or `FALSE` for if people had that kind of pet.

``` r
survey$pets
```

     [1] "None"              "None"              "Dog, Plants (two)"
     [4] "None"              "Dog"               "Dog"              
     [7] "Cat, Rock"         "Dog"               "Spider Plant"     
    [10] "Cat"               "Dog, Reptile"      "Dog"              
    [13] "Cat"               "None"              "Reptile, Plant"   

Here's where a custom function can help us. We know that each of the entries in `pets` is separated by a comma, and we can exploit that structure. We're going to write a function that will split those values for us by commas, and create a new pets dataframe that we can then attach to our current `survey` dataframe.

The first step of creating a good function is clearly defining the key components: the **input**, **output**, and **arguments**. In our case, the input will be our pets column, the output will be a dataframe with one column per pet type, and a value of `TRUE` or `FALSE` depending on if the case had that pet. We won't need any arguments aside from the input for now.

When I am creating a function, I typically write the code to do what I want first, and then convert it into a function. Let's write some code to create our output dataframe, and then we can work to fill it. I want to stress that this is *one* way to go about solving this problem. There are plenty of other valid (and easier, once we learn some more skills) options.

First, we'll create a new dataframe with a column for each of our possible pets, and a row for all 15 of our cases. I'll fill the dataframe with `NA`s for now.

``` r
pet_output = data.frame(
  "id" = 1:15,
  "dog" = NA,
  "cat" = NA,
  "fish" = NA,
  "bird" = NA,
  "reptile" = NA,
  "rock" = NA,
  "none" = NA,
  "other" = NA)
```

Now, we need to figure out a way to test if the person listed one of our options in their response. We'll use a new function called `grepl()` to test this. The name "grepl" is a product of very old programmer speak, but practically it will search through a character vector and give us a `TRUE` or `FALSE` if it finds a match for the pattern we give it. Thus, we can run the following on our `pets` column for each of our possible pets to test if they are included. We're going to tell it to ignore case, so that capital and lower case letters don't matter.

<div class="question">

Run the following code and explain it's output.

``` r
grepl(pattern = "dog", x = survey$pets, ignore.case = TRUE)
```

</div>

<div class="answer">

It says `TRUE` if the value included 'dog' and `FALSE` if it did not.

</div>

We can use the same function to test for each of our possible pets, and assign the results to our new dataframe.

``` r
pet_output$dog = grepl(pattern = "dog", x = survey$pets, ignore.case = TRUE)
pet_output$cat = grepl(pattern = "cat", x = survey$pets, ignore.case = TRUE)
pet_output$fish = grepl(pattern = "fish", x = survey$pets, ignore.case = TRUE)
pet_output$bird = grepl(pattern = "bird", x = survey$pets, ignore.case = TRUE)
pet_output$reptile = grepl(pattern = "reptile", x = survey$pets, ignore.case = TRUE)
pet_output$rock = grepl(pattern = "rock", x = survey$pets, ignore.case = TRUE)
pet_output$none = grepl(pattern = "none", x = survey$pets, ignore.case = TRUE)

pet_output
```

       id   dog   cat  fish  bird reptile  rock  none other
    1   1 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    2   2 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    3   3  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    4   4 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    5   5  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    6   6  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    7   7 FALSE  TRUE FALSE FALSE   FALSE  TRUE FALSE    NA
    8   8  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    9   9 FALSE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    10 10 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE    NA
    11 11  TRUE FALSE FALSE FALSE    TRUE FALSE FALSE    NA
    12 12  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    13 13 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE    NA
    14 14 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    15 15 FALSE FALSE FALSE FALSE    TRUE FALSE FALSE    NA

Now, that works for everything except "other."

<div class="question">

Why would we need a different strategy for the "other" cases?

</div>

<div class="answer">

We don't know what will be in 'other' so we can't test explicitly for it.

</div>

To resolve our "other" issue, we will need to take another approach. First, we'll make a copy of our `pets` column we can work with, and make sure we don't alter our original data.

``` r
work_pets = survey$pets
```

Next, we will look through that copy, and remove everything that fits into one of our other categories using `gsub()`, or "general substitution." `gsub()` is similar to `grepl()` in that it asks for a pattern to look for and where to look for it, but also asks what to substitute for that pattern. Let's look at the following example. Here I ask `gsub()` to look in our `work_pets` vector, find all the times "dog" appears, and to replace it with "", or nothing.

``` r
gsub(pattern = "dog", work_pets, replacement = "", ignore.case = TRUE)
```

     [1] "None"           "None"           ", Plants (two)" "None"          
     [5] ""               ""               "Cat, Rock"      ""              
     [9] "Spider Plant"   "Cat"            ", Reptile"      ""              
    [13] "Cat"            "None"           "Reptile, Plant"

We can see in the output that now all the instances of "dog" have been removed. We will repeat this process for each of our known categories, each time saving our results back to `work_pets`. We will also remove commas, and use `trimws()`, or "trim white space," to delete extra spaces from the start and end of our characters.

``` r
work_pets = gsub(pattern = "dog", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "cat", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "fish", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "bird", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "reptile", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "rock", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "none", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = ",", work_pets, replacement = "", ignore.case = TRUE)
work_pets = trimws(work_pets)

work_pets
```

     [1] ""             ""             "Plants (two)" ""             ""            
     [6] ""             ""             ""             "Spider Plant" ""            
    [11] ""             ""             ""             ""             "Plant"       

If we look at `work_pets` now, all that is left are things not in our pets categories. We can now either turn this into a logical, or assign these values to our new `other` column in `pet_output`. I'll do the latter. I'll also convert our blanks into proper `NA`s.

``` r
pet_output$other = work_pets
pet_output[pet_output$other == "", "other"] = NA

pet_output
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

If we look at out `pet_output` dataframe now, we can see we have a column for each pet type, a `TRUE` or `FALSE` for each known pet, and the text for other pets. All in all, the code to do this looks like:

``` r
# create an empty dataframe for our intended output
pet_output = data.frame(
  "id" = 1:15,
  "dog" = NA,
  "cat" = NA,
  "fish" = NA,
  "bird" = NA,
  "reptile" = NA,
  "rock" = NA,
  "none" = NA,
  "other" = NA)

# get a binary for each known pet type
pet_output$dog = grepl(pattern = "dog", x = survey$pets, ignore.case = TRUE)
pet_output$cat = grepl(pattern = "cat", x = survey$pets, ignore.case = TRUE)
pet_output$fish = grepl(pattern = "fish", x = survey$pets, ignore.case = TRUE)
pet_output$bird = grepl(pattern = "bird", x = survey$pets, ignore.case = TRUE)
pet_output$reptile = grepl(pattern = "reptile", x = survey$pets, ignore.case = TRUE)
pet_output$rock = grepl(pattern = "rock", x = survey$pets, ignore.case = TRUE)
pet_output$none = grepl(pattern = "none", x = survey$pets, ignore.case = TRUE)

# make a copy of the pets vector to work on
work_pets = survey$pets

# remove all known pets and clean remaining text
work_pets = gsub(pattern = "dog", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "cat", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "fish", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "bird", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "reptile", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "rock", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = "none", work_pets, replacement = "", ignore.case = TRUE)
work_pets = gsub(pattern = ",", work_pets, replacement = "", ignore.case = TRUE)
work_pets = trimws(work_pets)

# Fill in "other"
pet_output$other = work_pets
# Turn blanks into NAs
pet_output[pet_output$other == "", "other"] = NA
```

## Make it General

Now that we know what to do, let's get to work converting this into a function. The key advantage of doing so is that we can make out code more *generalizable*. Rather than hard-coding each element, we can instead use variables for stand-ins that can be swapped later on. For example, instead of performing all of these checks on `survey$pets`, we can write the function to look at any `pets` vector we pass as an argument. This means we can re-use the function later!

To start this process, let's write a skeleton for our function. Below I've included a skeleton for a new function I am calling `pet_split`. In this function, I have an argument called `pet_vector`. Now, whenever I use `pet_vector` inside the body of the function, I will be telling R to use whatever is given to the function in the `pet_vector` argument. `pet_vector` is just like an ordinary object in your R environment, **except it only exists within the function**. You can think about it like R opening a little mini-R, running all the code in the function top to bottom, giving you the result, then closing it and deleting everything else inside.

{{% notice info %}}
I'll say it again because it is so important to understand.</br></br>
You can think about functions as if they were opening a little mini-R universe, running all the code in the function top to bottom with the arguments you provided as objects, giving you the result, then destroying that universe and deleting everything else inside.
{{% /notice %}}

``` r
pet_split = function(pet_vector) {
  
}
```

Now let's add some substance to this function. I'll start by adding in the code to create a dataframe for our output, and a `return()` at the end. Whatever I put inside `return()` will be the result of the function when it is run, and everything else will be deleted when the mini-R inside the function is closed. I also changed the code of our "id" column a bit. Instead of hard-coding 15 IDs, I made it more generalizable by asking R to make IDs 1 through the number of elements, or the length, of our `pet_vector` argument. That means the dataframe will always have the same number of rows as the `pet_vector` input, no matter how many elements it has.

{{% notice info %}}
The only thing that will come out of your function is whatever you put in the `return()` function. Messages (like `print()`) are exceptions.
{{% /notice %}}

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
  
  # return
  return(pet_output)
}

pet_split(pet_vector = survey$pets)
```

       id dog cat fish bird reptile rock none other
    1   1  NA  NA   NA   NA      NA   NA   NA    NA
    2   2  NA  NA   NA   NA      NA   NA   NA    NA
    3   3  NA  NA   NA   NA      NA   NA   NA    NA
    4   4  NA  NA   NA   NA      NA   NA   NA    NA
    5   5  NA  NA   NA   NA      NA   NA   NA    NA
    6   6  NA  NA   NA   NA      NA   NA   NA    NA
    7   7  NA  NA   NA   NA      NA   NA   NA    NA
    8   8  NA  NA   NA   NA      NA   NA   NA    NA
    9   9  NA  NA   NA   NA      NA   NA   NA    NA
    10 10  NA  NA   NA   NA      NA   NA   NA    NA
    11 11  NA  NA   NA   NA      NA   NA   NA    NA
    12 12  NA  NA   NA   NA      NA   NA   NA    NA
    13 13  NA  NA   NA   NA      NA   NA   NA    NA
    14 14  NA  NA   NA   NA      NA   NA   NA    NA
    15 15  NA  NA   NA   NA      NA   NA   NA    NA

Next, let's get this function to output something we actually want. I'll copy more of our code from above into the function. You'll notice that I replace any calls for `survey$pets` with our generic argument `pet_vector`. If we run this version, we start to see our desired output!

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
  
  # return
  return(pet_output)
}

pet_split(pet_vector = survey$pets)
```

       id   dog   cat  fish  bird reptile  rock  none other
    1   1 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    2   2 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    3   3  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    4   4 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    5   5  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    6   6  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    7   7 FALSE  TRUE FALSE FALSE   FALSE  TRUE FALSE    NA
    8   8  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    9   9 FALSE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    10 10 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE    NA
    11 11  TRUE FALSE FALSE FALSE    TRUE FALSE FALSE    NA
    12 12  TRUE FALSE FALSE FALSE   FALSE FALSE FALSE    NA
    13 13 FALSE  TRUE FALSE FALSE   FALSE FALSE FALSE    NA
    14 14 FALSE FALSE FALSE FALSE   FALSE FALSE  TRUE    NA
    15 15 FALSE FALSE FALSE FALSE    TRUE FALSE FALSE    NA

To finish it up, let's copy the rest of our code into this function. You'll notice that I don't need to make a new vector `work_pets` as before. That's because I'm working on the `pet_vector` object directly.

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

Our new `pet_split` function works! It will create a new dataframe we can combine with our `survey` data to get tidy data about pets. Now we could save this function somewhere, and re-use it on every survey with a question about pets without having to re-code all of those steps each time.

<div class="question">

Take some time to study the above function. Make sure you understand all of the steps it is taking, and how it produces the output that it does.

</div>

Now, we could make this even more general. In reality here we are solving the problem of splitting values by commas; several of our columns have that problem! We will go over how to make this function even better next week when we learn about iteration.

## Try it Yourself

Let's try creating a function on your own now.

<div class="question">

Create a function that will intake a **ROW** from the `survey` dataframe, and output a number showing how many total `NA`s there were in there row. The `is.na()` function will come in handy here. An example input and output should look like:

``` r
total_na(survey_row = survey[1,])

OUTPUT: 2
```

</div>

<div class="answer">

total_na = function(survey_row) {

\# get the sum of NAs
output = sum(is.na(survey_row))

\# output
return(output)
}

total_na(survey_row = survey\[1,\])

</div>

  [Overview]: #overview
  [The Data]: #the-data
  [Functions Under the Hood]: #functions-under-the-hood
  [Solving a Problem]: #solving-a-problem
  [Make it General]: #make-it-general
  [Try it Yourself]: #try-it-yourself
