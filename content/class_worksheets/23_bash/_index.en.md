---
pre: <b>10/31. </b>
title: "Bash"
weight: 23
summary: "Learn to navigate the shell by playing a game!"
format:
    hugo:
      toc: true
      output-file: "_index.en.md"
      reference-links: true
      code-link: true
      
---



-   [Overview][]
-   [Get the Game][]
-   [Playing the Game][]

## Overview

Today's <span style="color: orange;">***spooky***</span> worksheet will (hopefully) be a bit of a fun divergence. To get comfortable navigating around the terminal, we will be playing a video game, [GameShell][]! Or rather the venerable ancestor to modern video games, the text based role playing game. You'll be delving into the depths of castle cellars and slaying spiders like a proper Halloween adventure!

For this worksheet, please complete all the basic missions, \#1 through \#12. Feel free to adventure more though!

## Get the Game

Fittingly for a terminal based game, you'll actually download the game through the terminal! We need to do some prep work first though. To start off, open up a terminal and copy & paste the following command. It will ask you to enter your user password because it is installing new software for the game to run. You **will not** see your password as you enter it, this is normal.

    sudo apt install gettext man-db procps psmisc nano tree bsdmainutils x11-apps wget

If you want to know what this command does:

-   `sudo` (super-user do) elevates this command to admin status so it can install new things, that's why you need the password
-   `apt install` tells the terminal to install the following programs
-   The rest are programs, most of which you probably already have (gettext man-db procps psmisc nano tree bsdmainutils x11-apps wget)

Next up, you will use `wget` or web-get to download the game file off the internet. It will save the file wherever you currently are in the terminal, so probably best to move back to your user directory if you have moved elsewhere.

    wget https://github.com/phyver/GameShell/releases/download/latest/gameshell.sh

## Playing the Game

Once both of those commands are finished running, you can enter the following to start the game:

    bash gameshell.sh

Once you start the game, it will provide instructions on how to proceed. You will be using many of the commands we learned today. There are a few game specific commands that it will ask you to use. Know that these are just for the game, they won't work anywhere else:

gsh goal
:   Check your current goal

gsh check
:   Check if you have completed your current goal

gsh help
:   Get help with game specific commands

  [Overview]: #overview
  [Get the Game]: #get-the-game
  [Playing the Game]: #playing-the-game
  [GameShell]: https://github.com/phyver/GameShell
