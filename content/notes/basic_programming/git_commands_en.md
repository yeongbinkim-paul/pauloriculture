---
title: "[Basic] Git Commands (EN)"
tags:
- Skill
- Basic
- EN
---
# Start git / Clone repository
```
git init # initializes a new Git repository in the current directory
git clone <repo> -b <branch name> <folder name> # clones a specific branch from a git repository into a new directory
```

# Check git
```
git status # 현재 branch file status 확인
git lg # shows git line graph
git log # shows commit log in current branch -> escape = :wq
git diff # shows differences between the working directory and the staging area (or index).
git diff head # compares the contents of the working directory with the latest commit.
```

# Branch
```
git checkout -b branch #create new branch
git checkout branch #switch head branch
git branch -d branch #delete a local branch
git branch -m <name> #rename current branch
```
# Discard changes in the working directory
git restore <file/directory path>
gir restore .

# Stage file/directory
```
git add <file/directory path>
git add -p # add detail
```

# Commit
## simple commit
```
git commit -m "commit message"
git tag <tagname> # mark current current commit
git push --tags # publish tag
```

## commit with detailed message
```
git commit
>>
enter commit message
```

## add changes to the most recent commit
```
git add <change> # stages the changes for commit.
git commit --amend # modifies the most recent commit
```

# working with remote
## update remote
```
git fetch #don't integrate into head
git pull #directly integrate
```

# reset your current HEAD
```
git reset --hard <commit hash> # moves the HEAD pointer to a specific commit
git push -f origin master # forcefully pushes the current state of your local 'master' branch to the 'origin' remote
```

# branching strategy
To make main branch look clean, use rebase in case of small group
```
git rebase master
git rebase --continue #after resolving conflict
```

in large group
use pull request - merge strategy.
developer just create new branch to add feature.
maintainer or director review the branch when merge with pull request
