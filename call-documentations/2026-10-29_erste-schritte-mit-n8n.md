# Erste Schritte mit n8n

## Was ist n8n überhaupt

n8n (ausgesprochen „n-eight-n“, kurz für „nodemation“) ist ein Tool zur **Workflow-Automatisierung**. Man verbindet damit verschiedene Apps, APIs und Dienste und automatisiert Abläufe zwischen ihnen, ähnlich wie bei Zapier oder Make.

**Funktionsweise:** Workflows werden in einem visuellen Editor aus sogenannten *Nodes* zusammengesetzt. Jeder Node übernimmt eine Aufgabe: einen Trigger auslösen (z. B. Webhook, Zeitplan, neue E-Mail), Daten von einer API holen, Daten transformieren, Bedingungen prüfen oder etwas in ein anderes System schreiben. Die Daten fließen als JSON von Node zu Node.

**Besonderheiten gegenüber Zapier und Make:**

- **Self-Hosting möglich:** n8n kann per Docker auf dem eigenen Server laufen. Dadurch bleiben die Daten bei einem selbst, und es entstehen keine Kosten pro ausgeführtem Task. Alternativ gibt es eine gehostete Cloud-Version.
- **Fair-Code-Lizenz:** Der Quellcode ist offen einsehbar und für den Eigengebrauch frei nutzbar. Es ist aber keine klassische Open-Source-Lizenz, weil die kommerzielle Weitervermarktung eingeschränkt ist.
- **Code, wo nötig:** Neben dem Low-Code-Ansatz gibt es Code-Nodes für JavaScript und Python sowie einen generischen HTTP-Request-Node für jede beliebige API.
- **Viele Integrationen:** Es gibt Hunderte fertige Nodes für Google, Slack, HubSpot, Postgres, Notion und viele weitere Dienste.
- **KI-Funktionen:** n8n hat eigene AI-Nodes, die auf LangChain basieren. Damit lassen sich zum Beispiel LLM-Agenten, Chatbots oder RAG-Pipelines mit Vektordatenbanken wie Qdrant oder Pinecone bauen.

**Typische Anwendungsfälle:** Daten zwischen CRM und anderen Tools synchronisieren, Benachrichtigungen verschicken, Berichte erstellen, Formulareingaben verarbeiten, Dokumente mit LLMs auswerten oder interne Prozesse automatisieren.

Kurz gesagt ist n8n ein flexibles, entwicklerfreundliches Automatisierungstool, das man selbst betreiben und bei Bedarf mit eigenem Code erweitern kann.

## Wie kann man n8n lokal nutzen?

In unserem Call haben wir eine sehr komplexe Möglichkeit n8n lokal zu nutzen verwendet. In dem Video wird eine sehr simple Methode angewand, die zur lokalen Nutzung völlig ausreicht.

[n8n lokal installieren](https://www.loom.com/share/9d63178f722443028047fa4a3e082ca9)

In dem Video zeige ich das "One-Line-Setup" von n8n

[Link zur offiziellen Dokumentation](https://docs.n8n.io/deploy/host-n8n/install-options/one-line-setup)

### n8n lokal installieren (wie im Video gezeigt)

> [!IMPORTANT] Wichtig für Windows Nutzer
>[n8n lokal unter Windows nutzen](https://docs.n8n.io/deploy/host-n8n/install-options/one-line-setup#windows-users)
>
> Der einzeilige Einrichtungsbefehl erfordert ein Terminal, das Shell-Skripte versteht,
> was bei der standardmäßigen Windows-Eingabeaufforderung oder PowerShell nicht der Fall ist.
>
> Mit der Installation von `Git für Windows` [Download](https://git-scm.com/downloads/win) steht auch die git-bash Command Line zur Verfügung.
>
> **Ist Git auf eurem PC bereits installiert, muss natürlich keine erneute Installation durchgeführt werden**
>
> Nach jetzigem Kenntnisstand funktiont diese Lösung problemlos.

#### Command zur lokalen Installation:**

```bash
curl -fsSL https://get.n8n.io | sh
```

#### n8n starten

Der Flag `-d` startet n8n im Hintergrund. Möchte man das Log sehen, kann dieser Flag einfach weggelassen werden.

```bash
docker compose -f ./n8n/compose.yml up -d
```

#### n8n beenden

```bash
docker compose -f ./n8n/compose.yml down
```

Weitere [everyday commands](https://docs.n8n.io/deploy/host-n8n/install-options/one-line-setup#everyday-commands)

## Ausblick

> [!NOTE] Ausblick
> Der Ausblick versteht sich unter Vorbehalt. Hier können immer Anpassungen vorgenommen werden.
>
> Eine genau zwischen den begleitenden Mentoren (Tobias und Oliver) wird noch vorgenommen.

Derzeit sind von Oliver folgende "Projekte" geplant

- **Unser erster Workflow**
  - > [!NOTE] User Story
    > *Purpose*: Die Kaffeerösterei "Schönröst" möchte zukünftig ein Kaffee-Abo anbieten. Um potentielle Kunden zu gewinnen sollen an Interessierte Probiersets versendet werden.
    >
    > *Beschreibung*: Damit die Probiersets an potententielle versendet werden können sollen die benötigten Daten über ein von n8n bereigestelltes Formular in ein Google Sheet übertragen werden. Folgende Daten werden benötigt:
    >
    > - *Vorname
    > - *Nachname
    > - *Straße
    > - *Hausnummer
    > - *Postleitzahl
    > - *Ort
    > - Telefonnummer
    > - *E-Mail
  - noch ohne KI
  - ein von n8n erzeugtes Formular wird ausgefühlt
  - die Daten werden in ein Google Sheet eingetragen
    - Anlegen einer Google App
    - Authentifizierung von n8n bei Google

- **Sentiment Analyse**
  - > [!NOTE] User Story
    > *Purpose*: Zur Auswertung der Versandaktion der Probiersets für das neue Kaffee-Abo sollen alle Kunden nachträglich zu ihrer Meinung befragt werden.
    >
    > *Beschreibung*: Nach 10 Tagen wird eine E-Mail an die Kunden versand, mit einem Link um ein Review zum Probierset zu hinterlassen. (E-Mail Versand nicht Teil der Story). Aus den übermittelten Texten soll ermittelt werden, ob der Kunde das Angebot positiv, neutral oder negativ bewertet. Das Ergebnis soll in einem Google Sheet festgehalten werden.
