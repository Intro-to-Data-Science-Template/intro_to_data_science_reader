---
pre: <b>10/12. </b>
title: "Data Science Ethics"
weight: 15
summary: "Tips for not creating a monster."
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [Codes of Ethics][]
    -   [Data Science Oath][]
    -   [Data Values and Principles][]
-   [Case Study][]

## Overview

Today we will be considering some of the ethical dilemmas data scientists encounter in their work. Failure to consider the ethical implications of our work can result in truly disastrous consequences. From manipulating the political process[^1], criminalizing poor parents and removing their children[^2], all the way to skewing the societal view of race and crime[^3], data systems have massive potential for harm. It is thus the duty of every data scientists to think carefully about their work, and try to prevent creating the next monster system.

Getting as sense of ethics in data science is not a simple matter. It requires understanding not only the pressures on you during your work, but the hypothetical consequences of that work. That's not easy even for the most experienced among us. It is also fully possible for reasonable people to disagree on both what should be considered generally under the umbrella of data science ethics, and the best course of action to resolve any individual problem.

## Codes of Ethics

Ethics, broadly defined, are the framework with which we decide what is right and wrong. As you might imagine, there is a significant amount of variation between people in their sense of ethics. Yet most people can often find some common ground.

To help people think through the potential dangers of their work, several organizations have attempted to create a code of ethics for data scientists. These codes attempt to create a framework what is considered ethical within a specific discipline. I will be including two such examples here: the [National Academies of Sciences Data Science Oath][], and the datapractices.org [Data Values and Principles Manifesto][].

### Data Science Oath

The National Academies of Sciences attempted to create an oath similar to the [hippocratic oath][] the doctors take for data scientists. This is my favorite attempt to codify data science ethics and I encourage you to mediate on it deeply.

> I swear to fulfill, to the best of my ability and judgment, this covenant:</br></br>
> I will respect the hard-won scientific gains of those data scientists in whose steps I walk and gladly share such knowledge as is mine with those who follow.</br></br>
> I will apply, for the benefit of society, all measures which are required, avoiding misrepresentations of data and analysis results.
> I will remember that there is art to data science as well as science and that consistency, candor, and compassion should outweigh the algorithm's precision or the interventionist's influence.</br></br>
> I will not be ashamed to say, "I know not," nor will I fail to call in my colleagues when the skills of another are needed for solving a problem.</br></br>
> I will respect the privacy of my data subjects, for their data are not disclosed to me that the world may know, so I will tread with care in matters of privacy and security. If it is given to me to do good with my analyses, all thanks. But it may also be within my power to do harm, and this responsibility must be faced with humbleness and awareness of my own limitations.</br></br>
> I will remember that my data are not just numbers without meaning or context, but represent real people and situations, and that my work may lead to unintended societal consequences, such as inequality, poverty, and disparities due to algorithmic bias. My responsibility must consider potential consequences of my extraction of meaning from data and ensure my analyses help make better decisions.</br></br>
> I will perform personalization where appropriate, but I will always look for a path to fair treatment and nondiscrimination.</br></br>
> I will remember that I remain a member of society, with special obligations to all my fellow human beings, those who need help and those who don't.</br></br>
> If I do not violate this oath, may I enjoy vitality and virtuosity, respected for my contributions and remembered for my leadership thereafter. May I always act to preserve the finest traditions of my calling and may I long experience the joy of helping those who can benefit from my work.</br></br>

[National Academies of Sciences. (2018). Data Science for Undergraduates: Opportunities and Options.][National Academies of Sciences Data Science Oath]

### Data Values and Principles

[datapractices.org][] compiled a list of 12 principles they feel provides strong guidance for working ethically in data science. The principles serve as solid guidance for conscientious work, but I caution against seeing them as a "project checklist," such that if your project matches all the principles it gets an "ethical" stamp of approval.

1.  Use data to improve life for our users, customers, organizations, and communities.
2.  Create reproducible and extensible work.
3.  Build teams with diverse ideas, backgrounds, and strengths.
4.  Prioritize the continuous collection and availability of discussions and metadata.
5.  Clearly identify the questions and objectives that drive each project and use to guide both planning and refinement.
6.  Be open to changing our methods and conclusions in response to new knowledge.
7.  Recognize and mitigate bias in ourselves and in the data we use.
8.  Present our work in ways that empower others to make better-informed decisions.
9.  Consider carefully the ethical implications of choices we make when using data, and the impacts of our work on individuals and society.
10. Respect and invite fair criticism while promoting the identification and open discussion of errors, risks, and unintended consequences of our work.
11. Protect the privacy and security of individuals represented in our data.
12. Help others to understand the most useful and appropriate applications of data to solve real-world problems.

[Data Values and Principles Manifesto][]

## Case Study

We will be going over the following case study as a group. Please read the scenario carefully, and then write down your own reaction to it. Please consider the following:

-   Broadly, do you think this is ethical?
-   Are any laws broken?
-   What role would a data scientist have in this process?
-   How would you apply one or both of the ethical codes included above to this situation?

> In the United States, most students apply for grants or subsidized loans to finance their college education. Part of this process involves filling in a federal government form called the Free Application for Federal Student Aid (FAFSA). The form asks for information about family income and assets. The form also includes a place for listing the universities to which the information is to be sent. The data collected by FAFSA includes confidential financial information (listing the schools eligible to receive the information is effectively giving permission to share the data with them).</br></br>
> It turns out that the order in which the schools are listed carries important information. Students typically apply to several schools, but can attend only one of them. Until recently, admissions offices at some universities used the information as an important part of their models of whether an admitted student will accept admissions. The earlier in a list a school appears, the more likely the student is to attend that school.</br></br>
> Here's the catch from the student's point of view. Some institutions use statistical models to allocate grant aid (a scarce resource) where it is most likely to help ensure that a student enrolls. For these schools, the more likely a student is deemed to accept admissions, the lower the amount of grant aid they are likely to receive.

[From Baumer, B. S., Kaplan, D. T., & Horton, N. J. (2021). Chapter 8 Data science ethics. In Modern Data Science with R. CNC Press.][]

[^1]: O'Neil, C. (2017). Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy. Broadway Books.

[^2]: Eubanks, V. (2018). Automating inequality: How high-tech tools profile, police, and punish the poor. St. Martin's Press.

[^3]: Noble, S. U. (2018). Algorithms of oppression: How search engines reinforce racism. New York University Press.

  [Overview]: #overview
  [Codes of Ethics]: #codes-of-ethics
  [Data Science Oath]: #data-science-oath
  [Data Values and Principles]: #data-values-and-principles
  [Case Study]: #case-study
  [National Academies of Sciences Data Science Oath]: https://doi.org/10.17226/25104
  [Data Values and Principles Manifesto]: https://datapractices.org/manifesto/
  [hippocratic oath]: https://en.wikipedia.org/wiki/Hippocratic_Oath
  [datapractices.org]: datapractices.org
  [From Baumer, B. S., Kaplan, D. T., & Horton, N. J. (2021). Chapter 8 Data science ethics. In Modern Data Science with R. CNC Press.]: https://mdsr-book.github.io/mdsr2e/
