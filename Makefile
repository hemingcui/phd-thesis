SRC = thesis
FILES = $(SRC).lot $(SRC).lof $(SRC).out $(SRC).toc $(SRC).bbl \
	$(SRC).aux $(SRC).blg $(SRC).dvi *.log $(SRC).ps $(SRC).pdf *~
export TEXINPUTS=$(PWD)/tern:$(PWD)/peregrine:$(PWD)/parrot:.:

all:: bbl texts

texts: *.tex bib/biblio.bib tern/*.tex peregrine/*.tex parrot/*.tex mc/*.tex bugs/*.tex
	dvipdf $(SRC).dvi >> $(SRC).build.log 2>&1
	dvips -o $(SRC).ps -t letter $(SRC).dvi >> $(SRC).build.log 2>&1

bbl:
	rm -rf $(SRC).bbl
	latex  $(SRC) 2>&1 > $(SRC).build.log
	bibtex  $(SRC) 2>&1 >> $(SRC).build.log
	latex  $(SRC) 2>&1 >> $(SRC).build.log
	latex  $(SRC) 2>&1 >> $(SRC).build.log

clean:
	rm -f $(FILES)
