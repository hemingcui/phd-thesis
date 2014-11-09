SRC = thesis
FILES = $(SRC).toc $(SRC).bbl $(SRC).aux $(SRC).blg $(SRC).dvi *.log $(SRC).ps $(SRC).pdf

all:: bbl texts

texts: $(SRC).tex terminology.tex abstract.tex intro.tex related.tex conclusion.tex \
	app-model-chk.tex app-replication.tex plan.tex bib/biblio.bib tern/*.tex
	dvipdf $(SRC).dvi
	dvips -o $(SRC).ps -t letter $(SRC).dvi
	#test -e p.pdf || ln -s $(SRC).pdf p.pdf

bbl:
	rm -rf $(SRC).bbl
	latex  $(SRC) 2>&1 > $(SRC).build.log
	bibtex  $(SRC) 2>&1 >> $(SRC).build.log
	latex  $(SRC) 2>&1 >> $(SRC).build.log
	latex  $(SRC) 2>&1 >> $(SRC).build.log

clean:
	rm -f $(FILES)
