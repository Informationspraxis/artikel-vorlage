default: vorlage.pdf vorlage.html vorlage.docx

# Artikel-Vorlage für Pandoc (LaTeX und HTML)
TEMPLATE=informationspraxis-artikel-vorlage
LATEX_OPTIONS=--template $(TEMPLATE).tex
HTML_OPTIONS=--template $(TEMPLATE).html


# Einstellungen zum PDF-Seitenlayout.
# Grundlagen siehe <https://en.wikibooks.org/wiki/LaTeX/Page_Layout>
# und <http://johnmacfarlane.net/pandoc/demo/example9/templates.html>

LATEX_OPTIONS+=-V fontfamily=arev
LATEX_OPTIONS+=-V fontsize=12pt
LATEX_OPTIONS+=-V papersize=a4paper
LATEX_OPTIONS+=-V documentclass=article
LATEX_OPTIONS+=-V headheight=20mm -V headsep=10mm
LATEX_OPTIONS+=-V footskip=20mm
LATEX_OPTIONS+=-V top=30mm -V bottom=40mm -V left=25mm -V right=25mm
LATEX_OPTIONS+=-V endnotes=1
LATEX_OPTIONS+=-V lang=ngerman
LATEX_OPTIONS+=-V graphics=1


# Konvertierungsregeln von Markdown (Artikel) und YAML (Metadaten) nach HTML & PDF
.SUFFIXES: .md .html .tex .pdf .docx .odt
.PHONY: clean

.md.html:
	cat $(patsubst %.md,%.yml,$<) $< | pandoc -s -S -t html5 $(HTML_OPTIONS) -o $@ -

.md.tex:
	cat $(patsubst %.md,%.yml,$<) $< | pandoc -s -S $(LATEX_OPTIONS) -o $@ -

.md.pdf:
	cat $(patsubst %.md,%.yml,$<) $< | pandoc -s -S $(LATEX_OPTIONS) -o $@ -

.md.docx:
	cat $(patsubst %.md,%.yml,$<) $< | pandoc -s -S -o $@ -

clean:
	rm -f *.{log,aux,toc}

