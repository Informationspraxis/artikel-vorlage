Dieses git-Repository enthält Vorlagen für Artikel der Fachzeitschrift
[Informationspraxis](http://informationspraxis.de/) sowie Skripte zur
Konvertierung der Artikel nach HTML und PDF.

Die Konvertierung benötigt das Program [Pandoc](johnmacfarlane.net/pandoc/).

Der Inhalt der Vorlage befindet sich in Markdown-Syntax in der Datei
`vorlage.md` und die dazugehörigen Metadaten in der Datei `vorlage.yml`.

Unter einem Unix-System mit LaTeX und Pandoc lässt sich die Vorlage
folgendermaßen nach HTML und PDF konvertieren:

    make vorlage.html vorlage.pdf

