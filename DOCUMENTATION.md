# imshvc's dotfiles - Documentation

Straight-forward documentation for my dotfiles.

---

# Functions

Several functions live in [`.bash_functions`](./.bash_functions) file.

---

## Function: cdseq

### Usage

```bash
usage: cdseq <directory name per argument, sequentially>
  navigates sequentially from a list of directory names
```

### Expansion

```bash
cdseq / usr include linux
```

expands to:

```bash
cd /
cd usr
cd include
cd linux
```

If the 2nd parameter is given a whole path:

```bash
cdseq / usr/include/linux
```

that expands to:

```bash
cd /
cd usr/include/linux
```

### Aliases

- `~` is an alias to `cdseq ~`. Example: `~ work/github` expands to `cd ~ && cd work && cd github`
- `r` is an alias to `cdseq /`. Example: `r usr/include` expands to `cd / && cd usr && cd include`
- `..` is an alias to `cdseq ..`. Example: `.. src/client` expands to `cd .. && cd src && cd client`.

### Example 1

Each parameter is treated as a `cd` command.

```bash
nurudin@ubuntu-pc:~$ cdseq ~ work github imshvc dotfiles
nurudin@ubuntu-pc:~/work/github/imshvc/dotfiles$
```

### Example 2

Second (2nd) parameter can be a full path.

```bash
nurudin@ubuntu-pc:~$ cdseq ~ work/github/imshvc/dotfiles
nurudin@ubuntu-pc:~/work/github/imshvc/dotfiles$
```

### Example 3

Initial path is preserved on error.

```bash
nurudin@ubuntu-pc:~$ cdseq ~ non_existent_path

   fail 

  cdseq: cd failed: /home/nurudin/non_existent_path

nurudin@ubuntu-pc:~$ pwd
/home/nurudin
```

**Notice the error here**, the requested path is not fully printed.  
The error reports on the sequence that failed:

```bash
nurudin@ubuntu-pc:~$ cdseq ~ non existent path

   fail 

  cdseq: cd failed: /home/nurudin/non

```

---

## Function: mcd

### Usage

```bash
usage: mcd <relative or absolute file path>
  creates a directory and navigates into it
```

### Expansion

```bash
mcd a/b/c/d
```

expands to:

```bash
mkdir a && cd a
mkdir b && cd b
mkdir c && cd c
mkdir d && cd d
```

### Example 1

Relative path.

```bash
nurudin@ubuntu-pc:~$ mcd an/awesome/directory
nurudin@ubuntu-pc:~/an/awesome/directory$
```

### Example 2

Initial path is preserved on error.

```bash
nurudin@ubuntu-pc:~$ mcd ~/.bashrc/test

   fail 

  mcd: mkdir failed: /home/nurudin/.bashrc/xd

```

### Example 3

Absolute path.

```bash
nurudin@ubuntu-pc:~$ mcd /home/nurudin/something/amazing/here
nurudin@ubuntu-pc:~/something/amazing/here$
```

---

## Function: log

### Usage

```bash
usage: log <type> <message>
  custom log function with colors
  types: fail, warn, note, info, pass
```

### Disclaimer

The command outputs with colors.  
Terminals without color support may not play nice.

### Example 1

```bash
nurudin@ubuntu-pc:~$ log fail 'Something happened and we had to bail.'

   fail 

  Something happened and we had to bail.

nurudin@ubuntu-pc:~$
```

### Example 2

```bash
nurudin@ubuntu-pc:~$ log info "Currently logged user is: $LOGNAME"
   info 

  Currently logged user is: nurudin

nurudin@ubuntu-pc:~$
```

### Example 3

```
nurudin@ubuntu-pc:~$ if [ -f ~/.some_file ]; then log pass "file exists"; else log fail "file does not exist"; fi

   fail 

  file does not exist

nurudin@ubuntu-pc:~$ touch ~/.some_file
nurudin@ubuntu-pc:~$ if [ -f ~/.some_file ]; then log pass "file exists"; else log fail "file does not exist"; fi

   pass 

  file exists

nurudin@ubuntu-pc:~$
```
