# Unser erster Workflow

- [Lösung des Problems aus dem Call](#l%C3%B6sung-des-problems-aus-dem-call)
- [Die Aufgabe](#die-aufgabe)
- [Zwischenstand aus dem Call](#zwischenstand-aus-dem-call)
- [So baust du den Workflow](#so-baust-du-den-workflow)
  - [1. Neuen Workflow anlegen](#1-neuen-workflow-anlegen)
  - [2. Formular mit dem Form Trigger erstellen](#2-formular-mit-dem-form-trigger-erstellen)
  - [3. Google Sheet vorbereiten](#3-google-sheet-vorbereiten)
  - [4. n8n bei Google anmelden](#4-n8n-bei-google-anmelden)
  - [5. Google Sheets Node anhängen](#5-google-sheets-node-anh%C3%A4ngen)
  - [6. Testen und aktivieren](#6-testen-und-aktivieren)

## Lösung des Problems aus dem Call

[Loom zur Lösung](https://www.loom.com/share/51dd0fbca235496498da9d77aa764b51)

## Die Aufgabe

> [!NOTE] User Story
> *Purpose*: Die Kaffeerösterei "Schönröst" möchte zukünftig ein Kaffee-Abo anbieten. Um potentielle Kunden zu gewinnen, sollen an Interessierte Probiersets versendet werden.
>
> *Beschreibung*: Damit die Probiersets an potentielle Kunden versendet werden können, sollen die benötigten Daten über ein von n8n bereitgestelltes Formular in ein Google Sheet übertragen werden. Folgende Daten werden benötigt (\* = Pflichtfeld):
>
> - \*Vorname
> - \*Nachname
> - \*Straße
> - \*Hausnummer
> - \*Postleitzahl
> - \*Ort
> - Telefonnummer
> - \*E-Mail

Der Workflow kommt noch **ohne KI** aus. Er besteht nur aus zwei Nodes:

```text
[Form Trigger] ──► [Google Sheets: Append row]
```

## Zwischenstand aus dem Call

Den Stand, mit dem wir den Call beendet haben, findest du im Projektordner:

[`projekte-workflows/001_unser-erser-workflow/`](../projekte-workflows/001_unser-erser-workflow/)

Dort liegt der Workflow als JSON-Export. Bisher enthalten:

- Der **Form Trigger** mit allen acht Feldern (Pflichtfelder sind noch nicht markiert).
- Der **Google Sheets Node** mit der Operation *Append row* und hinterlegten Google-Zugangsdaten.
- **Noch offen:** Die beiden Nodes sind noch nicht verbunden, und im Google Sheets Node sind noch kein Dokument und kein Tabellenblatt ausgewählt.

**So importierst du den Zwischenstand:** Öffne in n8n einen neuen, leeren Workflow, klicke oben rechts auf das Menü `...` und wähle **Import from File**. Alternativ kannst du den Inhalt der JSON-Datei kopieren und mit `Strg+V` / `Cmd+V` direkt in den Editor einfügen.

> [!IMPORTANT]
> Die Google-Zugangsdaten werden beim Import **nicht** mitgeliefert. Du musst sie wie in [Schritt 4](#4-n8n-bei-google-anmelden) beschrieben selbst anlegen.

## So baust du den Workflow

### 1. Neuen Workflow anlegen

Starte deine lokale n8n-Instanz (siehe [Erste Schritte mit n8n](2026-10-29_erste-schritte-mit-n8n.md#n8n-starten)) und öffne `http://localhost:5678`. Lege über **Create Workflow** einen neuen Workflow an und gib ihm einen sprechenden Namen, z. B. `Schönröst Probierset`.

### 2. Formular mit dem Form Trigger erstellen

1. Klicke auf **Add first step** und suche nach **On form submission** (Form Trigger).
2. Vergib einen **Form Title** (z. B. `Probierset`) und eine kurze **Form Description**.
3. Lege unter **Form Elements** für jedes Feld aus der User Story ein Element an. Wähle passende Typen (z. B. `Email` für die E-Mail-Adresse, `Number` oder `Text` für die Postleitzahl).
4. Aktiviere bei allen Pflichtfeldern die Option **Required Field**.
5. Über **Test URL** öffnet sich das Formular im Browser. Fülle es einmal aus, damit n8n Beispieldaten für die nächsten Schritte hat.

### 3. Google Sheet vorbereiten

Lege in Google Drive ein neues Google Sheet an. Trage in die **erste Zeile** die Spaltenüberschriften ein, am besten genauso benannt wie die Formularfelder (`Vorname`, `Nachname`, `Straße`, ...). Dann kann n8n die Felder später automatisch zuordnen.

### 4. n8n bei Google anmelden

Damit n8n in dein Google Sheet schreiben darf, braucht es eine **Google App** (OAuth-Client) in der Google Cloud Console:

1. In der [Google Cloud Console](https://console.cloud.google.com/) ein neues Projekt anlegen.
2. Unter **APIs & Services → Library** die **Google Sheets API** und die **Google Drive API** aktivieren.
3. Den **OAuth consent screen** einrichten (User Type *External*) und dich selbst als **Test User** eintragen.
4. Unter **Credentials → Create Credentials → OAuth client ID** einen Client vom Typ *Web application* anlegen. Als **Authorized redirect URI** die URL eintragen, die n8n im Credential-Dialog anzeigt (lokal: `http://localhost:5678/rest/oauth2-credential/callback`).
5. In n8n beim Google Sheets Node ein neues Credential anlegen, **Client ID** und **Client Secret** einfügen und auf **Sign in with Google** klicken.

Ausführliche Anleitung: [Google OAuth2 in n8n (offizielle Doku)](https://docs.n8n.io/integrations/builtin/credentials/google/oauth-single-service/)

### 5. Google Sheets Node anhängen

1. Klicke im Form Trigger auf das `+` und füge den Node **Google Sheets → Append row in sheet** hinzu. Dadurch sind beide Nodes direkt verbunden.
2. Wähle dein Credential, das **Document** und das **Sheet** aus.
3. Bei **Mapping Column Mode** reicht *Map Automatically*, wenn die Spaltenüberschriften genau wie die Formularfelder heißen. Andernfalls mit *Map Each Column Manually* die Felder per Drag & Drop zuordnen.

### 6. Testen und aktivieren

1. Klicke auf **Execute workflow** und fülle das Testformular aus. Im Google Sheet sollte eine neue Zeile erscheinen.
2. Klappt alles, speicherst du den Workflow und veröffentlichst ihn oben rechts über **Publish** (in älteren n8n-Versionen der Schalter **Active**). Ab jetzt ist das Formular unter der **Production URL** erreichbar.

> [!TIP] Zum Weiterüben
> Prüfe, was passiert, wenn ein Pflichtfeld leer bleibt oder eine ungültige E-Mail eingegeben wird. Ergänze eine Spalte mit dem Zeitpunkt der Anmeldung (`submittedAt` aus den Formulardaten).
