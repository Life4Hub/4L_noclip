# 4L_noclip

Ein leichtgewichtiges NoClip-Skript für FiveM, entwickelt für Admins oder spezielle Spielergruppen mit Zugriff auf einen Flug-/Bewegungsmodus.

---

## ✨ Funktionen

- Aktivierung/Deaktivierung des NoClip-Modus per **Befehl** oder **Tastendruck**
- Standardmäßig mit `/noclip` oder **F17** aktivierbar
- Steuerung in alle Richtungen über WASD + Maus
- **Konfigurierbare Taste** in den GTA-Tastatureinstellungen unter _FünM_

---

## 🛠️ Installation

1. Lade das Repository oder die ZIP-Datei herunter.
2. Entpacke den Ordner `4L_noclip` in dein `resources`-Verzeichnis deines FiveM-Servers.
3. Füge folgende Zeile in deine `server.cfg` ein:

   ```
   ensure 4L_noclip
   ```

---

## 🎮 Nutzung

### Per Tastatur (Standard: F17)

- Drücke **F17**, um NoClip zu aktivieren oder deaktivieren.
- Die Taste kann in den **GTA-Tastatureinstellungen** angepasst werden:

  - ESC > Einstellungen > Tastaturbelegung > FünM > `Noclip Modus ein-/ausschalten`

### Per Befehl

Falls du das Skript mit einem Command triggerst:

```bash
/noclip
```

oder über ein Event:

```lua
TriggerEvent('4L_noclip:toggle')
```

---

## ⚙️ Konfiguration

- Die Fluggeschwindigkeit lässt sich direkt in der `client.lua` ändern:

  ```lua
  local baseSpeed = 2.5          -- Normale Fluggeschwindigkeit
  local turboMultiplier = 15.0   -- Geschwindigkeit bei Shift
  ```

- Die Sichtbarkeit und Unverwundbarkeit des Spielers ist standardmäßig aktiviert während NoClip.
- Mute via pma-voice ist integriert.

---

## 📦 Abhängigkeiten

- [pma-voice (optional)](https://github.com/AvarianKnight/pma-voice) – wird für automatische Stummschaltung verwendet (kann entfernt werden)

---

## 📄 Lizenz

Dieses Skript ist für private oder servergebundene Zwecke gedacht. Bitte kontaktiere uns bei Fragen oder Erweiterungswünschen.

---

## 🙋 Support

Fragen oder Probleme? Erstelle ein Issue oder kontaktiere das 4Life-Team direkt.
