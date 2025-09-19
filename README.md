<h1 align="center">AutoBaSS</h1>

> <sub>This repo is part of an assignment for CSE 337 at Stony Brook University</sub>

AutoBaSS  is an automated Backup & Sync System that enables users to backup a directory in another.

# Usage
If we want to backup `dir1` in `dir2`, we can do
```bash
./archive.sh dir1 dir2
```
This creates a compressed `tar.gz` file in dir2 that, when decompressed, replicates everything included in the directory.

We can mitigate the need to specify the diectories here and instead go with a good old
```bash
./archive.sh
```
This can only be done if we have the file `archive.conf` in the working directory, which must look like
```bash
SRC=dir1
TRG=dir1
```
To ignore certain file or directory patterns in `dir1` and not have them backed up, write them in a `.bassignore` file.

For example, if we want to ignore backups and logs in the same file, we must have the following in our `.bassignore` file:
```.bassignore
autobass-bkp*
*.log
```

To check what patterns we're excluding,
```bash
./archive.sh -d
```
> `-d` is short for `--dry-run`. You can use both.
