# OACS Dotfiles

Here I store all the configs that I need for my Arch env

## File structure

Prabably this is going to change in the future, but so far so good with:

./
| [config folder]/ # config folders for `$XDG_CONFIG_HOME`
| scripts/ # Any useful script that I need

## Deps

Wayland for for rofi: [rofi-wayland](https://github.com/lbonn/rofi)

### Obsidian

Wayland install:

```
flatpak install flathub md.obsidian.Obsidian
flatpak override --user --env=OBSIDIAN_USE_WAYLAND=1 md.obsidian.obsidian
```

### Initial packages
- [ ] yay
- [ ] wayland setup
- [ ] https://christitus.com/my-new-desktop-hyprland/
- [x] fish
- [ ] echo /usr/local/bin/fish | sudo tee -a /etc/shells
<!-- chsh -s /usr/bin/fish -->
- [x] firefox nordpass
- [x] for nordpass gnome-keyring libsecret-1-dev
- [ ] ssh setup
- [ ] msh-keygen -t ed25519 -C "oacs1221@gmail.com"
- [ ] eval (ssh-agent -c)
- [ ] ssh-add ~/.ssh/id_ed25519
- [x] github-cli
- [ ] gh auth login
- [x] git  git config name email
- [x] git config --global user.name "Oscar C" 
- [x] git config --global user.email oacs1221@gmail.com
- [ ] set dark theme preference
- [x] rust
- [ ] curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
- [ ] stylua 
- [ ] cargo install stylua
- [ ] set OPENAI_API_KEY
- [x] node and npm install
- [x] ansible-core
