# Backup & Disaster Recovery

A backup is not complete until restoration is tested.

## Priority
High:
- Nextcloud data
- databases
- Compose/configuration
- important scripts
- Git repository

Replaceable:
- Docker images
- caches
- re-downloadable media

## Required backup record
```text
Source
Destination
Schedule
Retention
Verification
Restore test
```

The intended model is live application data on fast storage with separate backup storage on the HDD.

A future restore test should restore a known backup into a temporary location and verify both files and database/application integrity.
