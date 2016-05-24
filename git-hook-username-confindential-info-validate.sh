#!/usr/bin/env bash
#Github Hook for validating usercommit and username

#alreadyPresent=$(git branch --contains ${commit} | wc -l)
#Extract user names here.taiking values in git log file
#commiters=$(git log --pretty=format:"%cn" $revs) #This should work in all git versions
#commit=$(git log --pretty=format:"%s" $com) 
#commit=$(git show --pretty=oneline --pretty=format:%s | head -n1)
#mycommit=$(git reflog --decorate --pretty=format:%s | head -n1)

#reading current user commit values (username,commit message from git log

read oldoldrev newrev user ref
commit_msg=$(git log --format=%s -n 1 $newrev)
#username=$(git log --format=%cn -n 1 $user)
username=$(git log --format=%cn -n 1 $newrev)

#username checking for prevent unknown user commit

printf "$username\n" | while read name; do
     if [[ $name == "unknown" ]]; then
	
      echo "You are committing as *$username* user which I don't like. Reveal your identity!\n"
	  echo "Setting your username.please run below commands\n"
	  printf "git config --global user.name <username>"	  
      exit 1
	  else
#commit message checking for prevent confidential information to remote 	        
if [[ $commit_msg == *"sreenath886"* ]]
then
  echo " Github Admin::Commit rejected!!Dont use confidential information in your commit message.please recommit and push";
  exit 1
fi	  
	  printf " Github Admin::$username code commited successfully Happy Social coding \n"
	  exit 0
     fi
done