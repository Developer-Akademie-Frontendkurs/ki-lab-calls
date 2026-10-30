# 0001: Struktur des Repos

- **Datum:** 2026-10-30
- **Status:** Angenommen

## Kontext

Im KI Lab Call der Developer Akademie entstehen regelmäßig kleine Projekte. Teilnehmer sollen sie nach dem Call nachvollziehen und selbst weiterüben können. Dafür braucht es eine feste Ablage, in der Call-Inhalte, Projekte und Hintergrundinfos zum Repo getrennt auffindbar sind.

## Entscheidung

- `call-documentations/` enthält eine Datei pro Call, benannt nach `YYYY-MM-DD_kurzer-titel.md`.
- `projekte-workflows/` enthält einen Unterordner pro Projekt, jeweils mit einer `README.md`. Was sonst im Ordner liegt, hängt vom Projekt ab und wird bewusst nicht vorgegeben.
- `docs/` enthält Dokumentation über das Repo selbst. Entscheidungen werden als ADR in `docs/adr/` festgehalten.
- `n8n/` enthält die lokale n8n-Instanz aus dem offiziellen One-Line-Setup. Die `.env` mit den Secrets wird nicht versioniert.
- Inhalte werden auf Deutsch geschrieben, weil die Zielgruppe deutschsprachig ist.

## Konsequenzen

- Neue Projekte brauchen mindestens einen eigenen Ordner mit `README.md`. Darüber hinaus können sie frei aufgebaut sein.
- Teilnehmer müssen ihre eigene `n8n/.env` erzeugen, z. B. über das One-Line-Setup. Sie wird nicht mitgeliefert.
