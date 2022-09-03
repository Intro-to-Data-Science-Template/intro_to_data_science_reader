---
pre: <b>2. </b>
title: "git/GitHub"
weight: 2
format:
  hugo:
    toc: true
    output-file: "_index.en.md"
    reference-links: true
    code-link: true
---



-   [Overview][]
-   [git on Windows][]
-   [git on Mac][]

## Overview

**git** is a tool for version control and collaboration. It is *the* tool used by data science teams big and small to keep track of code. Think of it like track changes in Word or Google docs, but for code files.

**You will also need an account on Github**. [Please create one here][].

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

The next screen will ask you to pick a "default editor, click the drop down box and select"Use the Nano editor by default." The press **Next**.

![][9]

On the next screen, it will ask to override the default "branch name." Select the "Override the default branch name for new repositories" option, and in the text box type "main." Press **Next**.

![][10]

The next screen will ask you if you want to adjust your path environment. Leave the default of "Git from the command line and also from 3rd-party software." Press **Next**.

![][11]

On the next screen, keep the default option of "Use bundled OpenSSH." Press **Next**

![][12]

On the next screen, keep the default option of "Use the OpenSSL library." Press **Next**.

![][13]

Leave the default "Checkout Windows-style, commit Unix-style line endings" selected on the next page and hit **Next**:

![][14]

Keep the default "Use MinTTY (the default terminal of MSYS2)" selected on the "Configuring the terminal emulator to use with Git Bash" window and hit **Next**:

![][15]

Keep the default value of "Default (fast-forward or merge)" on the "Choose the default behavior of 'git pull'" page and hit **Next**:

![][16]

Keep the default value of "Git Credential Manager Core" on the "Choose a credential helper" page and hit **Next**:

![][17]

Keep the default values on the "Configuration extra options" page by keeping "Enable file system caching" checked and "Enable symbolic links" unchecked and then hit **Next**:

![][18]

Make sure that no options are checked in the "Configuring experimental options" page and hit **Install**:

![][19]

After you hit this **Install** button as per above, you will see an install progress screen like the one below:

![][20]

When the install is complete, a new, "Completing the Git Setup Wizard" window like the one below will appear:

![][21]

Make sure that all of the options on this window are unchecked as in the image below and then hit the **Finish** button:

![][22]

This will complete your installation process. Now we need to configure some settings. Right click on your desktop, and click on "Git Bash here." A black terminal window will open.

![][23]

Click on the window, and then copy the following and press enter, changing "Jane Doe" to your name. You must put your name in quotes. `git config --global user.name "Jane Doe"`

![][24]

Lastly, copy the following and press enter, changing the email to your email address. `git config --global user.email jdoe@example.com`

![][25]

## git on Mac

To install git on a Mac, first open the launchpad by pressing `F4` or by making a pinch motion on the track pad with three fingers and your thumb.

![][26]

A terminal window will open up, showing your account name and then a `$`, with a flashing cursor afterwards. You will enter text here to issue commands.

![][27]

Enter type in the word `git` and press enter.

![][28]

A window will pop up, asking if you want to install "developer tools." Click **Install**.

![][29]

A prompt will appear asking you to agree to the license agreement, click **Agree**.

![][30]

The software will then start installing. It will take a few minutes to finish. When it is done you will see the following window. Click **Done**.

![][31]

To make sure eveything is installed correctly, go back to the terminal window and enter `git` once again. You should see a long printout that looks similar to the following. If you do, everything worked!

![][32]

Next we will need to set up some options. Fist, copy the following into the terminal and press enter to change the default branch name: `git config --global init.defaultBranch main`

![][33]

Next, copy the following and press enter, changing "Jane Doe" to your name. You must put your name in quotes. `git config --global user.name "Jane Doe"`

![][34]

Lastly, copy the following and press enter, changing the email to your email address. `git config --global user.email jdoe@example.com`

![][35]

{{% notice note %}}
Thanks to the <a href="https://datalab.ucdavis.edu/install-guide/">UC Davis DataLab's Install Guide</a> for providing a portion of this guide.
{{% /notice %}}

  [Overview]: #overview
  [git on Windows]: #git-on-windows
  [git on Mac]: #git-on-mac
  [Please create one here]: https://github.com/
  [1]: ./img/win_git_install_1_browser.jpg "New web browser window"
  [https://git-scm/com/downloads]: https://git-scm.com/downloads
  [2]: ./img/win_git_install_2_git_page.jpg "git website"
  [3]: ./img/win_git_install_3_downloading.jpg "git download page"
  [4]: ./img/win_git_install_4_run_open.jpg "Completed download box"
  [5]: ./img/win_git_install_5_allow_changes.jpg "Windows request to allow program to alter files"
  [6]: ./img/win_git_install_6_license.jpg "git license agreement"
  [7]: ./img/win_git_install_7_install_location.jpg "git location selection"
  [8]: ./img/win_git_install_9_checked_components.jpg "git component selection"
  [9]: ./img/nano.jpg "use nano as editor"
  [10]: ./img/main_branch.jpg "rename the deault branch"
  [11]: ./img/git_path.jpg "default path selection"
  [12]: ./img/ssh.jpg "use bundled ssh"
  [13]: ./img/openssl.jpg "use openssl"
  [14]: ./img/win_git_install_15_line_ending.png "git line end options"
  [15]: ./img/win_git_install_16_terminal_emulator.png "git bash options"
  [16]: ./img/win_git_install_17_git_pull.png "git pull options"
  [17]: img/win_git_install_18_credential_helper.png "git credential options"
  [18]: img/win_git_install_19_extra_options.png "git extra options"
  [19]: img/win_git_install_20_experimental_options.png "git experimental options"
  [20]: img/win_git_install_21_install_progress.png "git installing"
  [21]: img/win_git_install_22_install_complete.png "git completion window"
  [22]: img/win_git_install_23_deslect_and_finish.png "git completion window with unchecked View Release Notes"
  [23]: img/win_git_setup_1.jpg "open git bash"
  [24]: img/win_git_setup_2.jpg "default user name"
  [25]: img/win_git_setup_3.jpg "default user email"
  [26]: img/01.png "mac launchpad"
  [27]: img/02.png "mac terminal"
  [28]: img/03.png "git in terminal"
  [29]: img/04.png "mac developer tools"
  [30]: img/05.png "license agreement"
  [31]: img/06.png "done window"
  [32]: img/07.png "git help file"
  [33]: img/08.png "default branch name"
  [34]: img/09.png "default user name"
  [35]: img/10.png "default user email"
