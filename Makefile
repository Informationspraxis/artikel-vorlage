# Makefile for creating the galleys PDF, HTML, EPUB 
# of articles in Informationspraxis with Pandoc
# 
# You can creates either (1) all article galleys from all the docx and odt
# files in this directory, or (2) make a specific galley (recognized by
# the file ending) from a specific article only, or check all yaml files (3)
# (1) make
# (2) make article.pdf
# (3) make check
#

LUA_FILTERS := --lua-filter move-image-caption.lua \
               --lua-filter clean-images.lua \
               --lua-filter compact-lists.lua

SOURCE_DOCS := $(wildcard *.docx *.odt)
SOURCE_DOCS_NORMALIZED := $(SOURCE_DOCS:.odt=.docx)
EXPORTED=\
 $(SOURCE_DOCS_NORMALIZED:.docx=.md) \
 $(SOURCE_DOCS_NORMALIZED:.docx=.yml) \
 $(SOURCE_DOCS_NORMALIZED:.docx=.pdf) \
 $(SOURCE_DOCS_NORMALIZED:.docx=.html) \
 $(SOURCE_DOCS_NORMALIZED:.docx=.epub)

.PHONY: all
all : $(EXPORTED)

# Create Markdown file from either Microsoft or LibreOffice document
%.md: %.docx
	pandoc --extract-media . --wrap=none $(LUA_FILTERS) -t markdown-simple_tables -o $@ $^
%.md: %.odt
	pandoc --extract-media . --wrap=none $(LUA_FILTERS) -t markdown-simple_tables -o $@ $^

# Create YAML file with metadata
#
# TODO reconsider this option
#%.yml: %.xml
#	xsltproc xml-to-yaml.xslt $^ > $@
#
# alternative when there is no xml file
%.yml:
	cp vorlage-metadaten.yml $@

# Create all the ouput formats from the md files
%.html: %.md %.yml
	pandoc -s --toc --template pandoc-template.html -o $@ $^
%.pdf: %.md %.yml
	pandoc -s --toc --template pandoc-template.tex -V fontsize=12pt -V papersize=a4paper -V documentclass=article -V headheight=20mm -V headsep=10mm -V footskip=20mm -V top=30mm -V bottom=40mm -V left=25mm -V right=25mm -V graphics=1 -o $@ $^
%.epub: %.md %.yml
	pandoc -s --toc -o $@ $^

# For validating/checking all YAML files
.PHONY: check
check:
	yamllint *.yml

# For debugging
%.tex: %.md %.yml
	pandoc -s --toc --template pandoc-template.tex -V fontsize=12pt -V papersize=a4paper -V documentclass=article -V headheight=20mm -V headsep=10mm -V footskip=20mm -V top=30mm -V bottom=40mm -V left=25mm -V right=25mm -V graphics=1 -o $@ $^
%.native.txt: %.docx
	pandoc -s --extract-media . --wrap=none -t native -o $@ $^
%.native.txt: %.odt
	pandoc -s --extract-media . --wrap=none -t native -o $@ $^