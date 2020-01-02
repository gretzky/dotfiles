#!/bin/bash

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing."
        # install homebrew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        # change owner
        sudo chown -R $(whoami) /usr/local/Cellar
        sudo chown -R $(whoami) /usr/local/Homebrew
    fi

    printf "Installing homebrew packages..."
    brew bundle
    sudo gem install colorls
}

create_dirs() {
    declare -a dirs=(
        "$HOME/Downloads/torrents"
        "$HOME/Desktop/screenshots"
        "$HOME/dev"
        "$HOME/dev/work"
    )

    for i in "${dirs[@]}"; do
        mkdir "$i"
    done
}

build_xcode() {
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null

        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done

        sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

        sudo xcodebuild -license
    fi
}

main() {
    printf "🗄  Creating directories\n"
    create_dirs

    printf "🛠  Installing Xcode Command Line Tools\n"
    build_xcode

    printf "🍺  Installing Homebrew packages\n"
    install_brew

    printf "💻  Set macOS preferences\n"
    ./macos/.macos 

    printf "🐍  Set Python to 3.7\n"
    # setup pyenv / global python to 3.7.x
    pyenv install 3.7.4 >/dev/null
    pyenv global 3.7.4 >/dev/null
    # dont set conda clutter in zshrc
    conda config --set auto_activate_base false

    printf "🌈  Installing colorls\n"
    sudo gem install colorls >/dev/null

    printf "👽  Installing vim-plug\n"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    printf "🐗  Stow dotfiles\n"
    stow alacritty colorls fzf git nvim skhd starship tmux vim yabai z zsh

    printf "✨  Done!\n"
}

main
