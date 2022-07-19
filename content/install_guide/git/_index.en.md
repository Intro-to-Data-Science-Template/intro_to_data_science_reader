---
pre: <b>1. </b>
title: "git/GitHub"
weight: 1
format:
  hugo:
    toc: false
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---



## Overview

**git** is a tool for version control and collaboration. It is *the* tool used by data science teams big and small to keep track of code. Think of it like track changes in Word or Google docs, but for code files.

## git on Windows

Follow these step-by-step instructions if you're installing Git on a Windows machine:

First, launch a web browser, the image below shows the Microsoft Edge browser.

![][1]

Next, navigate to the following Git download URL in your browser [https://git-scm/com/downloads][].

![][2]

Select "Windows" from the Downloads portion of the Git webpage. Git will display the following page and automatically being downloading the correct version of the Git software. If the download doesn't start automatically, click on the "Click here to download manually link."

![][3]

When the download is complete, open/Run the downloaded file (it may look different in different browsers).

![][4]

A screen will appear asking for permissions for the Git application to make changes to your device. Click on the **Yes** button.

![][5]

Click **Next** to accept the user license.

![][6]

Leave the default "Destination Location" unchanged (usually C:\Program Files\Git) and hit **Next**

![][7]

You will see a screen like the one below asking you to "Select Components." Leave all of the default components selected. You can also check the boxes next to "Additional Icons" and it's sub-item, "On the Desktop" if you would like. Your completed configurations window should have the following components selected:

    Additional Icons 
        -> On the Desktop
    Windows Explorer integration
        -> Git Bash Here
        -> Git GUI Here
    Git LFS (Large File Support)
    Associate .git* configuration files with default text editor
    Associate .sh files to be run with Bash

![][8]

The next screen will ask you to "Select a Start Menu Folder." Keep the default value of Git and hit **Next**.

![][9]

<div class="aside">

Thanks to the [UC Davis DataLab][] for being the basis of this guide.

</div>

  [1]: ./img/win_git_install_1_browser.jpg "New web browser window"
  [https://git-scm/com/downloads]: https://git-scm.com/downloads
  [2]: ./img/win_git_install_2_git_page.jpg "git website"
  [3]: ./img/win_git_install_3_downloading.jpg "git download page"
  [4]: ./img/win_git_install_4_run_open.jpg "Completed download box"
  [5]: ./img/win_git_install_5_allow_changes.jpg "Windows request to allow program to alter files"
  [6]: ./img/win_git_install_6_license.jpg "git license agreement"
  [7]: ./img/win_git_install_7_install_location.jpg "git location selection"
  [8]: ./img/win_git_install_9_checked_components.jpg "git component selection"
  [9]: ./img/win_git_install_10_start_menu.jpg "git start menu shortcut"
  [UC Davis DataLab]: https://datalab.ucdavis.edu/install-guide/
