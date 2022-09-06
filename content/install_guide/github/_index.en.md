---
pre: <b>3. </b>
title: "Github"
weight: 3
format:
  hugo:
    toc: true
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---



-   [Overview][]
-   [Create an Account][]
-   [Creating SSH Keys and Adding to Github][]

WIP

## Overview

[Github][] is a online code repository that great expands the utility of git. It acts as a clearinghouse for code, and is used worldwide by researchers, government, and industry.

## Create an Account

First up, we need to create an account on [github.com][Github]. Navigate to the site, and click the **Sign up** button in the upper right.

![][1]

Enter your email and create a password.

![][2]

That should be it!

## Creating SSH Keys and Adding to Github

**SSH Keys** are a way to identify your computer when accessing external resources. Think about it like a password for your computer to log in by itself. The first thing we need to do is create an SSH key for your computer. Open up R Studio, and click on the **Terminal** tab in the bottom left pane. Copy the following and press enter to create a key: \`\`

{{% notice warning %}}
Creating a new SSH key will invalidate all the places your current SSH key is used!
{{% /notice %}}

  [Overview]: #overview
  [Create an Account]: #create-an-account
  [Creating SSH Keys and Adding to Github]: #creating-ssh-keys-and-adding-to-github
  [Github]: https://github.com
  [1]: img/01.png
  [2]: img/02.png
