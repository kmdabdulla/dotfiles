if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

source ~/.bash_aliases

zoxide init --cmd cd fish | source

fzf --fish | source

fish_hybrid_key_bindings

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert block
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
