# INC-001 — G500 Boot / Storage Instability

Date: 2026-08-10

The Lenovo G500 became difficult to start and showed a dark-screen/boot symptom. Investigation included journalctl, SMART data, ATA power-state messages, temperature checks, power cycling and RAM reseating.

The exact root cause was not conclusively isolated.

Lesson: separate hardware/POST, RAM, storage/controller, OS/filesystem and application failures instead of assuming every problem is software.
