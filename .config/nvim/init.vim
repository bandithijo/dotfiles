"  ██████                           ██   ██   ██      ██ ██    ██
" ░█░░░░██                         ░██  ░██  ░██     ░██░░    ░░
" ░█   ░██   ██████   ███████      ░██ ██████░██     ░██ ██    ██  ██████
" ░██████   ░░░░░░██ ░░██░░░██  ██████░░░██░ ░██████████░██   ░██ ██░░░░██
" ░█░░░░ ██  ███████  ░██  ░██ ██░░░██  ░██  ░██░░░░░░██░██   ░██░██   ░██
" ░█    ░██ ██░░░░██  ░██  ░██░██  ░██  ░██  ░██     ░██░██ ██░██░██   ░██
" ░███████ ░░████████ ███  ░██░░██████  ░░██ ░██     ░██░██░░███ ░░██████
" ░░░░░░░   ░░░░░░░░ ░░░   ░░  ░░░░░░    ░░  ░░      ░░ ░░  ░░░   ░░░░░░

"  ██          ██   ██               ██
" ░░          ░░   ░██              ░░
"  ██ ███████  ██ ██████    ██    ██ ██ ██████████
" ░██░░██░░░██░██░░░██░    ░██   ░██░██░░██░░██░░██
" ░██ ░██  ░██░██  ░██     ░░██ ░██ ░██ ░██ ░██ ░██
" ░██ ░██  ░██░██  ░██   ██ ░░████  ░██ ░██ ░██ ░██
" ░██ ███  ░██░██  ░░██ ░██  ░░██   ░██ ███ ░██ ░██
" ░░ ░░░   ░░ ░░    ░░  ░░    ░░    ░░ ░░░  ░░  ░░

" All structure file is sorted & ordered with purposes.
" Please, consider if you want to reorder.
" It will cauase an error on issue.

source $HOME/.config/nvim/init.d/settings.vim
source $HOME/.config/nvim/init.d/formating.vim
source $HOME/.config/nvim/init.d/filetype.vim
source $HOME/.config/nvim/init.d/keybinding.vim

source $HOME/.config/nvim/init.d/plugin.vim
for f in split(glob('$HOME/.config/nvim/plugin/config/*.vim'), '\n')
    exe 'source' f
endfor
