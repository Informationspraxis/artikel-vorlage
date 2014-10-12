Wenn der Artikel bereits im Markdown-Format vorhanden ist, beginne mit Schritt
3.

1. Umbenennung der Datei nach dem Schema `erstautorin-yyyy-mm-dd.xxx` wobei
   `erstautorin` der Nachname der Erstautorin oder des Erstautors in
   Kleinbuchstaben, `yyyy-mm-dd` das Datum der Einreichung und `xxx` die
   Dateiendung ist.

2. Falls es sich nicht bereits um eine DOCX-Datei handelt (Dateiendung `docx`),
   Konvertierung in dieses Format, z.B. mit Word oder http://cloudconvert.org/

3. Konvertierung der DOCX-Datei nach Markdown mit Hilfe von Pandoc:

    ```
    pandoc -o erstautorin-yyyy-mm-dd.md erstautorin-yyyy-mm-dd.docx
    ```

4. Erstellung einer YAML-Datei `erstautorin-yyyy-mm-dd.yml` für die Metadaten
   entsprechend der Vorlage `vorlage.yml` und Bearbeitung der Markdown-Datei 
   `erstautorin-yyyy-mm-dd.md` mit einem Texteditor:

    - Titel, Abstract, Keywords, (Informationen über die) Autoren etc.
      gehören *nur* in die YAML-Datei

    - ...

5.  Sicherstellen, dass sich die Datei `ip-logo.png` im aktuellen Verzeichnis
    befindet.

6.  Erstellung der HTML- und PDF-Version

    - ....(ausführlichere Anleitung folgt)...

