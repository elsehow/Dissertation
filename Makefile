# this is forked from npdoty
# https://github.com/npdoty/dissertation

# much has been removed from his version
# so, if doing something fancy, consult with that first

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

BIB = library.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
#CSL = apsa

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)

all:	$(PDFS) $(HTML)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)


%.html:	%.md
	pandoc src/index.md -f markdown -t html -s -o dist/dissertation.html --bibliography=$(BIB)

%.pdf:	%.md
	pandoc src/index.md -f markdown -t latex -s -o dist/dissertation.pdf --bibliography=$(BIB)
	

#references:
#	#cp $(MENDELEY_BIB) $(BIB)
#	biber $(BIB) --tool biber.conf
#	mv library_bibertool.bib $(BIB)

clean:
	rm -f *.html *.pdf *.tex
	rm -f *.aux *.bcf *.out *.log *.run.xml *.blg
#	rm library_bibertool.bib
