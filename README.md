<h1 align="center">AutoBaSS</h1>

> <sub>This repo is part of an assignment for CSE 337 at Stony Brook University</sub>

AutoBaSS  is an automated Backup & Sync System that enables users to backup a directory in another.

# Usage
If we want to backup `dir1` in `dir2`, we can do
```bash
./archive.sh dir1 dir2
```

This creates a compressed `tar.gz` file in dir2 that, when decompressed, replicates everything included in the directory.
