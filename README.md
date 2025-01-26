# imshvc's dotfiles

Personal dotfiles with many goodies.  
**WARNING**: Overwrites any existing files.

## Bootstrap: regular user

Remote:

```bash
curl -fsSL https://imshvc.github.io/dotfiles | HISTFILE=/dev/null /bin/bash -i 2>/dev/null
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
sudo sed "s|\$HOME|/home/$USER|g" ~/.bashrc | sudo tee -a /root/.bashrc >&/dev/null
```

### Method 2 (bootstrap root user)

**Run these commands as a root user:**

Remote:

```bash
curl -fsSL https://imshvc.github.io/dotfiles | ALLOW_ROOT=1 HISTFILE=/dev/null /bin/bash -i 2>/dev/null
```

Local (assumes you've cloned the repo):

```bash
ALLOW_ROOT=1 ./scripts/bootstrap-local.sh 2>/dev/null
```

## Documentation

[See documentation.](./DOCUMENTATION.md)
