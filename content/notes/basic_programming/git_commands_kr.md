---
title: "[Basic] Git Commands (KR)"
tags:
- Skill
- Basic
- Git
- KR
---
# Local에서 git 시작하기 / Remote에서 시작하기
```
git init # 새로운 git repository 생성
git clone <repo> -b <branch name> <folder name> # git repository의 특정 브랜치를 새로운 directory로 clone
```

# git 상태 확인
```
git status # 현재 branch file status 확인
git lg # git line graph 확인
git log # 현재 branch의 commit log 확인 -> escape는 :wq
git diff # working directory와 staging area의 file diff 확인
git diff head # 최신 commit과 working directory의 file diff 확인
```

# 브랜치
```
git checkout -b branch # create new branch
git checkout branch # switch head branch
git branch -d branch # delete a local branch
git branch -m <name> # rename current branch
```
# 변경 사항 폐기
git restore <file/directory path>
gir restore .

# 파일, 경로 내 변경 사항 staging
```
git add <file/directory path>
git add -p # add detail
```
# 커밋
## 단순 커밋
```
git commit -m "commit message"
git tag <tagname> # mark current current commit
git push --tags # publish tag
```

## 상세한 commit 작성
```
git commit
>>
enter commit message
```

## 최신 commit에 change 발생 시 추가
```
git add <change>
git commit --amend
```
# working with remote
## update remote
```
git fetch # don't integrate into head
git pull # directly integrate
```

# reset your current HEAD
```
git reset --hard <commit hash> # HEAD 포인터를 특정 commit으로 변경
git push -f origin master # 현재 local master를 remote master에 Push

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
