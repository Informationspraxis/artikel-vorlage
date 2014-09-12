.SUFFIXES: .md .html .tex .pdf

LATEX_OPTIONS=--template pandoc-artikel-template.tex 
HTML_OPTIONS=--template pandoc-artikel-template.html

# PDF-Seitenlayout
# Siehe <https://en.wikibooks.org/wiki/LaTeX/Page_Layout>
# und <http://johnmacfarlane.net/pandoc/demo/example9/templates.html>

LATEX_OPTIONS+=-V fontfamily=arev
LATEX_OPTIONS+=-V fontsize=12pt
LATEX_OPTIONS+=-V papersize=a4paper
LATEX_OPTIONS+=-V documentclass=article
LATEX_OPTIONS+=-V headheight=0.8cm
LATEX_OPTIONS+=-V top=2cm -V bottom=2cm -V left=2cm -V right=2cm

.md.html:
	pandoc -s -S -t html5 $(HTML_OPTIONS) -o $@ $<

.md.tex:
	pandoc -s -S -t latex $(LATEX_OPTIONS) -o $@ $<

.md.pdf:
	pandoc -s -S $(LATEX_OPTIONS) -o $@ $<
