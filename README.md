## Key since

| User   | stable | next | legacy |
|----------|:-------------:|:-------------:|:-------------:|
| [T0biii](https://github.com/T0biii) |  [v2024.3.2](https://github.com/freifunkMUC/site-ffm/releases/tag/v2024.3.2) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/eb63083cafcae93431fd8b0f28fdcba0aca837f3) [(pr-385)](https://github.com/freifunkMUC/site-ffm/pull/385)  | [v2024.3.2-next](https://github.com/freifunkMUC/site-ffm/releases/tag/v2024.3.2-next) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/c82d1807ab74c9c0fa329971a7f78f5b60cd7c99) [(pr-386)](https://github.com/freifunkMUC/site-ffm/pull/386) | [untagged Version / no current release](https://github.com/freifunkMUC/site-ffm/commit/a31e3714f5e75602f8b32566dcda9eaf5e01b6df) [(pr-387)](https://github.com/freifunkMUC/site-ffm/pull/387) |
| [ff_mgk](https://github.com/ff-mgk) | [v2023.11.4](https://github.com/freifunkMUC/site-ffm/releases/tag/v2023.11.4) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/91384fc7ba41c6eb826ba60234145a2f01ab0b83) [(pr-331)](https://github.com/freifunkMUC/site-ffm/pull/331) | [v2023.12.1-next](https://github.com/freifunkMUC/site-ffm/releases/tag/v2023.12.1-next) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/a4a58e618447c3ffca40ce75ab65c8effb34d7f6) [(pr-332)](https://github.com/freifunkMUC/site-ffm/pull/332) | [untagged Version](https://github.com/freifunkMUC/site-ffm/commit/6915b488949d11ea9f5532f6370b34f4eb273066) [(pr-333)](https://github.com/freifunkMUC/site-ffm/pull/333) |
| [grische](https://github.com/grische)   | [v2022.10.1](https://github.com/freifunkMUC/site-ffm/releases/tag/v2022.10.1) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/becefce8194edea91eca52aafff213a910631ee0) [(pr-201)](https://github.com/freifunkMUC/site-ffm/pull/201) | [release unkown](https://github.com/freifunkMUC/site-ffm/next) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/26f72aab2e3fa9612c86ef6f9589fff180f0833c) [(pr-202)](https://github.com/freifunkMUC/site-ffm/pull/202) | legacy |
| [thegoliath](https://github.com/GoliathLabs)    | [v2022.2.1](https://github.com/freifunkMUC/site-ffm/releases/tag/v2022.2.1) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/b766bc6011a300f0bacea2b8479d80c3601624c2) [(pr-166)](https://github.com/freifunkMUC/site-ffm/pull/166) | [release unkown](https://github.com/freifunkMUC/site-ffm/next) [(commit)](https://github.com/freifunkMUC/site-ffm/commit/f5869c20cda126fb8e0e87517846b3a79703d779) [(pr-215)](https://github.com/freifunkMUC/site-ffm/pull/215) | legacy |
| User   | stable | next | legacy |



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

