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
    # tmux send :e <filename> to first pane
    session=$(tmux display-message -p '#S')
    window=$(tmux display-message -p '#I')
    file=$(realpath "$1")
    pane=${2:-1}
    pane=$session:$window.$pane 
    current_command=$(tmux display-message -t $pane -p '#{pane_current_command}')

    if [ $current_command = "bash" ]; then
        tmux send-keys -t $pane "g $file" C-m
    fi
    if [ $current_command = "nvim" ]; then
        tmux send-keys -t $pane ":tabe $file" C-m
    fi
    tmux select-window -t $pane \; select-pane -t $pane
    # movew -r   # to renumber windows in tmux
}

