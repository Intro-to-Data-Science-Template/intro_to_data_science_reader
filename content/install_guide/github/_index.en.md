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

## Overview

[Github][] is a online code repository that great expands the utility of git. It acts as a clearinghouse for code, and is used worldwide by researchers, government, and industry.

## Create an Account

First up, we need to create an account on [github.com][Github]. Navigate to the site, and click the **Sign up** button in the upper right.

![][1]

Enter your email and create a password.

![][2]

You will most likely receive an email from Github asking to confirm your account. Go and click that.

## Creating SSH Keys and Adding to Github

{{% notice warning %}}
Creating a new SSH key will invalidate all the places your current SSH key is used!
{{% /notice %}}

**SSH Keys** are a way to identify your computer when accessing external resources. Think about it like a password for your computer to log in by itself. The first thing we need to do is create an SSH key for your computer. Open up R Studio, and click on the **Terminal** tab in the bottom left pane. Copy the following, enter your correct email, and press enter to create a key: `ssh-keygen -t ed25519 -C "your_email@example.com"`

![][3]

It will ask where you want to save the key. Accept the defaults by pressing **Enter**.

![][4]

It will then ask you to create a pass phrase, press enter twice to skip this step.

![][5]

It will then show a printout of your key, and a little bit of art. I've greyed mine out here for security.

![][6]

Next, type `cd` and press enter, followed by `cat .ssh/id_ed25519.pub`. It will print out a code starting with "ssh-ed25519 ... your_email@smith.edu." You want to highlight all of that, including the "ssh-ed25519" and your email, press CTRL or command + C to copy it.

![][7]

We will not return to [github.com][Github] and login.

![][8]

In the upper right hand corner you will see your user profile dropdown. Click on that and go to **Settings**.

![][9]

On your setting screen, in the left hand menu, click on "SSH and GPG keys."

![][10]

On the next screen, click the green button in the upper right that says "New SSH Key."

![][11]

On the following screen, name your key, and paste the text we copied into the "Key" box. Then press the "Add SSH Key" button.

![][12]

  [Overview]: #overview
  [Create an Account]: #create-an-account
  [Creating SSH Keys and Adding to Github]: #creating-ssh-keys-and-adding-to-github
  [Github]: https://github.com
  [1]: img/01.png
  [2]: img/02.png
  [3]: img/03.png
  [4]: img/04.png
  [5]: img/05.png
  [6]: img/06.png
  [7]: img/07.png
  [8]: img/08.png
  [9]: img/09.png
  [10]: img/10.png
  [11]: img/11.png
  [12]: img/12.png
