# @author     Jachym Janousek <jachym.janousek@woltair.cz>
# @license    http://opensource.org/licenses/gpl-license.php
#
# function definitions which can be edited/modified with 'fedit'


# display git log in nice format with graph
# @param {any} all - flag to show all branches
#
# usage: gitlog <all>
function gitlog() {
	allflag=""
	if [ "$1" != "" ]; then
		allflag="--all"
	fi
	git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' $allflag
}



# Print all open ports with prefix index, prompt user to select one and kill it
#
# usage: killports
function killports() {
	echo "Open ports:"
	# Prompt user to select a port to kill
	PS3="Enter the index of the port to kill: "
	ports=($(lsof -i -P -n | grep LISTEN | awk '{print $9}'))
	select opt in "${ports[@]}"; do
		if [[ -n $opt ]]; then
			port=$(echo $opt | cut -f2 -d:)
			kill $(sudo lsof -t -i:$port)
			break
		elif [[ $REPLY == "exit" ]]; then
			break
		elif [[ $REPLY == "q" ]]; then
			break
		else
			echo "Invalid option. Try again."
		fi
	done
}



# Pull source branch and optionally merge it to current branch
# @param {string} source - The source branch.
# @param {any} doMerge - flag to merge source branch to current branch
#
# usage: gitsync <source> <doMerge>
function gitsync() {
	# git add .
	if [ "$1" != "" ]; then
		gco "$1"
		echo sync "$1"
		git fetch
		git pull
		g-

		# optional merge source branch to current branch
		if [ "$2" != "" ]; then
			git merge "$1"
		fi
	fi
}



# Create new temp branch from current branch
# @param {string} target - target branch, where to merge temp branch
# @param {string} suffix - suffix for temp branch name (default to target branch)
# @param {string} source - source branch (default to current branch)
#
# usage: tempbranch <target> <suffix> <source>
function tempbranch() {
	current_branch="git symbolic-ref --short HEAD"

	#target branch from first argument
	if [ "$1" != "" ]; then
		target_branch=$1
	else
		echo "[SSS]: No target branch specified"
		kill -INT $$
	fi
	echo "[SSS]: Target branch: $target"

	# custom suffix from second argument or default to target branch
	suffix=$target_branch
	if [ "$2" != "" ]; then
		suffix=$2
	fi

	# branch name from third argument or current branch
	source_branch=$(current_branch)
	if [ "$3" != "" ]; then
		source_branch=$3
	fi
	echo "[SSS]: Source branch: $source_branch"

	branch_name="$source_branch-$suffix"
	echo "[SSS]: Creating temp branch: $branch_name"

	# pull source branch and create temp branch
	gco $source_branch
	git pull
	gcb $branch_name
	git merge $source_branch
	gpsup # push temp branch to remote and set upstream to current_branch
}
