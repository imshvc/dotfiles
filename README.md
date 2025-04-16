# **imshvc's dotfiles (Linux and Windows via MSYS2)**

## Installation - Remote

> [!CAUTION]
> Destroys (_overwrites_) any existing files.

**Regular user**

```text
/bin/bash -c "$(curl -fsSL imshvc.github.io/dotfiles)"
```

**Root user**

```text
sudo /bin/bash -c "$(curl -fsSL imshvc.github.io/dotfiles)"
```

## Installation - Local

1. Git clone the repository: `git clone https://github.com/imshvc/dotfiles --depth=1`
2. `cd dotfiles && chmod +x apply.sh && ./apply.sh`

## MSYS2 (Windows)

> [!CAUTION]
> You must set your user an environment variable **HOME** pointing to your user directory:

```text
HOME = C:\Users\Nurudin
```

You must run: `C:\msys64\usr\bin\bash.exe --login`

```text
Nurudin@NURUDIN-PC MSYS ~
$ echo $HOME
/c/Users/Nurudin
```
