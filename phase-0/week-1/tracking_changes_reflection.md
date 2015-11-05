#How does tracking and adding changes make developers' lives easier?

It allows multiple people to collaborate on a project at the same time while providing a way to monitor what changes were made, by whom, and when.  If a problem then arises you can always revert to a previous working version of the file, which boths keeps things moving along, and also allows you to find exactly the point when the code "broke"

#What is a commit?

A commit is a save point.  You can always go back (revert) to a particular commit point should problems arise.

#What are the best practices for commit messages?

Verbs should be in the imperative because it describes what the commit will do to the project.  This makes it easier for other to understand what your commit will do when merged into the project.  Headers should ideally be soft limit of 50 characters long and the paragraph body, which describes your changes in greater detail, should be 72 characters long per line.  This makes it easier to process and read various log files and data from all of the commits.

#What does the HEAD^ argument mean?

This syntax will return you to the previous HEAD or start of your changes before the most recent one.  You can go back further using HEAD~3, HEAD~4, HEAD~5, and so on.  On the other hand, just a plain HEAD will take you back in time to the most recent changes made and undo them.  

#What are the 3 stages of a git change and how do you move a file from one stage to the other?

Stage one: Once you have modified a file you will need to add it to the package so that it will become a part of the commit.  You do this by :>git add [filename]

Stage two: After the file has been added you can commit it, or save those changes.  This is done with :>git commit -m "your message about what you did"

Stage three: Finally, you can push these changes back to the online repo at GitHub using the following syntax :>git push origin branch_name  where branch_name is the branch/fork you were working from remotely.

#Write a handy cheatsheet of the commands you need to commit your changes?

1. git pull - pull your repo from github
2. git checkout -b branch_name   - create and move to a new branch on your local computer
3. Do you work
4. git add   - this adds the file(s) to the current commit package
5. git commit -m "your pithy message here"   - commits (saves) all files that you added in the previous step
6. git push origin branch_name   - pushes your branch back up to the local master so that it will be available for a merge
7. git checkout master   - returns you to the main branch locally
8. git push origin master  -  sends your work back up to GitHub where you can review and merge it with the repo there. 

#What is a pull request and how do you create and merge one?

Once you have pushed your working branch to GitHub, you can switch to GitHub where you will see the pull request in the dashboard of your repository. A green button will appear that says "Compare and Pull Request".  Clicking on this will allow you to review the submitted material, add comments, and then give you the options via a another large green button to actually merge the new data into the master branch.

#Why are pull requests preferred when working with teams?

Pull requests make it easier for someone managing a team of people working on a large project to review, compare, and merge edits or additions to the project as a whole.