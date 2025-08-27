alias gfpush='git push --force'
grmain () {
	main_branch=$(git remote show [your_remote] | sed -n '/HEAD branch/s/.*: //p')
	current_branch=$(git branch --show-current)
	git switch $main_branch
	git pull
	git switch $current_branch
	git rebase $main_branch "$@"
}

gpullf () { 
	git fetch --all && git reset --hard origin/$(git branch --show-current); 
}

gprune () {
	MAIN=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
	git checkout -q $MAIN && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $MAIN $branch) && [[ $(git cherry $MAIN $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done; git fetch -p
}
