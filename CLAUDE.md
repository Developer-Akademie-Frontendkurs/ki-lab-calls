# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Zweck des Repos

Sammlung der "Mini-Projekte", die im **KI Lab Call der Developer Akademie** erarbeitet und besprochen werden. Teilnehmer nutzen das Repo zum Nachvollziehen und Weiterüben. Themenschwerpunkte: **KI Automation Engineering** (aktuell n8n) und **Agentic Software Development**.

Zielgruppe sind Lernende: Inhalte werden auf **Deutsch** verfasst, didaktisch und Schritt für Schritt nachvollziehbar. Mentoren der Calls sind Tobias und Oliver.

## Struktur

- `call-documentations/`: Zusammenfassungen und Infos zu einzelnen Calls. Dateinamen nach dem Schema `YYYY-MM-DD_kurzer-titel.md` (Datum des Calls).
- `projekte-workflows/`: Die im Call erarbeiteten Projekte. **Ein Unterordner pro Projekt, jeweils mit `README.md`.** Weiterer Inhalt ist je nach Projekt unterschiedlich und bewusst nicht vorgegeben.
- `docs/`: Interne Dokumentation über das Repo selbst, **nur lokal** (per `.gitignore` ausgeschlossen, nicht im Remote-Repo). Entscheidungen werden als ADR in `docs/adr/` festgehalten (Vorlage und Übersicht in `docs/adr/README.md`). Bei neuen Entscheidungen einen neuen ADR anlegen und in die Übersicht eintragen, bestehende ADRs nicht umschreiben. Da Teilnehmer `docs/` nicht sehen, aus `README.md` und anderen versionierten Dateien nicht darauf verlinken.
- `README.md`: Einstiegsseite für Teilnehmer. Bei neuen Ordnern oder geändertem Einstieg mitpflegen.
- `n8n/`: Lokale n8n-Instanz, erzeugt vom offiziellen One-Line-Setup (`curl -fsSL https://get.n8n.io | sh`, Script `get-n8n.sh`).

## Lokale n8n-Instanz

```bash
docker compose -f ./n8n/compose.yml up -d   # starten (ohne -d mit Log-Ausgabe)
docker compose -f ./n8n/compose.yml down    # beenden
docker compose -f ./n8n/compose.yml logs -f n8n
```

n8n ist danach unter `http://localhost:5678` erreichbar (einziger nach außen veröffentlichter Port).

Aufbau des Compose-Stacks (`n8n/compose.yml`):
- `n8n`: Editor/Engine, Daten im Volume `n8n-data`.
- `runners`: führt Code-Node-Code (JS/Python) getrennt aus, verbunden über den Task-Broker `n8n:5679`.
- `sandbox-certs` → `sandbox-api` → `sandbox-runner-1`: Sandbox-Service für den n8n-KI-Assistenten (mTLS-Zertifikate im Volume `sandbox-tls`, Runner läuft privilegiert als Docker-in-Docker).
- `searxng`: Websuche für den KI-Assistenten, konfiguriert über `n8n/searxng-settings.yml` (JSON-Format muss aktiviert bleiben).

`n8n/.env` enthält die generierten Secrets und Versionen (`N8N_VERSION`, `N8N_SANDBOX_VERSION`) und ist per `.gitignore` ausgeschlossen. Paarweise Secrets (z. B. `SANDBOX_API_KEYS` / `N8N_SANDBOX_SERVICE_API_KEY`) müssen übereinstimmen. Upgrades laufen über `get-n8n.sh --upgrade`, nicht durch manuelles Editieren der Image-Tags.

In den Call-Dokumentationen wird Teilnehmern bewusst das einfache One-Line-Setup empfohlen; Windows-Nutzer brauchen dafür Git Bash.
