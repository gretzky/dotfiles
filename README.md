# dotfiles

Dotfiles for my Macbook Pro 15,1 running macOS Catalina 10.15.

| ![Auto ls with colors](https://user-images.githubusercontent.com/15176096/71632895-ff0d0980-2bde-11ea-966f-65e5d564361f.png) | ![Vim and tmux](https://user-images.githubusercontent.com/15176096/71633424-2f09dc00-2be2-11ea-9c15-a4f492b7ea68.png) |
| ---------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| zsh w/ [starship config](https://starship.rs/) and [auto-color-ls](https://github.com/gretzky/auto-color-ls)                 | Neovim and tmux                                                                                                       |

zsh w/ [starship prompt](https://starship.rs/)

-   Terminal: [Alacritty](https://github.com/jwilm/alacritty)
-   Window management: [yabai](https://github.com/koekeishiya/yabai)
-   Hotkeys: [skhd](https://github.com/koekeishiya/skhd)
-   Vim: [neovim](https://neovim.io/) with [Vundle](https://github.com/VundleVim/Vundle.vim) to manage plugins
-   Tools: [tmux](https://github.com/tmux/tmux), [z](https://github.com/rupa/z), [fzf](https://github.com/junegunn/fzf)

## Installation

**Before you get started** make sure you give full disk access permission to your terminal (for writing macos defaults). `System Preferences -> Privacy -> Full Disk Access`.

To install:

`curl -L https://git.io/JeA7g | sh`

This expands to [run.sh](https://github.com/gretzky/dotfiles/blob/master/run.sh) which will fetch this repo and run the install script.

## File overview

-   Configs for the following tools:
    -   Alacritty
    -   fzf
    -   z
    -   git
    -   [colorls](https://github.com/athityakumar/colorls)
    -   skhd
    -   yabai
    -   starship
-   Shell environment configs:
    -   `.zshrc`
    -   `.zlogin.sh`
    -   `.zshenv.sh`
    -   [Antigen]https://github.com/zsh-users/antigen) for zsh plugin management
    -   `.aliases`
    -   `.exports`
-   `Brewfile` (contains all homebrew packages, casks, and mac appstore apps)
-   VSCode settings

The install script will also setup a better Python environment with [pyenv](https://github.com/pyenv/pyenv) and set the global Python version to 3.7 instead of 2 (macOS default).

### Customization

-   The ['highlight color'](https://github.com/gretzky/dotfiles/blob/ad8580a0898c416528cc44e451cc36044d4c299a/macos/.macos#L22-L23) (accent color for mac, typically blue) is set to pink. To set it to a different color:
    -   Pick your desired color and get its RGB value (ex. pink is `255,105,180`)
    -   Take each value and divide it by 255 (ex. pink is now `1, 0.41176470588, 0.70588235294`)
    -   Put them into RGB order (ex. pink is `"1 0.41176470588 0.70588235294"`)

## Acknowledgements

-   [huyvohcmc/dotfiles](https://github.com/huyvohcmc/dotfiles)
-   [alrra/dotfiles](https://github.com/alrra/dotfiles)
-   [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
