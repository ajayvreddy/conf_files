export USER=`whoami`
export HISTCONTROL=ignoredups:erasedups
if [ -z "$PS1" ]; then
    return
fi
PS1='\[\[\e[33m\]\w\[\e[0m\][$?]$ '
PROMPT_DIRTRIM=2
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

gg () {
session=$(tmux display-message -p '#S')
window=$(tmux display-message -p '#I')
file=$(realpath "$1")
pane=${2:-1}

tmux send-keys -t $session:$window.$pane ":tabnew $file" C-m
tmux select-window -t $session:$window.$pane \; select-pane -t $session:$window.$pane
# movew -r   # to renumber windows in tmux
}
