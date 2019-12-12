# YANKEE.vim

## Installation
1. This plugin use `junegunn/fzf`, so please install it and setup runtimepath. if already installed fzf in your environment, then unnecessary this step.
``` sh
# Install fzf
$ git clone https://github.com/junegunn/fzf.git $HOME/.fzf
```
``` vim
" In .vimrc
Plug '$HOME/.fzf'
```

2. Install this plugin.
``` vim
Plug 'n04ln/yankee.vim'
```

3. setup `g:yankee_buf_list`. This variable is an Array of the name of target buffers. There are used by this plugin.
```
let g:yankee_buf_list = ['"b', '"c', '"f', '"h']
```

3. Complete :tada:

## Usage

In Visual mode, when press `<C-y>y`, yank text to one of the `g:yankee_buf_list`.

In Normal mode, when press `<C-y>p`, paste text with fzf (plz choose it).

