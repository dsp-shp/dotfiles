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
- borders
- min
- wezterm
- zsh-autosuggestions
- zsh-syntax-highlighting

### Instaling core
1. Installing Homebrew
	```bash
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile; \
    echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc; \
    echo 'export TERM=\'xterm-256color\'' >> ~/.zshrc; \
    echo 'export EDITOR=\'nvim\'' >> ~/.zshrc; \
    echo 'export VISUAL=\'nvim\'' >> ~/.zshrc
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
1. Installing terminal, apps, extensions & fonts
	```bash
    brew tap homebrew/cask-fonts
    brew tap FelixKratz/formulae
	brew install neovim docker tmux htop tree koekeishiya/formulae/yabai koekeishiya/formulae/skhd "font-roboto-mono-nerd-font" borders ### ffmpeg qpdf zsh-autosuggestions zsh-syntax-highlighting ripgrep
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
ln -s ~/.config/min/userscripts ~/Library/Application\ Support/Min/userscripts; \
rm -f ~/Library/Application\ Support/Min/settings.json; \
ln -s ~/.config/min/settings.json ~/Library/Application\ Support/Min/settings.json; \
sudo rm -f /etc/zshrc; \
sudo ln -s ~/.config/zshrc /etc/zshrc; \
source ~/.zshrc
```

### Installing casks
```bash
brew install --cask min dbeaver-community telegram transmission upscayl wezterm; \
### softlink dbeaver default project to icl/.dbeaver dir
```

### Dock settings
```bash
defaults write com.apple.dock autohide -bool true; \
defaults write com.apple.dock autohide-delay -float 1000; \
defaults write com.apple.dock no-bouncing -bool TRUE; \
defaults write com.apple.dock tilesize -int 1; \
killall Dock;
```

### Min add permissions
```bash
python -c "import os; import sqlite3; con = sqlite3.connect('/Users/%s/Library/Application Support/com.apple.TCC/TCC.db' % os.environ.get('USER')); cur = con.cursor(); cur.execute('''delete from access where client = 'com.electron.min';'''); cur.execute('''insert into access values ('kTCCServiceCamera','com.electron.min', 0, 2, 2, 1, null, null, null, 'UNUSED', null, 0, 1669648527, null, null, 'UNUSED', 0), ('kTCCServiceMicrophone','com.electron.min', 0, 2, 2, 1, null, null, null, 'UNUSED', null, 0, 1669648527, null, null, 'UNUSED', 0);'''); con.close()"
```

### Activate yabai & skhd
```bash
yabai --start-service; \
skhd --start-service; \
brew services start borders
```

### Additionally install App Store apps
- Amphetamine
- Wipr
