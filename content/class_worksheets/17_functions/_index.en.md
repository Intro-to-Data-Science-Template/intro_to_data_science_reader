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
-   [Solving an *Abstract* Problem][]
-   [Functions that "Think"][]

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

That's pretty complex looking; and it is. However, the point is that *this is the same code that runs when we call `table`*. We could, it we wanted, type this out ourselves and create our own `table` function.

<div class="question">

Copy the code from the `table()` function, and assign it to a new function called `my_table()`. Run both of them on the `mint_choc` column from our survey data. Does the output make sense?

</div>

Not all functions are as transparent. Try looking at the code behind the `sum()` function, and you may be disappointed. The most basic functions in R are "primitives," and are actually calling a lower level programming language than we can access through R. Looking at `sum` we see:

``` r
function (..., na.rm = FALSE)  .Primitive("sum")
```

You may also be surprised to learn that pretty much everything in R is a function, though often a primitive one. For example, we can look at the + sign as a function by warping it in ticks like so:

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

Here's where a custom function can help us. We're going to write a function that will split those values for us, and create a new pets dataframe that we can then attach to our current `survey` dataframe.

The first step of creating a good function is clearly defining the key components: the **input**, **output**, and **arguments**. In our case, the input will be our pets column, the output will be a dataframe with one column per pet type, and a value of `TRUE` or `FALSE` depending on if the case had that pet. We won't need any arguments for now.

When I am creating a function, I typically write the code to do what I want first, and then convert it into a function. Let's write some code to create our output dataframe, and then we can work to fill it. I want to stress that this is *one* way to go about solving this problem. There are plenty of other valid options.

First, we'll create a new dataframe with a column for each of our possible pets.I'll fill the dataframe with `NA`s for now.

``` r
pet_output = data.frame("dog" = NA,
                        "cat" = NA,
                        "fish" = NA,
                        "bird" = NA,
                        "reptile" = NA,
                        "rock" = NA,
                        "none" = NA,
                        "other" = NA)
```

Now, we need to figure out a way to test if the person listed one of our options in their response. We'll use a new function called `grepl()` to test this. The name itself is a product of very old programmer speak, but practically it will search through a character vector and give us a `TRUE` or `FALSE` if it finds a match for a pattern we give it. Thus, we can run the following on our `pets` column for each of our possible pets. We're going to tell it to ignore case, so that capital and lower case letters don't matter.

<div class="question">

Run the following code and explain it's output.

``` r
grepl(pattern = "dog", x = survey$pets, ignore.case = TRUE)
```

</div>

## Solving an *Abstract* Problem

argument for colum prefix

## Functions that "Think"

break days by commas

break anything by commas

  [Overview]: #overview
  [The Data]: #the-data
  [Functions Under the Hood]: #functions-under-the-hood
  [Solving a Problem]: #solving-a-problem
  [Solving an *Abstract* Problem]: #solving-an-abstract-problem
  [Functions that "Think"]: #functions-that-think
