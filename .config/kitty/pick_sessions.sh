#!/bin/zsh

export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$PATH"

SESSION_DIR="$HOME/.config/kitty/sessions"

session_files=$(find "$SESSION_DIR" -maxdepth 1 \( -name "*.kitty-session" -o -name "*.session" \) \
    | sed -E "s|(.*)/(.*)\.(kitty-session\|session)|\2 \| \1/\2.\3|")

if [[ -z "$session_files" ]]; then
    echo "No session files found in $SESSION_DIR"
    sleep 2
    exit 1
fi

selected=$(echo "$session_files" | fzf \
    --height=100% \
    --layout=reverse \
    --prompt="Switch Session > " \
    --with-nth=1)

if [[ -n "$selected" ]]; then
    session_path=$(echo "$selected" | awk -F' | ' '{print $NF}')
    kitten @ action goto_session "$session_path"
fi
