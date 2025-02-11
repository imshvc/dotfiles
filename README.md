# **imshvc's dotfiles (🐧Linux and 🪟Windows via MSYS2)**

## Installation - Remote

⚠️ Destroys (_overwrites_) any existing files.

**🟢Regular user**

```bash
/bin/bash -c "$(curl -fsSL imshvc.github.io/dotfiles)"
```

**🔴Root user**

```bash
sudo /bin/bash -c "$(curl -fsSL imshvc.github.io/dotfiles)"
```

## Installation - Local

1. Git clone the repository: `git clone https://github.com/imshvc/dotfiles --depth=1`
2. `cd dotfiles && chmod +x apply.sh && ./apply.sh`

## MSYS2 (Windows)

⚠️ You must set your user an environment variable **HOME** pointing to your user directory:

```text
HOME = C:\Users\Nurudin
```
