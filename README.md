Dieses Repository enthält Vorlagen für Artikel der Fachzeitschrift [Informationspraxis](http://informationspraxis.de/) sowie Konfigurationsdateien zur Konvertierung der Artikel mit [Pandoc](johnmacfarlane.net/pandoc/) nach HTML, PDF und EPUB.

## Vorlage

Die Vorlage für Artikel besteht aus zwei Dateien:

* Die Datei **vorlage-metadaten.yml** für die Metadaten des Artikels (Titel, Autor/in, Abstract...)
* Eine der folgenden Dateien für den Artikeltext:
    * **vorlage-markdown.md** zum Verfassen in Markdown-Syntax
    * **vorlage-word.docx** zum Verfassen mit Word
    * **vorlage-libreoffice.odt** zum Verfassen mit Libre/Open Offixe

## Redaktionelle Bearbeitung

1. Konvertierung des eingereichten Dokuments nach Markdown mit Hilfe von Pandoc:

    - von Format DOCX:

    ```
    pandoc --extract-media . -o erstautorin-yyyy-mm-dd.md erstautorin-yyyy-mm-dd.docx
    ```
    
    - von Format ODT:
    
    ```
    pandoc -o erstautorin-yyyy-mm-dd.md erstautorin-yyyy-mm-dd.odt
    ```
    
    - von Format DOC: Zunächst Konvertierung in DOCX, z.B. mit Word oder [http://cloudconvert.org](http://cloudconvert.org), dann Konvertierung mit Pandoc (s.o.)

2. Erstellung einer YAML-Datei `erstautorin-yyyy-mm-dd.yml` für die Metadaten entsprechend der Vorlage `vorlage-metadaten.yml`

3. Bearbeitung der Markdown-Datei `erstautorin-yyyy-mm-dd.md`

    - Titel, Abstract, Keywords, (Informationen über die) Autoren etc.
      gehören *ausschließlich* in die YAML-Datei

    - Sichtprüfung der Formatierung und ggf. Korrekturen nach [Pandoc-Markdown-Syntax](http://pandoc.org/MANUAL.html#pandocs-markdown)

## Konvertierung nach HTML, PDF und EPUB

1.  Erstellung der HTML-Version

	```
	pandoc -s --template pandoc-template.html -o erstautorin-yyyy-mm-dd.html erstautorin-yyyy-mm-dd.yml erstautorin-yyyy-mm-dd.md
	```

2. Erstellung der PDF-Version

	```
	pandoc -s --template pandoc-template.tex -V fontsize=12pt -V papersize=a4paper -V documentclass=article -V headheight=20mm -V headsep=10mm -V footskip=20mm -V top=30mm -V bottom=40mm -V left=25mm -V right=25mm -V graphics=1 -o erstautorin-yyyy-mm-dd.pdf erstautorin-yyyy-mm-dd.yml erstautorin-yyyy-mm-dd.md
	```

3. Erstellung der EPUB-Version

	```
	pandoc -s -o erstautorin-yyyy-mm-dd.epub erstautorin-yyyy-mm-dd.yml erstautorin-yyyy-mm-dd.md
	```
