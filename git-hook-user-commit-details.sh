#!/bin/bash

set -x #for debugging, TODO: remove
echo "parameters are" $@
echo "1 is " $1

#List of banned users
bannedusers=( root )

author_name=$(git show --pretty=oneline --pretty=format:%an | head -n1)
author_email=$(git show --pretty=oneline --pretty=format:%ae | head -n1)

committer_name=$(git show --pretty=oneline --pretty=format:%cn | head -n1)
committer_email=$(git show --pretty=oneline --pretty=format:%ce | head -n1)

commit_users=( "${author_name}" "${committer_name}" )

#display all user commit details
  for acommituser in "${commit_users[@]}"
  do
    :
    echo $acommituser #for debugging, TODO: remove
    for abanneduser in "${bannedusers[@]}"
    do
      :
        echo $abanneduser #for debugging, TODO: remove
        if [[ $abanneduser == $acommituser ]]; then
         echo "################################################################"
         echo "Commits from $abanneduser are not allowed"
         echo "git config user.name bob builder --replace-all"
         echo "git config user.email bob@aol.com"
         echo "git commit --amend --reset-author"
         echo "################################################################"
         exit 1
        fi
    done
  done