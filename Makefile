.PHONY: all clean

all: bibliography.pdf

bibliography.pdf: bibliography.tex bibliography.bib
	LANG= latexmk -lualatex -bibtex bibliography.tex

clean:
	latexmk -C
	rm -f *.bbl *.run.xml *.lol *.ist
