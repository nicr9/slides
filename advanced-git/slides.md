# Advanced git

---

```
$ git config -l
user.name=Nic Roland
user.email=nicroland9@gmail.com
user.twitter=[@nicr9\_](https://twitter.com/nicr9_)
user.github=[github.com/nicr9](https://github.com/nicr9)
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
* Use commit messages as a type of documentation

Note:

* Let's talk about how to get the most out of version control
* Some of the more controversial practices aren't mentioned here
    * Commit squashing, code linting hooks, etc.
* These practices allow developers to assume that they can:
    * Open arbitrary commits and they should be functional
    * Revert arbitrary commits and not incur unintended consiquences
* These ideas sound great in theory
* How can we make it work in practice?

----

## Overview

* Breaking up changesets and reviewing commits (w/ `git add -p` and `git checkout -p`)
* Aborting merges and more
* Context switching: (w/ `git stash` and `git worktree`)
* Digging into a repository's history (a closer look at `git log` and the git "pickaxe")
* Hunt down regressions in past commits (w/ `git bisect`)
* Rewriting history; here be dragons (`git rebase -i` and `git filter-branch`)
* Retrieving lost commits (w/ the `git` reflog)
* Lesser known git config options
* Git aliases to streamline your workflow

----

## Patch mode

`git add -p` and `git checkout -p`

* All too often people commit a file at a time
* Patch mode allows you to stage/discard parts of a changed file

Note:
* `make patch`
* `git add -p` - Add a hunk, ignore a hunk, edit a hunk
* `git diff --cached` - Review staged changes
* `git checkout -p` - Discard a hunk, ignore a hunk, edit a hunk
* `git diff` - Review unstaged changes
* `git reset --hard HEAD`

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

`git commit --all` && `git checkout -b bugfix master`

* **PRO**: Easy to remember for git first timers
* **CON**: Commit represents incomplete changeset; Code commited may not work
* You may have to `--amend` this commit later to pick up where you left off

Note:

* Has your boss ever asked you to drop everything immediately to fix a bug?
* There are a few ways to preserve your current changes so that you can work on higher priority work

---

* `git stash save` && `git checkout -b bugfix master`

* Stash save your code without making a commit
* **PRO**: You can break up your changes with `git add -p` later
* **PRO**: Stored in a stack so you can stash as many changesets as you like
* `git stash pop` to reapply changes later

Note:

* Stashes can be saved with a message to remind you what you were working on

---

* `git worktree add -b bugfix ../bugfix master`

* Creates a new worktree in a folder outside and checks out a new branch there
* **PRO**: Your current changeset is untouched; you can work on both changes in parallel
* **PRO**: Great for managing multiple release branches as separate directories
* **CON**: Only available in git 2.6+
* When you're finished you can delete the new worktree `rm -rf ../bugfix`

Note:

* I've used this for static website generation

----

## Digging into repository history

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

----

# Git aliases

`git graph`

```
$ git config --global alias.graph=log --oneline --graph --decorate
```

`git amend`

```
git config --global alias.amend=commit --amend
```

----

## Further reading

* https://www.toptal.com/git/the-advanced-git-guide

---

## Q&A

[slides.nicro.land/advanced-git](http://slides.nicro.land/advanced-git)
