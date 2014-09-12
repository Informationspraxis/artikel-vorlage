.SUFFIXES: .md .html .tex .pdf

LATEX_OPTIONS=--template pandoc-artikel-template.tex 
HTML_OPTIONS=--template pandoc-artikel-template.html

.md.html:
	pandoc -s -S -t html5 $(HTML_OPTIONS) -o $@ $<

.md.tex:
	pandoc -s -S -t latex $(LATEX_OPTIONS) -o $@ $<

.md.pdf:
	pandoc -s -S $(LATEX_OPTIONS) -o $@ $<
