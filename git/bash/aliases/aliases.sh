# Some good standards, which are not used if the user
# creates his/her own .bashrc/.bash_profile

# --show-control-chars: help showing Korean or accented characters
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
# This should clean all branches that have been merged and then prune references.
# https://stackoverflow.com/a/18143078/5476186
alias gitclean='git branch -r --merged | grep -v main | sed "s/origin\///" | xargs -r -n 1 git push --delete origin | git remote prune origin'
# Lazy git diff line count
alias giff='git diff HEAD --stat'
# This is meant for React projects and should show the line diff count, ignoring test render snapshots and the yarn lock file
# https://stackoverflow.com/a/39943727/5476186
alias giffreact='git diff HEAD --stat -- . ":(exclude)*.snap" ":(exclude)yarn.lock"'

case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7
	do
		case "$(type -p "$name".exe 2>/dev/null)" in
		''|/usr/bin/*) continue;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac
