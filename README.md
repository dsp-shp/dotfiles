# dotfiles

<table>
  <thead>
    <tr>
      <th>Homebrew Formulae</th>
      <th>Homebrew Casks</th>
      <th>App Store Apps</th>
      <th>Additional Apps</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        autossh<br>
        python@3.12<br>
        uv<br>
        neovim<br>
        node@20<br>
        tree<br>
        qpdf<br>
        ffmpeg<br>
        htop<br>
        sevenzip<br>
        opencode<br>
        trash
      </td>
      <td>
        Chromium<br>
        Docker<br>
        Ghostty<br>
        OBS<br>
        Telegram<br>
        Transmission<br>
        VSCode<br>
        OnlyOffice
      </td>
      <td>
        Amphetamine<br>
        GarageBand<br>
        v2RayTun<br>
        Wipr<br>
        uBlock Origin Lite
      </td>
      <td>
        TablePlus<br>
        <a href="https://support.checkpoint.com/results/download/120374">Endpoint Security</a><br>
        Davinci Resolve
      </td>
    </tr>
  </tbody>
</table>


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
	brew install node@20; \
    echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc;
    export LDFLAGS="-L/opt/homebrew/opt/node@20/lib"; \
    export CPPFLAGS="-I/opt/homebrew/opt/node@20/include";
	```
1. Installing terminal, apps, extensions, fonts & casks
	```bash
    brew tap FelixKratz/formulae; \
	brew install autossh minikube trash uv anomalyco/tap/opencode sevenzip neovim tmux htop tree koekeishiya/formulae/yabai koekeishiya/formulae/skhd "font-roboto-mono-nerd-font" ffmpeg ### qpdf zsh-autosuggestions zsh-syntax-highlighting ripgrep; \
    brew install --cask docker eloston-chromium telegram transmission visual-studio-code obs ghostty onlyoffice \
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';
	```

### Softlink iCloud & dot files
```bash
rm -rf ~/iCloud\ Drive || :; ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud\ Drive; \
rm -rf ~/Documents/iCloud\ Drive || :; ln -s ~/iCloud\ Drive ~/Documents/iCloud\ Drive; \
rm -rf ~/.ssh || :; ln -s ~/iCloud\ Drive/.ssh ~/.ssh; \
rm -rf ~/.config || :; git clone git@github.com:dsp-shp/dotfiles .config; \
rm -rf ~/.git* || :; ln -s ~/.config/gitignore ~/.gitignore; ln -s ~/.config/gitconfig ~/.gitconfig; \
rm -rf ~/.tmux.conf || :; ln -s ~/.config/tmux.conf ~/.tmux.conf; \
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

### Digital ministry certificates
```bash
...
```
