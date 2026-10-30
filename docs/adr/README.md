# Architecture Decision Records (ADR)

Ein ADR hält **eine** Entscheidung über das Repo fest: Was wurde entschieden, warum, und welche Folgen hat das. So lässt sich später nachvollziehen, warum etwas so ist, wie es ist, auch wenn niemand mehr den ursprünglichen Call oder die Unterhaltung mit Claude im Kopf hat.

## Regeln

- Eine Datei pro Entscheidung: `NNNN-kurzer-titel.md` mit fortlaufender Nummer (`0001`, `0002`, …).
- ADRs werden nicht nachträglich umgeschrieben. Ändert sich eine Entscheidung, entsteht ein neuer ADR, und der alte bekommt den Status `Ersetzt durch NNNN`.
- Kurz halten: ein paar Sätze pro Abschnitt reichen.
- Neue ADRs in die Übersicht unten eintragen.

## Vorlage

```markdown
# NNNN: Titel der Entscheidung

- **Datum:** YYYY-MM-DD
- **Status:** Angenommen | Ersetzt durch NNNN

## Kontext

Welche Situation oder welches Problem hat die Entscheidung nötig gemacht?

## Entscheidung

Was wurde entschieden?

## Konsequenzen

Was folgt daraus, positiv wie negativ? Worauf muss man künftig achten?
```

## Übersicht

| Nr. | Titel | Status |
| --- | --- | --- |
| [0001](0001-repo-struktur.md) | Struktur des Repos | Angenommen |
