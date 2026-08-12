# Troubleshooting Method

1. Define the symptom.
2. Collect evidence.
3. Isolate the layer.
4. Change one thing.
5. Verify.
6. Document.
7. Add prevention.

Typical layers:
```text
hardware -> OS -> filesystem -> network -> Docker -> dependency -> application
```

Real incidents in this lab include G500 hardware/storage instability, Nextcloud encrypted-storage recovery, Caddy/network experiments and the music-library rsync mistake.
