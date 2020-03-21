# dotfiles

```
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
# others also
```
activate current vim file
```
source %
```
git command behaves like `less`
```
git config --global --replace-all core.pager "less -F -X"
```

## plugins
### coc.nvim
```
After update coc-settings.json
Restart coc server by command :CocRestart
```

### fzf
```
Ctrl-t -> tab split
Ctrl-x -> split
Ctrl-v -> vsplit
```
### nerdtree 
```
shift + ? -> quickhelp

m -> insert/delete file in nerd tree
i -> a split split 
s -> a vertical split
```

### tmux
```
prefix(Ctrl-a) + :
tmux source-file ~/.tmux.conf
```
- tmux-resurrect
```
prefix + Ctrl-s - save
prefix + Ctrl-r - restore
```
### zsh
```
gst -> take a peek at the diff of each file returned by git status

glo -> take a peek at each file returned by git logs
```

## shortcut
```
space + p -> search file

Ctrl-w (num) + / Ctrl-w (num) - -> resize split window
Ctrl-w (num) > / Ctrl-w (num) < -> resize vsplit window

<leader>z -> vim-jsdoc 

<leader>r -> Find and replace
<leader>/ -> Claer highlighted search terms while preserving history

<leader>y -> Automatically remove trailing whitespace

zc -> close a fold
zo -> open a fold

<leader>t -> tabnew
<leader>w -> tabclose
<leader>l -> tabnext
<leader>h -> tabprev

// External grep
<leader>a -> :grep -r xxx *
             :copen
q         -> quit

// Find and Replace
<leader>r -> :%s/pattern/replace/g
```

## vscode vim plugins move problem
```
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
```

## iterm2
[Remapping iTerm 2's shortcut for clear buffer](https://superuser.com/questions/1154896/remapping-iterm-2s-shortcut-for-clear-buffer)
