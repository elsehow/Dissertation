# this is forked from npdoty
# https://github.com/npdoty/dissertation

# much has been removed from his version
# so, if doing something fancy, consult with that first

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

BIB = bib/lib.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = bib/apa.csl

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)

all:	$(PDFS) $(HTML)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)

BUNDLE_MARKDOWN = bundledown src/index.md -o dist/bundle.md 

PANDOC_MARKDOWN = pandoc dist/bundle.md -f markdown

%.html:	%.md
	$(BUNDLE_MARKDOWN) && $(PANDOC_MARKDOWN) -f markdown -t html -s -o dist/index.html --bibliography=$(BIB) --csl=$(CSL)

%.pdf:	%.md
	$(BUNDLE_MARKDOWN) && $(PANDOC_MARKDOWN) -f markdown -t latex -s -o dist/dissertation.pdf --bibliography=$(BIB) --csl=$(CSL)
	
watch:	
	node tools/watch.js

#references:
#	#cp $(MENDELEY_BIB) $(BIB)
#	biber $(BIB) --tool biber.conf
#	mv library_bibertool.bib $(BIB)

clean:
	rm -f dist/*
