---
pre: <b>Project 1. </b>
title: "Smith College Museum of Art"
weight: 1
summary: ""
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
---



-   [Overview][]
-   [Project Description][]
-   [Technical Details][]
-   [Tips for Success][]

## Overview

![][1]

The [Smith College Museum of Art (SCMA)][] staff want to better understand how people use the museum website. Project 1 will focus on real SCMA data spanning from July 2021 to June 2022. Your goal is to create a portfolio of data visualizations which help communicate the usage patterns of the SCMA website to museum staff. You can think of this project as a formalized exploratory data analysis. At the end of Project 1, your visualizations and accompanying reports will be given to the museum staff for them to learn from!

## Project Description

Project 1 will be completed in self-organized teams of 3 to 4. Each member will be creating their own visualizations, but each visualization from the team will be combined into one portfolio. You should not expect the museum staff to be familiar with data, and should explain things in such a way that anyone could understand.

All of the data (aside from the shop data) are exported from the museum's Google analytics platform. You can find the documentation for [Google analytics here][]; you will need to use it to reference what some of the measures in the data mean. You do not need to use every data file; just use what is relevant to your exploration. You can choose to supplement the museum data with other data if you would like. The museum data files include the following:

-   country_stats: Website visit statistics by country (based on visitor IP address).
-   country_users: Website user statistics by country (based on visitor IP address).
-   dates: Visit statistics for the website by day.
-   landing_page: The website page which people "land" on the website, a.k.a. the first page they view.
-   pages: Statistics regarding the specific pages on the museum website.
-   referrals: What service visitors are coming from (where they click on the link to the museum website).
-   search: Statistics regarding terms search on the website.
-   shop: Data on sales from the museum shop.
-   state_stats: Website visit statistics by state (based on visitor IP address).
-   state_users: Website user statistics by state (based on visitor IP address).

[You can find the data files hosted on the course Moodle here][]. You should unzip the file, and place all of files contained inside the `data/` folder within this project. **You should not share these data files anywhere, including your project github repo.**

## Technical Details

You have 2 weeks (until start of class 10/28) to work on this project, including one full day of class time (10/14). You have full freedom to make the project as simple or intricate as you desire. Each member of the team must make *at least one* data visualization. You can also create tables or other summaries to help explain the data to the reader. Your final submission should include the following:

**In your team Github repo:**

-   A Quarto portfolio document (any format) containing:
    -   All tables, summaries, and data visualizations you wish to present
    -   The code used to generate those items
    -   A textual explanation of how you made those items for non-coders
    -   A textual explanation of what your summaries/tables/visualization mean
    -   A summary explanation of what lessons can be learned from your portfolio as a whole

**Through Moodle:**

-   A word doc/pdf explaining your contributions to the project containing:
    -   A 1-2 paragraph summary of how you contributed to your team
    -   A list of each standard (per the course syllabus) you *individually* worked with in this project
    -   A justification for each standard describing what proficiency level you demonstrated *per the text in the [standards matrix][]*

The portfolio should be created using Quarto in R studio. I recommend you output to a PDF if you have only static visualizations, or html if your visualizations are interactive; you can choose other formats if they work better for your project.

The team will share one github repo. This repo should include all of your code. **I recommend creating your visualizations in separate files, and then combining them in your quarto portfolio document as a separate step.**

## Tips for Success

1.  Focus on creating a *minimum viable product* first. This means make something simple that satisfies all of the requirements, then go back and expand on what you have. Don't try to create something ultra-fancy as your first milestone.
2.  Start by spending time understanding all of the variables in the provided data. Include a document in your project explaining what all the variables mean.
3.  Each person should work in a separate R script for each table/summary/visualization you want to create. Make combining them into your finalized portfolio a separate step.
4.  If there is a specific standard you want to raise, look for opportunities to do so. Each part of the data will have different challenges that you can overcome to show your growth.
5.  Don't be afraid to branch out! There is no ceiling for this project. If you want to try a new tool or visualization style we haven't covered in class, give it a go. You can explain how you think it shows your proficiency in your Moodle submission.

  [Overview]: #overview
  [Project Description]: #project-description
  [Technical Details]: #technical-details
  [Tips for Success]: #tips-for-success
  [1]: img/scma.png "Smith College Museum of Art banner"
  [Smith College Museum of Art (SCMA)]: https://scma.smith.edu/
  [Google analytics here]: https://support.google.com/analytics
  [You can find the data files hosted on the course Moodle here]: https://moodle.smith.edu/mod/resource/view.php?id=954407
  [standards matrix]: https://intro-to-data-science-template.github.io/intro_to_data_science_reader/syllabus/#standards
