#
# Git
#

if not type -q git
  return
end

# Log
set _git_log_medium_format "%C(auto)%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B"
set _git_log_oneline_with_author_format "%C(auto)%h %s%d %C(bold)%C(cyan)%aN%C(reset) %C(auto)%x1b[2m%ad%x1b[0m%Creset"
set _git_log_oneline_format "%C(auto)%h %s%d %x1b[2m%ad%x1b[0m%Creset"
set _git_log_brief_format "%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n"

# Status
set _git_status_ignore_submodules "none"

#
# Aliases
#

# Git
alias g="git"

# Branch (b)
alias gb="git branch"
alias gba="git branch --all --verbose"
alias gbc="git checkout -b"
alias gbD="git branch --delete --force"
alias gbd="git branch --delete"
alias gbf="git branch --all --contains"
alias gbL="git branch --all --verbose"
alias gbl="git branch --verbose"
alias gbM="git branch --move --force"
alias gbm="git branch --move"
alias gbR="git branch --move --force"
alias gbr="git branch --move"
alias gbS="git show-branch --all"
alias gbs="git show-branch"
alias gbV="git branch --verbose --verbose"
alias gbv="git branch --verbose"
alias gbX="git branch --delete --force"
alias gbx="git branch --delete"

# Commit (c)
alias gc="git commit --verbose"
alias gca="git commit --verbose --all"
alias gcam="git commit --all --message"
alias gcaS="git commit --verbose --all --gpg-sign"
alias gcf="git commit --amend --reuse-message HEAD"
alias gcF="git commit --verbose --amend"
alias gcfS="git commit --amend --reuse-message HEAD --gpg-sign"
alias gcFS="git commit --verbose --amend --gpg-sign"
alias gcl="git-commit-lost"
alias gcm="git commit --message"
alias gcmS="git commit --message --gpg-sign"
alias gcO="git checkout --patch"
alias gco="git checkout"
alias gcP="git cherry-pick --no-commit"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gcpx="git cherry-pick -x"
alias gcR="git reset "HEAD^""
alias gcr="git revert"
alias gcS="git commit --verbose --gpg-sign"
alias gcs="git show"
alias gcSa="git commit -S --verbose --all"
alias gcSf="git commit -S --amend --reuse-message HEAD"
alias gcSF="git commit -S --verbose --amend"
alias gcSm="git commit -S --message"
alias gcsS="git show --pretty=short --show-signature"
alias gcy="git cherry --verbose --abbrev"
alias gcY="git cherry --verbose"

# Conflict (C)
alias gCl="git --no-pager diff --name-only --diff-filter=U"
alias gCa="git add $(gCl)"
alias gCe="git mergetool $(gCl)"
alias gCO="gCo $(gCl)"
alias gCo="git checkout --ours --"
alias gCT="gCt $(gCl)"
alias gCt="git checkout --theirs --"

# Data (d)
alias gd="git ls-files"
alias gdc="git ls-files --cached"
alias gdi="git status --porcelain --short --ignored | sed -n 's/^!! //p'"
alias gdk="git ls-files --killed"
alias gdm="git ls-files --modified"
alias gdu="git ls-files --other --exclude-standard"
alias gdx="git ls-files --deleted"

# Fetch (f)
alias gf="git fetch"
alias gfa="git fetch --all"
alias gfc="git clone"
alias gfcr="git clone --recurse-submodules"
alias gfm="git pull"
alias gfr="git pull --rebase --autostash"

# Flow (F)
alias gFb="git flow bugfix"
alias gFf="git flow feature"
alias gFh="git flow hotfix"
alias gFi="git flow init"
alias gFl="git flow release"
alias gFs="git flow support"

alias gFfc="git flow feature checkout"
alias gFfd="git flow feature diff"
alias gFff="git flow feature finish"
alias gFfl="git flow feature list"
alias gFfm="git flow feature pull"
alias gFfp="git flow feature publish"
alias gFfr="git flow feature rebase"
alias gFfs="git flow feature start"
alias gFft="git flow feature track"
alias gFfx="git flow feature delete"

alias gFbc="git flow bugfix checkout"
alias gFbd="git flow bugfix diff"
alias gFbf="git flow bugfix finish"
alias gFbl="git flow bugfix list"
alias gFbm="git flow bugfix pull"
alias gFbp="git flow bugfix publish"
alias gFbr="git flow bugfix rebase"
alias gFbs="git flow bugfix start"
alias gFbt="git flow bugfix track"
alias gFbx="git flow bugfix delete"

alias gFlc="git flow release checkout"
alias gFld="git flow release diff"
alias gFlf="git flow release finish"
alias gFll="git flow release list"
alias gFlm="git flow release pull"
alias gFlp="git flow release publish"
alias gFlr="git flow release rebase"
alias gFls="git flow release start"
alias gFlt="git flow release track"
alias gFlx="git flow release delete"

alias gFhc="git flow hotfix checkout"
alias gFhd="git flow hotfix diff"
alias gFhf="git flow hotfix finish"
alias gFhl="git flow hotfix list"
alias gFhm="git flow hotfix pull"
alias gFhp="git flow hotfix publish"
alias gFhr="git flow hotfix rebase"
alias gFhs="git flow hotfix start"
alias gFht="git flow hotfix track"
alias gFhx="git flow hotfix delete"

alias gFsc="git flow support checkout"
alias gFsd="git flow support diff"
alias gFsf="git flow support finish"
alias gFsl="git flow support list"
alias gFsm="git flow support pull"
alias gFsp="git flow support publish"
alias gFsr="git flow support rebase"
alias gFss="git flow support start"
alias gFst="git flow support track"
alias gFsx="git flow support delete"

# Grep (g)
alias gg="git grep"
alias ggi="git grep --ignore-case"
alias ggl="git grep --files-with-matches"
alias ggL="git grep --files-without-matches"
alias ggv="git grep --invert-match"
alias ggw="git grep --word-regexp"

# Index (i)
alias giA="git add --verbose --patch"
alias gia="git add --verbose"
alias giD="git diff --no-ext-diff --cached --word-diff"
alias gid="git diff --no-ext-diff --cached"
alias gii="git update-index --assume-unchanged"
alias giI="git update-index --no-assume-unchanged"
alias giR="git reset --patch"
alias gir="git reset"
alias giu="git add --verbose --update"
alias giw="git diff -U0 -w --no-color $argv | git apply --cached --ignore-whitespace --unidiff-zero -"
alias gix="git rm -r --cached"
alias giX="git rm -r --force --cached"

# Log (l)
alias gl="git log --topo-order --pretty=format:'$_git_log_medium_format'"
alias glB="git log --topo-order --all --graph --abbrev-commit --branches --pretty=format:'$_git_log_oneline_with_author_format'"
alias glb="git log --topo-order --graph --abbrev-commit --branches --pretty=format:'$_git_log_oneline_with_author_format'"
alias glc="git shortlog --summary --numbered"
alias gld="git log --topo-order --stat --patch --full-diff --pretty=format:'$_git_log_medium_format'"
alias glD="git log --topo-order --stat --patch --word-diff --full-diff --pretty=format:'$_git_log_medium_format'"
alias glG="git log --topo-order --all --graph --pretty=format:'$_git_log_oneline_with_author_format'"
alias glg="git log --topo-order --graph --pretty=format:'$_git_log_oneline_with_author_format'"
alias glM="git log --topo-order --all --graph --author=`git config user.name` --pretty=format:'$_git_log_oneline_format'"
alias glm="git log --topo-order --oneline --author=`git config user.name` --pretty=format:'$_git_log_oneline_format'"
alias glms="git log --topo-order --oneline --stat --author=`git config user.name` --pretty=format:'$_git_log_oneline_format'"
alias glo="git log --topo-order --pretty=format:'$_git_log_oneline_with_author_format'"
alias glp="git log --patch"
alias glr="git log --topo-order --pretty=format:'$_git_log_brief_format'"
alias glS="git log --show-signature"
alias gls="git log --topo-order --stat --pretty=format:'$_git_log_medium_format'"

# Merge (m)
alias gm="git merge"
alias gma="git merge --abort"
alias gmC="git merge --no-commit"
alias gmF="git merge --no-ff"
alias gms="git merge --squash"
alias gmt="git mergetool"

# Push (p)
alias gp="git push"
alias gpa="git push --all"
alias gpA="git push --autostash && git push --tags"
alias gpc="git push --set-upstream origin $(git-branch-current 2> /dev/null)"
alias gpF="git push --force"
alias gpf="git push --force-with-lease"
alias gpp="git pull origin $(git-branch-current 2> /dev/null) && git push origin $(git-branch-current 2> /dev/null)"
alias gpt="git push --tags"
alias gpx="git push --delete origin"

# Rebase (r)
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gri="git rebase --interactive"
alias grs="git rebase --skip"

# Remote (R)
alias gR="git remote"
alias gRa="git remote add"
alias gRb="git-hub-browse"
alias gRl="git remote --verbose"
alias gRm="git remote rename"
alias gRp="git remote prune"
alias gRP="git remote prune origin"
alias gRs="git remote show"
alias gRu="git remote update"
alias gRx="git remote rm"

# Stash (s)
alias gs="git stash"
alias gsa="git stash apply"
alias gsd="git stash show --patch --stat"
alias gspush="git stash push"
alias gshm="git stash push -m"
alias gsl="git stash list"
alias gsL="git-stash-dropped"
alias gsp="git stash pop"
alias gsr="git-stash-recover"
alias gss="git stash save --include-untracked"
alias gsS="git stash save --patch --no-keep-index"
alias gsw="git stash save --include-untracked --keep-index"
alias gsx="git stash drop"
alias gsX="git-stash-clear-interactive"

# Submodule (S)
alias gS="git submodule"
alias gSa="git submodule add"
alias gSf="git submodule foreach"
alias gSi="git submodule init"
alias gSI="git submodule update --init --recursive"
alias gSl="git submodule status"
alias gSm="git-submodule-move"
alias gSs="git submodule sync"
alias gSu="git submodule update --remote --recursive"
alias gSx="git-submodule-remove"

# Tag (t)
alias gt="git tag"
alias gtl="git tag -l"
alias gts="git tag --sort=objecttype --sort=-creatordate | git show --date=local --pretty=\"format:%C(auto)%h%C(green)%d %C(blue)%an %C(auto)%s %x1b[2m%ad%x1b[0m%Creset\" -s --stdin"
alias gtl="git tag --list"
alias gts="git tag --sign"
alias gtv="git verify-tag"

# Working Copy (w)
alias gwc="git clean --dry-run"
alias gwC="git clean --force -d"
alias gwD="git diff --no-ext-diff --word-diff"
alias gwd="git diff --no-ext-diff"
alias gwR="git reset --hard"
alias gwr="git reset --soft"
alias gws="git status --ignore-submodules=$_git_status_ignore_submodules --short"
alias gwS="git status --ignore-submodules=$_git_status_ignore_submodules"
alias gwX="git rm -r --force"
alias gwx="git rm -r"

# Work Tree (W)
alias gWa="git worktree add"
alias gWx="git worktree remove"
alias gWX="git worktree remove -f"
alias gWl="git worktree list"

# github pr command
alias ghpC="gh pr comment"
alias ghpc="gh pr create"
alias ghpd="gh pr diff"
alias ghpe="gh pr edit"
alias ghpl="gh pr list"
alias ghpm="gh pr merge"
alias ghpr="gh pr review"
alias ghps="gh pr status"
alias ghpv="gh pr view"
alias ghpx="gh pr close"

# github secrets command
alias ghsl="gh secret list"
alias ghss="gh secret set"
alias ghsx="gh secret remove"

