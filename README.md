# Sign-Firmware

Dieses Projekt automatisiert den Signiervorgang für das ffmuc Manifest mithilfe von Docker und GitHub Actions.

## Überblick

Das ffmuc Manifest ist ein wesentlicher Bestandteil der Freifunk München (ffmuc) Firmware.   
Dieses Repository automatisiert den Signiervorgang für das Manifest mithilfe von Docker-Containern und GitHub Actions.

## Workflow

Das Signieren des ffmuc Manifests erfolgt in mehreren Schritten:

1. **GitHub Actions Workflow:** Ein GitHub Actions Workflow (`sign.yaml`) wird ausgelöst, wenn Änderungen am Code vorgenommen werden oder bei manueller Auslösung. Dieser Workflow führt den Signiervorgang aus.
   
2. **Docker-Build:** Ein Docker-Image wird erstellt, das die notwendige Umgebung für den Signiervorgang bereitstellt. Hierfür wird das Dockerfile im Repository verwendet.

3. **Signiervorgang:** Der Signiervorgang wird durch das Ausführen des `sign.sh` Skripts innerhalb des Docker-Containers durchgeführt. Dieses Skript signiert die ffmuc Manifestdateien für verschiedene Branches.

## Dateien

- `.github/workflows/sign.yaml`: Die GitHub Actions Workflow-Datei, die den Signiervorgang auslöst.
- `Dockerfile`: Dockerfile zur Erstellung des Docker-Images für den Signiervorgang.
- `sign.sh`: Das Signiervorgangs-Skript, das die ffmuc Manifestdateien signiert.

## Verwendung

Um dieses Projekt lokal auszuführen, stellen Sie sicher, dass Docker installiert ist. Führen Sie dann das `run.sh <privater_Schlüssel>` Skript aus, indem Sie es mit einem privaten Schlüssel als Argument aufrufen.

```bash
docker run --rm -it gluon:sign <privater_Schlüssel>
```

## Github Actions Worklow

Wichtig ist das in dem Repository Einstellungen unter secrets/actions ein Sceret mit dem Privaten Schlüssel namens: `PRIVATEKEY` angelegt ist.
