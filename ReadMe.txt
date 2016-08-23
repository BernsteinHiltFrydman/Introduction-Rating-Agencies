***************
** How to set-up GitHub and Use files
**
** Updated: 8/23/2016
***************

***************
** Initial Set-up
***************

1) Download GitHub desktop platform (for Windows or Mac)
https://desktop.github.com/

2) Install

3) Enter "username" and "password" from below:
Username: BernsteinHiltFrydman
Password: Ratings123

4) Hit "Continue"

5) Set local repository to your assigned folder on dropbox

***************
** File Structure Set-up and How-to-use
***************
- Each researcher has a separate dropbox folder with all files we use in them.

- This set-up means any changes you make on your computer don't automatically get shared with everybody else. 

- To update your files with all changes everybody else has uploaded:

1) Open "GitHub"
2) Hit "Sync" button
*Note: You should do this before you work with any files. That way you are sure to be working with the most recent file and it will give you information on all changes made and any notes written by the author for why they changed.

- To share changes you have made with everybody else:

1) Open "GitHub" 
2) Go to "Changes" tab
3) Select all files you want to update for everybody
4) Under "Summary" and "Description" give details on changes you have made and why
5) Hit check mark next to "Commit to master" at bottom.
6) Hit "Sync"

What is happening?
There is a central repository of all our data online (except for the large files which I have excluded. more details on that later) and we all have local personal versions of those files. When you "Sync" you either download from the server the newest versions of those files or upload the newest versions from your machine.

Why is this better than just using dropbox?
Version control. That's it. Essentially anytime anybody makes a change and hits "Sync" it keeps an archive of all changes and as long as people make notes for what they changed it records those too. It makes it very easy to see everything that has been done to the files, why it was done, and revert to earlier versions of necessary. This is the kind of set-up programmers use in the "real world". 

***************
** More Complex Q&A
***************

1) What if two people work on the same file at the same time and try to "Sync" them both without including the other persons edits?
A. In version control these are called "conflicts". What GitHub will do is automatically highlight all areas where the documents differ and help you cleverly merge in contributions from both people into the final document. This is a nice feature, especially if there are lots of programmers working on one large piece of code. For our purposes though the best plan is probably to modularize code and functions rather than having one large .do file and then just always make sure to "Sync" before working on the file. It is unlikely then that multiple people will be working on versions of the same code.

2) When I "Sync" not all files appear? Why is that?
A. GitHub has limits on the size of files we can upload and there are some files we don't ever want people to change in the master (unless we all agree to it). To avoid this issues I created a file called ".gitignore". It lists files and folders which will never be "Synced" to the master/central repository. For example when I initially set-up the repository (though this may have changed by now) I didn't allow anybody to change files that meet the following conditions:
1) End in ".csv"
2) End in ".xls"
3) End in ".dta"
4) Moodys_1909_Bond_Ratings.xlsx
5) Moodys_1909_Stock_Ratings.xlsx
6) Anything in the subfolder "RawData"
Some of these unecessary. For example #4 and #5 are in subfolder "RawData" so they are already excluded by #6, but I just wanted to make sure they were excluded even if we changed the folder's name. In the future I can hopefully include more redudancies like this to prevent similar issues. These are flexible rules and we may find in the future we want to change them.






