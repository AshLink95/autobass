<center><h1>AutoBaSS</h1></center>

> <small><span style="color:gray;">This repo is part of an assignment for CSE 337 at Stony Brook University</span></small>

AutoBaSS  is an automated Backup & Sync System that enables users to backup a directory in another.

# Usage
If we want to backup `dir1` in `dir2`, we can do
```bash
./archive.sh dir1 dir2
```

We can mitigate the need to specify the diectories here and instead go with a good old
```bash
./archive.sh
```
This can only be done if we have the file `archive.conf` in the working directory, which must look like
```bash
SRC=dir1
TRG=dir1
```
