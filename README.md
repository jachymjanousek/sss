# Super Simple Shell – SSS

Set of aliases and functions to automate repetetive actions.

## Requirements

### ZSH

[Installation](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

### Oh My ZSH

https://ohmyz.sh/#install

#### Git Plugin

add line into `~/.zshrc`

```shell
plugins=(git)
```

## Installation

Open terminal and run:

```shell
# Go to HOME directory
cd ~

# clone SSS repository
git clone git@github.com:jachymjanousek/sss.git .sss

# add source to .zshrc
echo "source $HOME/.sss/zshrc.sh" >> "$HOME/.zshrc"
```
