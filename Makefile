SRC = proposal
FILES = proposal.toc proposal.bbl proposal.aux proposal.blg proposal.dvi *.log proposal.ps proposal.pdf

all:: bbl proposal

proposal: proposal.tex terminology.tex abstract.tex intro.tex related.tex conclusion.tex \
	app-model-chk.tex app-replication.tex plan.tex bib/biblio.bib tern/*.tex
	dvipdf proposal.dvi
	dvips -o proposal.ps -t letter proposal.dvi
	test -e p.pdf || ln -s $(SRC).pdf p.pdf

bbl:
	rm -rf proposal.bbl
	latex  $(SRC) 2>&1 > $(SRC).build.log
	bibtex  $(SRC) 2>&1 >> $(SRC).build.log
	latex  $(SRC) 2>&1 >> $(SRC).build.log
	latex  $(SRC) 2>&1 >> $(SRC).build.log

clean:
	rm -f $(FILES)
