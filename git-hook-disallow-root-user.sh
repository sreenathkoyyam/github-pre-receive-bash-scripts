#!/bin/bash
#reading current user commit values (username) message from git log

read oldoldrev newrev user ref
username=$(git log --format=%cn -n 1 $newrev)
if [[ $username == 'root' ]]
then
    echo "If you commit as root, you're gonna have a bad time";
    exit 1;
fi