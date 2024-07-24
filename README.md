# dotfiles

**Homebrew components**
- python@3.11
- virtualenv
- neovim
- docker
- dbeaver-community
- tmux
- node@20
- tree
- qpdf
- ffmpeg
- htop
- yabai
- skhd
- wezterm
- zsh-autosuggestions
- zsh-syntax-highlighting

### Instaling core
1. Installing Homebrew
	```bash
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile; \
    echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc
	```
1. Installing Python & Node
	```bash
	brew install python@3.11 virtualenv node@20; \
    echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
    ### softlink brew python in usr/lib/bin
	```
1. Installing terminal & terminal apps
	```bash
	brew install neovim docker tmux htop tree yabai skhd ### ffmpeg qpdf zsh-autosuggestions zsh-syntax-highlighting
	```

### Softlink iCloud & dot files
```bash
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud\ Drive; \
ln -s ~/iCloud\ Drive/.ssh ~/.ssh; \
ln -s ~/iCloud\ Drive/.config ~/.config; \
ln -s ~/.config/gitignore ~/.gitignore; \
ln -s ~/.config/gitconfig ~/.gitconfig; \
ln -s ~/.config/tmux.conf ~/.tmux.conf; \
ln -s ~/.config/wezterm.lua ~/.wezterm.lua; \
sudo rm -f ~/etc/zshrc; \
sudo ln -s ~/.config/zshrc /etc/zshrc; \
source ~/.zshrc
```

### Installing casks
```bash
brew install --cask dbeaver-community transmission upscayl wezterm; \
### softlink dbeaver default project to icl/.dbeaver dir
```

### Dock settings
```bash
defaults write com.apple.dock autohide-delay -float 1000; \
defaults write com.apple.dock tilesize -int 1; \
killall Dock;
```

### Activate yabai & skhd
```bash
yabai --start-service; \
skhd --start-service
```

### Additionally install App Store apps
- Amphetamine
- FCPX
- Pixelmator
- Telegram
- Wipr
