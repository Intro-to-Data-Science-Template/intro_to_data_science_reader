---
pre: <b>11/16. </b>
title: "APIs"
weight: 30
summary: "Ask for your data the right way"
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [The Data][]
-   [Figuring out the Rules][]

## Overview

APIs allow us access to large amounts of remote data that we wouldn't have access to otherwise. While setting one up can take some time, it is almost always preferable to the alternative of downloading and dealing with with a pile of very large, very slow files. One situation in which this applies is the [Open Payments][] data we are using for our project!

Today we'll work through creating API calls for the Open Payments data. This will hopefully make working with the large data sets more approachable. I encourage you to walk through this process *completely* with me first, and then customize it to fit your specific project after.

## The Data

While we are working with the Open Payments data today, we're going to do so in a completely new way. Rather than loading all the data into R first, then sub-setting what we want, we will essentially do the sub-setting in our API call. This will save us the hassle fo loading a *massive* file into R, only to throw a bunch of it away later. It will also make getting data from multiple years much easier, as we can re-use our API calls to get the same data across years.

For the purpose of this worksheet, we're going to be looking at the [2021 General Payment Data][], but the process is the same for any of the Open Payments data. Open up the data page in a browser, as we'll need to reference the API documentation a lot; it's at the bottom of the page.

## Figuring out the Rules

The first step of using any API is figuring out how it works. Every API is different, so reading the docs is super important. The Open Payments docs could be better, but they'll work.

At the bottom of the [2021 General Payment Data][] page, you will see several colored boxes like the following:

![][1]

We want to use `GET` to "query" (subset) data from this dataset, so click on the arrow in the box corresponding to this single dataset.

![][2]

Once you do that, the box will open up to give us more information about getting data from this dataset. There is a lot here, so I'll break it down.

<div class="columns">

<div class="column">

The top part of the box defines the *parameters*, or what you can actually ask for in your API call.

</div>

<div class="column">

![][3]

</div>

</div>

  [Overview]: #overview
  [The Data]: #the-data
  [Figuring out the Rules]: #figuring-out-the-rules
  [Open Payments]: https://openpaymentsdata.cms.gov/
  [2021 General Payment Data]: https://openpaymentsdata.cms.gov/dataset/0380bbeb-aea1-58b6-b708-829f92a48202
  [1]: img/api_docs_1.png
  [2]: img/api_docs_2.png
  [3]: img/api_docs_3.png
