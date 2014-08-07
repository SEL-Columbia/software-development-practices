Github Usage
============

The Sustainable Engineering Lab (SEL) uses the [shared repository model](https://help.github.com/articles/#shared-repository-model) for coordinating changes and pull requests, following the [Github Flow](http://scottchacon.com/2011/08/31/github-flow.html) workflow, as described below.

Every developer affiliated with SEL is granted push access to each public repository in the [SEL-Columbia github account](https://github.com/SEL-Columbia) and topic branches are used to isolate changes. 

![Alt text](http://i.imgur.com/8uZjXxm.png "The shared repository model")

Principles of github-flow
----------
1. Master should always be deployable.
2. Create descriptive branches off of master, push to them often.
3. Create a pull request when your code is ready to be merged to master.
4. Generally, someone else should merge your code, or give you a +1 before you do.


Contributing to a Repository
----------------------------

### 1. Creating a New Branch

Branches are created to add new features or correct bugs and issues. 

Before branching, make sure the repository you wish to change is current, via either:

1. A [clone](https://help.github.com/articles/github-glossary#clone), if this is the first time you are working with this particular repository; or 

2. A [pull from origin](https://help.github.com/articles/github-glossary#pull) (as opposed to [fetch and merge](https://help.github.com/articles/fork-a-repo#what-is-the-difference-between-fetch-and-pull)) for a repository which already exists in your local environment.

Choose a branch name that is **descriptive**, and **specific to the nature** of the change. New branches are created using this syntax:

```
$ git checkout -b <new-branch-name>
```

### 2. Making a Pull Request

Once your local changes are complete and correct, [push the branch](https://help.github.com/articles/github-glossary#push) to the origin using this syntax:

```
$ git push origin <new-branch-name>
```

Next, login to [github.com](https://github.com) and [issue a pull request](https://help.github.com/articles/using-pull-requests#initiating-the-pull-request) through the web interface, and then [submit it](https://help.github.com/articles/using-pull-requests#sending-the-pull-request) for review.

### 3. Contribution Example

Here is the sequence of commands used to create this branch of the [StyleGuides](https://github.com/SEL-Columbia/StyleGuides):

* Get the latest, up-to-date version of the repository via clone:

    ```
$ git clone https://github.com/SEL-Columbia/StyleGuides.git
Cloning into 'StyleGuides'...
remote: Counting objects: 18, done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 18 (delta 3), reused 18 (delta 3)
Unpacking objects: 100% (18/18), done.
Checking connectivity... done
```

* Go to the local repository and confirm that it is the master branch:

    ````
$ cd StyleGuides
$ git branch
* master
```

* Create a new branch for the purpose of adding this github usage guide:

    ```
$ git checkout -b github_pull_requests
Switched to a new branch 'github_pull_requests'
```

* Confirm that are currently in the new branch:

    ```
$ git branch
* github_pull_requests
  master
```

* Made the documentation changes, then committed them to the <tt>github_pull_requests</tt> branch:

    ```
$ git commit -am "Added a github-usage section to the StyleGuides"
[github_pull_requests b1242b6] Added a github-usage section to the StyleGuides
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 github-usage/README.md
```

* Pushed the branch to the origin:

    ```
$ git push origin github_pull_requests
Counting objects: 7, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (5/5), 2.27 KiB | 0 bytes/s, done.
Total 5 (delta 1), reused 0 (delta 0)
To https://github.com/SEL-Columbia/StyleGuides.git
 * [new branch]      github_pull_requests -> github_pull_requests
```	

* Finally, logged in to [github.com](https://github.com) and [issued a pull request](https://help.github.com/articles/using-pull-requests#initiating-the-pull-request) through the web interface.

Approving Contributions
-----------------------

### 1. Reviewing a Pull Request

When you are notified of a new contribution as a pull request, login to [github.com](https://github.com) and use the built-in [pull request reviewer](https://help.github.com/articles/using-pull-requests#reviewing-the-pull-request) to see the changes made, and you can also [post comments and questions](https://help.github.com/articles/using-pull-requests#pull-request-discussion) to the contributor(s).

Before approving the pull request, make sure to checkout the new branch in your local repository (next section), so that you can run any tests as needed.

### 2. Checking Out Someone Else's Branch

Make sure your local repository is up-to-date, using either clone or pull from origin, as described above.

Next, make sure to **checkout from origin** using the <tt>-t</tt> switch with the checkout command:

```
$ git checkout -t origin/<new-branch-name>
$ git pull origin <new-branch-name>
```

Not using the <tt>-t</tt> switch before the branch origin pull may leave your local repository in an incomplete state.

### 3. Accepting and Merging a Pull Request

Run any tests as needed, and if the branch is good, [accept and merge the pull request](https://help.github.com/articles/merging-a-pull-request#merging-directly-on-github) using the web interface on [github.com](https://github.com).

Now you can deploy the changes to your production environment from the github repository.

### 4. Pulling changes that have been made on a branch:

Sometimes, someone will change a branch after you last pulled it, you will need to update it. Say that Jill wrote some code, created a pull request, you gave Jill some feedback, she made some more changes, and now you want to see her latest changes to test it / check it. If you had set up a branch to track, as in #2 above, you simply have to pull the remote branch to see the changes.

```
$ git pull origin <existing-branch-name>
```

Alternatively, the master branch may have gotten ahead of your branch, so you need to <i>pull the master into your branch</i> to avoid any merge conflicts going forward:

```
$ git checkout <new-branch-name> && git pull origin master && git push origin <new-branch-name>
```

Reverting to a Specific Commit
------------------------------

When mistakes are made, it is possible to go back to a previous version, using the [SHA-1 checksum code](http://git-scm.com/book/en/Getting-Started-Git-Basics#Git-Has-Integrity) git provides for each commit.

Use the checksum of the prior commit like this:

```sh 
git revert --no-commit [checksum]..HEAD
git commit
```

As [explained here](http://stackoverflow.com/a/21718540):

_This will revert everything from the HEAD back to the commit hash, meaning it will recreate that commit state in the working tree as if every commit since had been walked back. You can then commit the current tree, and it will create a brand new commit essentially equivalent to the commit you "reverted" to._

_(The --no-commit flag lets git revert all the commits at once- otherwise you'll be prompted for a message for each commit in the range, littering your history with unnecessary new commits.)_

*This is a __safe and easy way to rollback to a previous state.__ No history is destroyed, so it can be used for commits that have already been made public.*

References & Acknowledgements
-----------------------------

* [Github Help: Using Pull Requests](https://help.github.com/articles/using-pull-requests)
* [Version Control the Git Way](http://media.pragprog.com/titles/tsgit/chap-002-extract.html) 
* [Github Flow](http://scottchacon.com/2011/08/31/github-flow.html)
* [Git Branching - Basic Branching and Merging](http://www.git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging)
