
# Minimal Neovim IDE

##  Why Minimal Neovim IDE

After Trying out different configs, I came to the conclusion that although the configs are great, they tend to break too easily and are a hassle to maintain. Hence, I came up with the idea of a minimalistic IDE which provides the basic functionalities without hindering workflow. 

## Features: 

 - Fast and lightweight
 - Autocorrect support for Java, c/c++ , lua, javascript, python and typescript out of the box
 - Code snippets and buffer for fast coding
 - Simple color schemes
 - Sane defaults
 ## Demo:
![Neovim demo](https://bose-aniket.onrender.com/static/media/nvim.3b7debf414b97ddee2c4.gif)
## Try out this config

Make sure to remove or move your current `nvim` directory

```
git clone https://github.com/zerkxes/Minimal-Neovim-IDE.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
 ## Keymaps
  Under lua/zerkxes a file named keymaps.lua exists. Some common keymaps include
  <pre>
  For Normal mode:
  Ctrl + h,j,k,l    window navigation
  Ctrl + f          file explorer
  Ctrl + arrows     window resize
  LShift + h,l      buffer navigation
  LAlt + j,k        move text up and down

  For insert mode:
  jk/jk             exit insert mode

  For visual mode:
  LAlt + j,k      move text up and down
  p               paste text
  </pre>
