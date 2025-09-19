<center><h1>AutoBaSS</h1></center>

> <small><span style="color:gray;">This repo is part of an assignment for CSE 337 at Stony Brook University</span></small>

AutoBaSS  is an automated Backup & Sync System that enables users to backup a directory in another.

# Usage
If we want to backup `dir1` in `dir2`, we can do
```bash
./archive.sh dir1 dir2
```

To ignore certain file or directory patterns in `dir1` and not have them backed up, write them in a `.bassignore` file.

For example, if we want to ignore backups and logs in the same file, we must have the following in our `.bassignore` file:
```.bassignore
autobass-bkp*
*.log
```
