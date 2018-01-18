# Advanced git

---

```
$ git config -l
user.name=Nic Roland
user.email=nic.roland@ammeon.com
user.twitter=@nicr9_
user.github=github.com/nicr9
```

----

## Bare minimum version control

* `git pull`
* `git checkout -b feature/branch`
* `git add --all`
* `git commit -m "Some more changes"`
* `git push`
* `git checkout master`

Note:

* I'm assuming we're all familiar with `git`
* Developers learn a few simple commands and overlook the power of git
* Frequently need help when things go wrong...

---

## Version control best practices

* Review your own changes
* Commits should be small, related changesets
* Commit frequently
* Put useful detail into the commit messages

Note:

* Let's talk about how to get the most out of version control
* Some of the more controversial practices aren't mentioned here
    * Commit squashing, code linting hooks, etc.
* These practices allow developers to assume that they can:
    * Open arbitrary commits and they should be functional
    * Revert arbitrary commits and not incur unintended consequences
* These ideas sound great in theory
* How can we make it work in practice?

----

## Overview

* Breaking up changesets and reviewing commits (w/ `git add -p` and `git checkout -p`)
* Aborting commands like merges
* Context switching: (w/ `git stash` and `git worktree`)
* Digging into a repository's history (a closer look at `git log` and the git "pickaxe")
* Hunt down regressions in past commits (w/ `git bisect`)
* Git aliases to streamline your workflow

----

## Patch mode

`git add -p` and `git checkout -p`

* All too often people commit a file at a time
* Patch mode allows you to stage/discard parts of a changed file

Note:

* Commiting whole files makes it easy to overlook changes you didn't intend

----

## Aborting merges

`git merge --abort`

* I find this particularly helpful after a messy `git pull`

---

```
$ git pull
Auto-merging plugin/markdown/example.md
CONFLICT (add/add): Merge conflict in plugin/markdown/example.md
Auto-merging plugin/markdown/example.html
CONFLICT (add/add): Merge conflict in plugin/markdown/example.html
Automatic merge failed; fix conflicts and then commit the result.

$ git merge --abort
$ git pull -X theirs
```

Note:

* `-X` for setting merge strategy options

---

## Other things you can `--abort`

* `git revert --abort`
* `git rebase --abort`
* `git cherry-pick --abort`

----

## Context switching

![](https://i.imgflip.com/22wvj2.jpg)

Note:

* Has your boss ever asked you to drop everything immediately to fix a bug?
* There are a few ways to preserve your current changes so that you can work on higher priority work

---

`git commit --all` && `git checkout -b bugfix master`

* **PRO**: Easy to remember for git first timers
* **CON**: Commit represents incomplete changeset
* **CON**: You may have to `reset` or `commit --amend` later

Note:

* Incomplete changeset
    * Code commited may not work
    * The comment will be made in a hurry and won't make sense

---

`git stash save` && `git checkout -b bugfix master`

* Stash save your code without making a commit
* **PRO**: You can break up your changes with `git add -p` later
* **PRO**: Stored in a stack so you can stash as many changesets as you like
* `git stash pop` to reapply changes later

Note:

* Stashes can be saved with a message to remind you what you were working on

---

`git worktree add -b bugfix ../bugfix master`

* Creates a new worktree in a folder outside and checks out a new branch there
* **PRO**: Your current changeset is untouched; you can work on both changes in parallel
* **PRO**: Great for managing multiple release branches as separate directories
* **CON**: Only available in git 2.6+
* When you're finished you can delete the new worktree `rm -rf ../bugfix`

Note:

* I've used this for static website generation

----

## Digging into repository history

* I love the term "code archeology"
* Sometimes the comments just aren't enough
* Git is frequently used as a forensics tool

Note:

* A lot of what we do is read other peoples code
* Who introduced this bug?
* Why is the code written this way?
* What the fuck is that line supposed to do?!

---

`git blame <file>`

* Show the commit sha, author and date of the latest change to a file
* `-L n,m` - Process only line range n,m

Note:

* Vim has a git plugin called fugitive which has a great `:Gblame` function

---

`git log -- <file>`

* Commits that modify a specific file/directory

Note:

* Not many people realise that you can filter commits by file modified
* It can tell you a lot about that file's history and the design decisions
    * If people have been writting decent commit messages

---

`git log -p -S <string>`

* Called "git pickaxe"
* List commits that contain `<string>` if the diff
* `--pickaxe-all` to see full changesets
* `--pickaxe-regex` to interpret `<string>` as a regex

Note:

* Smarter than `git blame` which can only tell you the last commit that changed a line

---

`git bisect start` && `git bisect bad|good <commit-sha>`

* Find the commit that introduced a regression in O(log N)
* Use the `bad` and `good` commands to inform git which commits you know contain the regression
* Git will suggest new commits to try (based on a binary search)

----

# Git aliases

`git graph`

```
$ git config --global alias.graph "log --oneline --graph --decorate"
```

`git amend`

```
git config --global alias.amend "commit -a --amend -C HEAD"
```

----

## Q&A

[slides.nicro.land/advanced-git](http://slides.nicro.land/advanced-git)
