Dieses git-Repository enthält Vorlagen für Artikel der Fachzeitschrift
[Informationspraxis](http://informationspraxis.de/) sowie Skripte zur
Konvertierung der Artikel nach HTML und PDF.

Die Konvertierung benötigt das Program [Pandoc](johnmacfarlane.net/pandoc/)
sowie zur Erzeugung von PDF eine LaTeX-Umgebung und GNU make.

Der Inhalt der Vorlage befindet sich in Markdown-Syntax in der Datei

* `vorlage.md`

und die dazugehörigen Metadaten in der Datei 

* `vorlage.yml`

Unter einem Unix-System mit LaTeX und Pandoc lässt sich die Vorlage
folgendermaßen nach PDF, HTML und DOCX konvertieren:

    make

Die HTML-Version ist bislang noch nicht angepasst und die DOCX-Version enthält
(absichtlich) keine Metadaten sondern nur den Artikelinhalt.

# Anleitung

Pro Artikel muss eine Markdown-Datei mit dem Artikelinhalt (Dateieindung `.md`)
und eine YAML-Datei mit den Metadaten (Dateiendung `.yml`) angelegt werden. Die
Markdown-Datei kann beispielsweise mit durch Konvertierung aus dem DOCX-Format
(Word) mit Pandoc erstellt werden.

    pandoc -o artikel.md artikel.docx

Die YAML-Datei muss mit einem Texteditor angepasst werden. Anschließend können
PDF- und HTML-Version folgendermaßen erstellt werden:

    make artikel.pdf artikel.html

