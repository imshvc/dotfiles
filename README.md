# imshvc's dotfiles

Personal dotfiles with many goodies.

## Warnings

**WARNING**: Overwrites any existing files.

Bootstrap will not proceed if the file exists: `~/.dotfiles_bootstrapped`

You'll have to manually remove the file:

```bash
rm -f ~/.dotfiles_bootstrapped
```

## Bootstrap: regular user

Remote:

```bash
curl -sSL https://imshvc.github.io/dotfiles | /bin/bash -i 2>/dev/null
```

Local (assumes you've cloned the repo):

```bash
./scripts/bootstrap-local.sh 2>/dev/null
```

## Bootstrap: root user

### Method 1 (source files from other user)

Sourcing files from other user's home folder is not recommended
for security reasons, but I structured my files so that they play
nicely alongside two users (the regular user, and root user).

But then again - you should be bootstrapping into the root folder
separately, see [Method 2 (bootstrap root user)](#method-2-bootstrap-root-user).

**Run these commands as a regular user:**

```bash
sudo cp /home/$USER/.bashrc /root/.bashrc
sudo sed "s|\$HOME|/home/$USER|g" /root/.bashrc | sudo tee -a /root/.bashrc >&/dev/null
```

### Method 2 (bootstrap root user)

**Run these commands as a root user:**

Remote:

```bash
curl -sSL https://imshvc.github.io/dotfiles | ALLOW_ROOT=1 /bin/bash -i 2>/dev/null
```

Local (assumes you've cloned the repo):

```bash
ALLOW_ROOT=1 ./scripts/bootstrap-local.sh 2>/dev/null
```

## Documentation

[See documentation.](./DOCUMENTATION.md)
