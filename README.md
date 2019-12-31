# dotfiles

Dotfiles for my Macbook Pro 14,2 running macOS Catalina 10.15.

## Installation

**Before you get started** make sure you give full disk access permission to your terminal (for writing macos defaults). `System Preferences -> Privacy -> Full Disk Access`.

To install:

`curl -L | sh`

This expands to [run.sh]() which will fetch this repo and run the install script.


### Customization

- The 'highlight color' (accent color for mac, typically blue) is set to pink. To set it to a different color:
    - Pick your desired color and get its RGB value (ex. pink is `255,105,180`)
    - Take each value and divide it by 255 (ex. pink is now `1, 0.41176470588, 0.70588235294`)
    - Put them into RGB order (ex. pink is `"1 0.41176470588 0.70588235294"`)

## Acknowledgements

-   [huyvohcmc/dotfiles](https://github.com/huyvohcmc/dotfiles)
-   [alrra/dotfiles](https://github.com/alrra/dotfiles)
-   [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
