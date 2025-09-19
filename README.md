<h1 align="center">AutoBaSS</h1>

> <sub>This repo is part of an assignment for CSE 337 at Stony Brook University</sub>

AutoBaSS  is an automated Backup & Sync System that enables users to backup a directory in another.

The main purpose of this script project is to easily backup projects and keep the backup in sync.

# Installation
Using the https protocol,
```bash
git clone https://github.com/AshLink95/autobass.git
```

It's preferable to add the `archive.sh` script as a command. This is best done through
```bash
cp /path/to/archive.sh /path/to/autobass
chmod +x autobass
```
Note that the directory containing `autobass` should be in your `PATH` environmental variables.  

# Usage
For this section, I will consider `archive.sh` to be an executable. If you're not using it as an executable, you can still make use of the script in 3 ways:
```bash
source archive.sh
bash archive.sh
. archive.sh
```
`[OPTIONS]` will be revealed in details, below, in this section.

If we want to backup `dir1` in `dir2`, we can do
```bash
./archive.sh dir1 dir2
```
This creates a compressed `tar.gz` file in dir2 that, when decompressed, replicates everything included in the directory.

To check what patterns we're excluding,
```bash
./archive.sh -d
```
> `-d` is short for `--dry-run`. You can use both.

# Configuration file
We can mitigate the need to specify the diectories here and instead go with a good old
```bash
./archive.sh
```
This can only be done if we have the file `archive.conf` in our current working directory, which must contain a structure that looks like the following:
```bash
SRC=dir1
TRG=dir1
```

# Ignore dotfile
To ignore certain file or directory patterns in `dir1` and not have them backed up, write them in a `.bassignore` file.

For example, if we want to ignore backups and logs in the same file, we must have the following in our `.bassignore` file:
```.bassignore
autobass-bkp*
*.log
```
