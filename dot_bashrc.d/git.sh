alias gfpush='git push --force'
grmain () {
	current_branch=$(git branch --show-current)
	git switch main
	git pull
	git switch $current_branch
	git rebase main "$@"
}

gpullf () { 
	git fetch --all && git reset --hard origin/$(git branch --show-current); 
}

gprune () {
	MAIN=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
	git checkout -q $MAIN && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $MAIN $branch) && [[ $(git cherry $MAIN $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done; git fetch -p
}
