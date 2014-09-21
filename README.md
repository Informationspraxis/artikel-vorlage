Dieses git-Repository enthält Vorlagen für Artikel der Fachzeitschrift
[Informationspraxis](http://informationspraxis.de/) sowie Skripte zur
Konvertierung der Artikel nach HTML und PDF.

# Verwendung der Vorlage zum Verfassen eigener Artikeln

Die Vorlage besteht aus zwei Dateien:

* Die Datei **vorlage.yml** für die Metadaten des Artikels
  (Titel, Autor, Abstract...)
* Eine der folgenden Dateien für den Artikeltext:
    * **vorlage.md** zum Verfassen in Markdown-Syntax
    * **vorlage.docx** zum Verfassen mit Word
    * **vorlage.odt** zum Verfassen mit Libre/Open Offixe

Die Verwendung anderer Dokumentformate (LaTeX, Google Docs etc.) ist ebenfalls
möglich, allerdings werden diese zunächst nach Markdown umgewandelt, wobei es
zu Fehlern kommen kann.

Bitte benennen Sie beide Dateien einheitlich um und behalten die Dateiendung
bei, beispielsweise

* vorlage.yml $\Rightarrow$ meinartikel.yml
* vorlage.docx $\Rightarrow$ meinartikel.docx

Bei Bedarf können Sie Ihre Artikel wie im Folgenden beschrieben nach HTML
und/oder PDF konvertieren, um das fertige Layout des Artikels zu überprüfen.

# Konvertierung nach HTML und PDF

Die Konvertierung benötigt das Program [Pandoc](johnmacfarlane.net/pandoc/)
sowie zur Erzeugung von PDF eine LaTeX-Umgebung und das Systemprogramm make.
Die Konvertierung nach HTML und PDF

## Vorbereitung

Pro Artikel muss eine Markdown-Datei mit dem Artikelinhalt (Dateieindung `.md`)
und eine YAML-Datei mit den Metadaten (Dateiendung `.yml`) angelegt werden. Die
Markdown-Datei kann beispielsweise mit durch Konvertierung aus dem DOCX-Format
(Word) mit Pandoc erstellt werden.

    pandoc meinartikel.docx -o meinartikel.md

Die YAML-Datei muss ggf. mit einem Texteditor angepasst werden.

## Konvertierung der Markdown-Datei

PDF- und HTML-Version können mit folgendem Aufruf auf der Kommandozeile
erstellt werden:

    make meinartikel.html
    make meinartikel.pdf

# Stand der Umsetzung

Unter einem Unix-System mit LaTeX und Pandoc lässt sich die Vorlage
folgendermaßen nach PDF, HTML, DOCX und ODT konvertieren:

    make

Die HTML-Version ist bislang noch nicht angepasst und die DOCX-Version enthält
(absichtlich) keine Metadaten sondern nur den Artikelinhalt.

