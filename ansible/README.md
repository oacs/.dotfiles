# Ansible Setup

## Requirements

```shell
# install ansible
sudo pacman -S ansible -y

# install ansible community plugins
ansible-galaxy collection install community.general


sudo dnf group install 'Development Tools'
sudo dnf install procps-ng curl file git libxcrypt-compat
```

## Grub Theme

https://github.com/vinceliuice/grub2-themes

```shell
sudo ./install.sh -b -s 4k -t stylish
```
