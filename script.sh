#!/bin/bash

finished=0
#function if user chose yes
git_commit_push(){
	new_branch=0
	git_branch_local=$(git rev-parse --abbrev-ref HEAD)
	git_branch_remote_string=$(git rev-parse --abbrev-ref ${git_branch_local} @{u})
	if [[ $? -eq 128 ]]; then 
		while true;do
		echo "There is no upstream branch. Would you like to push to $git_branch_local?"
		echo "(y/n)"
		read response;
		case $response in
			y) echo "The commit will be pushed to $git_branch_local";new_branch=1; break;;
			n) echo "The commit will not be pushed";new_branch=3;break;;
			*) echo "Invalid input, CTRL-C to exit."
		esac
		done
	fi
	git add .
	while true; do
        echo "Your commit message:"
        read message
        if [[ -z $message ]]; then
            echo "Commit message cannot be empty. Please try again."
        else
            break
        fi
    done
	git commit -m "$message"
	if [[ $new_branch -eq 1  ]]; then 
		git push -u origin $git_branch_local
	elif [[ $new_branch -eq 3 ]]; then
		echo "You chose not to push. Exiting."
	else
		git push
	fi
	finished=1
}

if [ -d "./.git" ]; then
	git status
	string=$(git status)
	pattern='nothing to commit'
	if [[ $string =~ $pattern ]]; then  

	echo "There is nothing to commit. Exiting"
	finished=1;
else
	while [ $finished -ne 1 ]
	do 

		echo "Would you like to add these changes to stage, commit, and push?"

		echo "(y/n)"

		read response;

		case $response in
			y) git_commit_push ;;
			n) echo "You chose no, exiting.";finished=1;;
			*) echo "Invalid input, CTRL-C to exit or select [n]"
		esac
	done;
	fi
else 
echo "There is no git repo here. Exiting"
	finished=1
fi


