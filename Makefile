.PHONY: all clean

all: bibliography.pdf

%.pdf: %.tex
	LANG= latexmk -lualatex -bibtex $<

clean:
	latexmk -C
	rm -f *.bbl *.run.xml *.lol *.ist
