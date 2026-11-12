# 001 – Unser erster Workflow

Ein Formular für Probiersets der Kaffeerösterei "Schönröst": Interessierte tragen ihre Adresse in ein n8n-Formular ein, und n8n schreibt die Daten automatisch in ein Google Sheet. Der Workflow kommt noch **ohne KI** aus.

```text
[Form Trigger] ──► [Google Sheets: Append row]
```

Die vollständige Aufgabe (User Story) und die Schritt-für-Schritt-Anleitung findest du in der Call-Dokumentation:
[Unser erster Workflow (Call vom 12.11.2026)](../../call-documentations/2026-11-12_unser-erster-workflow.md)

## Inhalt des Ordners

| Datei | Inhalt |
| --- | --- |
| [`2026-11-12_unser-erster-workflow.json`](2026-11-12_unser-erster-workflow.json) | Zwischenstand des Workflows am Ende des Calls vom 12.11.2026 (n8n-Export) |

## Stand

- [x] Form Trigger mit allen acht Feldern angelegt
- [x] Google Sheets Node (*Append row in sheet*) hinzugefügt
- [x] Google-Zugangsdaten (OAuth) in n8n angelegt
- [ ] Pflichtfelder im Formular markieren
- [ ] Form Trigger und Google Sheets Node verbinden
- [ ] Google Sheet und Tabellenblatt im Node auswählen, Spalten zuordnen
- [ ] Workflow testen und veröffentlichen

## Workflow importieren

1. Lokale n8n-Instanz starten (siehe [Erste Schritte mit n8n](../../call-documentations/2026-10-29_erste-schritte-mit-n8n.md#n8n-starten)) und `http://localhost:5678` öffnen.
2. Einen neuen, leeren Workflow anlegen.
3. Oben rechts im Menü `...` den Punkt **Import from File** wählen und die JSON-Datei aus diesem Ordner auswählen.
   Alternativ: Inhalt der JSON-Datei kopieren und mit `Strg+V` / `Cmd+V` in den Editor einfügen.

> [!IMPORTANT]
> Die Google-Zugangsdaten sind **nicht** im Export enthalten. Lege im Google Sheets Node dein eigenes Credential an. Wie das geht, steht in der [Call-Dokumentation](../../call-documentations/2026-11-12_unser-erster-workflow.md#4-n8n-bei-google-anmelden).
