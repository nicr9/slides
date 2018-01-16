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
* These ideas sound great in theory
* How can we make it work in practice?

----

## Overview

* Breaking up changesets and reviewing commits (w/ `git add -p` and `git checkout -p`)
* Context switching: (w/ `git stash` and `git worktree`)
* Digging into a repository's history (a closer look at `git log` and the git "pickaxe")
* Hunt down regressions in past commits (w/ `git bisect`)
* Rewriting history; here be dragons (`git rebase -i` and `git filter-branch`)
* Git config options
* Git aliases

----

# Patch mode

* All too often people commit a file at a time
* Patch mode allows you to stage/discard parts of a changed file

----

## Further reading

* https://www.toptal.com/git/the-advanced-git-guide
