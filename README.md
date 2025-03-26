# dotfiles

|Homebrew Formulae|Homebrew Casks|Additional Apps|
|-|-|-|
|python@3.11<br>virtualenv<br>neovim<br>tmux<br>node@20<br>tree<br>qpdf<br>ffmpeg<br>htop<br>yabai<br>skhd<br>borders<br>zsh-autosuggestions<br>zsh-syntax-highlighting|Docker<br>Chromium<br>Telegram<br>Transmission<br>Upscayl<br>Wezterm|Amphetamine<br>Wipr<br>TablePlus<br>[Endpoint Security](https://support.checkpoint.com/results/download/120374)|

### Instaling core
1. Installing Homebrew
	```bash
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    echo "eval $(/opt/homebrew/bin/brew shellenv)" >> ~/.zprofile; \
    echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc; \
    echo "export TERM='xterm-256color'" >> ~/.zshrc; \
    echo "export EDITOR='nvim'" >> ~/.zshrc; \
    echo "export VISUAL='nvim'" >> ~/.zshrc
	```
1. Installing Python & Node
	```bash
	brew install python@3.11 virtualenv node@20; \
    echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc;
    export LDFLAGS="-L/opt/homebrew/opt/node@20/lib"; \
    export CPPFLAGS="-I/opt/homebrew/opt/node@20/include"; \
    sudo mkdir -p /usr/local/bin; \
    sudo ln -s /opt/homebrew/opt/python@3.11/libexec/bin/python3 /usr/local/bin/python; \
    sudo ln -s /opt/homebrew/opt/python@3.11/libexec/bin/pip3 /usr/local/bin/pip
	```
1. Installing terminal, apps, extensions, fonts & casks
	```bash
    brew tap homebrew/cask-fonts; \
    brew tap FelixKratz/formulae; \
	brew install neovim tmux htop tree koekeishiya/formulae/yabai koekeishiya/formulae/skhd "font-roboto-mono-nerd-font" borders ### ffmpeg qpdf zsh-autosuggestions zsh-syntax-highlighting ripgrep; \
    brew install --cask docker eloston-chromium telegram transmission upscayl wezterm; \
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'; \
    pip install "python-lsp-server[all]" python-lsp-isort pylsp-mypy python-lsp-black pylint-venv
	```

### Softlink iCloud & dot files
```bash
rm -rf ~/iCloud\ Drive || :; ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud\ Drive; \
rm -rf ~/Documents/iCloud\ Drive || :; ln -s ~/iCloud\ Drive ~/Documents/iCloud\ Drive; \
rm -rf ~/.ssh || :; ln -s ~/iCloud\ Drive/.ssh ~/.ssh; \
rm -rf ~/.config || :; git clone git@github.com/dsp-shp/dotfiles .config; \
rm -rf ~/.git* || :; ln -s ~/.config/gitignore ~/.gitignore; ln -s ~/.config/gitconfig ~/.gitconfig; \
rm -rf ~/.tmux.conf || :; ln -s ~/.config/tmux.conf ~/.tmux.conf; \
rm -rf ~/.wezterm.lua || :; ln -s ~/.config/wezterm.lua ~/.wezterm.lua; \
rm -rf ~/Library/Application\ Support/com.tinyapp.TablePlus/Data || :; mkdir -p ~/Library/Application\ Support/com.tinyapp.TablePlus/ ; ln -s ~/iCloud\ Drive/.tableplus ~/Library/Application\ Support/com.tinyapp.TablePlus/Data; \
sudo rm -f ~/.zshrc || :; ln -s ~/.config/zshrc ~/.zshrc; \
source ~/.zshrc
```

### Dock settings
```bash
defaults write com.apple.dock autohide -bool true; \
defaults write com.apple.dock autohide-delay -float 1000; \
defaults write com.apple.dock no-bouncing -bool TRUE; \
defaults write com.apple.dock tilesize -int 1; \
defaults write com.apple.dock ResetLaunchPad -bool true; \
killall Dock;
```

### Activate yabai & skhd
```bash
yabai --start-service; \
skhd --start-service; \
brew services start borders
```

