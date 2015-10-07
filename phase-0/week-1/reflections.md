# Think About Time

The top three things that stood out to me from among the selections were the power of meditation, habits and the growth mindset, and the pomodoro technique, which is substantially similar to me to the concept of timeboxing.  Timeboxing will work very well with my current schedule and intersecting responsibilities by allowing me to really make effective us of the smaller parcels of time during my day.  That in turn dovetails into the ideas presented in "Habits and Growth Mindset"; it is okay to break larger problems into small chunks - even micro chunks.

 

Currently I tend to be a day or weekly planner.  I set aside some time and create a task list.  Usually the first pass is very general categories of things, but I often go through a second or third iteration where I break things down into very small, easy to accomplish chunks.  For example, I might start with an item on my task list that says "Do laundry".  Later on in the day I'll break that down into its components and create a list like this: "Sort clothes"; "Clean clothes"; "Fold and put away clothes".  By breaking a task down into its smaller parts I find it easier to make progress, and it also gives me positive feedback during the day by allowing me to feel some sense of productivity even while I am in the midst of the process itself.  Which is to say, this strategy works fairly well for me.

Taking the time for self-care and meditation I think will be very important in keeping me mentally sharp and eager for the challenges that await at DBC.  Timeboxing will also be useful (or the pomodoro technique) in arbitrarily breaking up some of my longer efforts and help to create space for me to regroup and assess how I am doing and how I am feeling about the work.

I plan to continue to use my task lists as well as integrate timeboxing and mindfulness/meditation as I plan my study schedule throughout Phase 0.

# The command line

1. Bash is essentially the command line program for the GNU operating system, otherwise called a "shell program".  Shell programs like bash allow you to enter commands from your keyboard to the operating system.

2. While some commands are intuitive, some are distinctly not for me at this time.  This means that rote memorization is going to be key to absorbing the list of commands.  However, the basics concepts are fairly easy to grasp.  "pushd" and "popd" confused me for a second until I realized that it is used to rapidly switch between directories.

3. All of the commands work, though not all (like apropos) look exactly "pretty".

4. It is hard to estimate which commands will, over time, become the most crucial or useful; but, I would say that cd, ls, pwd, mkdir, rmdir, rm, touch, and help are likely to be the most important for now.

5.

pwd - print working directory

ls - list contents of current directory

mv - move file or directory.  can also be used to delete (overwrite) a file or directory

cd - change directory

../ - tells you what you are currently in (for example, that you are in a directory)

touch - creates an empty file

mkdir - creates a new directory

less - view a file a page at a time

rmdir - remove directory

rm - remove file

help - view the help manual for bash

# Forking and Cloning

Getting started with Github: How to create, fork, and clone your own repository.

Let's assume that you've already signed into Github and now you want to create your own repository (or repo).  If you look along the top menu bar you'll notice a "+" sign next to your profile picture in the upper right hand corner.  Go ahead and click that.  A drop down menu will pop up giving you an option, among others, that says "New Repository".  When you select that you will be brought to a new form page where you can name your shiny new repository and alter settings, like whether the repo will be public or private, whether or not there is a license and which kind, or whether to immediately clone the repo to your computer (but don't check this option, the command line will work just fine). When you've finished filling out the form click the big green "Create Repository" button at the bottom and - voila! - you've just created a new repository.

Forking a repository is even easier.  Navigate to the repo that you would like to fork.  Notice that there are option buttons on the upper right hand side of the screen, in line with your current directory location.  These options should be "watch/unwatch", "star", and "fork".  If you intuit that to fork a repo you should click on the fork option, you'd be exactly correct.  It really is that easy!  Click "fork" and you'll be given an option of where you'd like to fork that repository to.

Cloning a repository is made really easy and convenient for you by Github.  If you look down the menu frame on the right hand side of your screen, you'll notice that about mid way down is a little box labeled "HTTPS clone URL".  Go ahead and copy that URL to the command line like so:

>git clone [paste your copied url here]

Of course, before you actually do that you should navigate to the directory where you'd actually like the repo cloned to, and never clone a repo inside of an already existing repo.  Could get ugly up in there.

So why fork in the first place?  It allows you to work on a project without effecting the master.  You can experiment, tinker, test, and even completely break things and it won't damage the master branch in the least bit.  

I thought that working with git and Github would be more challenging than it actually was. My fears were unwarranted as everything has gone smoothly so far.  I think the biggest issue I had was in making a typo on the url and having the machine tell me it couldn't find the repo.  An easily solved problem!  The take away for me is don't be intimidated by the unknown, but rather embrace it.  It probably isn't as scary or confusing as it sounds at first.