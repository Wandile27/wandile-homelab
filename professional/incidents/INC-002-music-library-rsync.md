# INC-002 — Music Library rsync

Date: 2026-08-11

Command used:
```bash
rsync -rh --progress Music/ /mnt/storage/media
```

The intended directory structure was misunderstood. Because `Music/` means the contents of Music, the destination received the contents rather than a new `Music` directory. This produced a mixed/duplicate library.

Observed server library:
- 277 audio files
- 2.58 GB

ADATA audits showed multiple historical music collections, including one checked collection of 885 files / 9.85 GB and a broader search of 1251 files / 13.64 GB.

Lesson:
```bash
rsync -aHn --itemize-changes SOURCE/ DEST/
```
Use a dry run first. Establish the authoritative source before rebuilding the destination.
