# KI Lab Calls

Willkommen! Hier sammeln wir die Mini-Projekte aus dem **KI Lab Call der Developer Akademie**, damit ihr sie nach dem Call in Ruhe nachvollziehen und selbst weiterüben könnt.

Die Schwerpunkte des Calls sind:

- **KI Automation Engineering:** Abläufe mit Tools wie n8n automatisieren, auch mit KI-Unterstützung.
- **Agentic Software Development:** Software gemeinsam mit KI-Agenten wie Claude Code entwickeln.

## Wo finde ich was?

| Ordner | Inhalt |
| --- | --- |
| [`call-documentations/`](call-documentations/) | Zusammenfassungen der einzelnen Calls, sortiert nach Datum |
| [`projekte-workflows/`](projekte-workflows/) | Die Projekte aus den Calls, ein Ordner pro Projekt mit eigener README |
| [`docs/`](docs/) | Hintergrundinfos zum Repo, z. B. [getroffene Entscheidungen](docs/adr/) |
| [`n8n/`](n8n/) | Konfiguration der lokalen n8n-Instanz aus dem Call |

## So steigst du ein

1. Lies die Zusammenfassung des Calls in [`call-documentations/`](call-documentations/). Dort stehen auch Links zu Videos und offiziellen Dokumentationen.
2. Öffne das passende Projekt in [`projekte-workflows/`](projekte-workflows/) und folge dessen README.
3. Bau das Projekt selbst nach und probiere eigene Varianten aus.

## n8n lokal nutzen

Für die n8n-Projekte brauchst du eine lokale n8n-Instanz. Am einfachsten geht das mit dem offiziellen One-Line-Setup ([Doku](https://docs.n8n.io/deploy/host-n8n/install-options/one-line-setup)). Voraussetzung ist Docker.

```bash
curl -fsSL https://get.n8n.io | sh
```

> [!IMPORTANT]
> Unter Windows funktioniert der Befehl nicht in der Eingabeaufforderung oder PowerShell. Nutzt stattdessen die Git Bash aus [Git für Windows](https://git-scm.com/downloads/win).

Eine Schritt-für-Schritt-Anleitung inklusive Video findest du in [Erste Schritte mit n8n](call-documentations/2026-10-29_erste-schritte-mit-n8n.md).
