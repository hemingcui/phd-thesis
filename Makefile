FILES = proposal.toc proposal.bbl proposal.aux proposal.blg proposal.dvi proposal.log proposal.ps proposal.pdf

all:: bbl proposal

proposal: proposal.tex bib/biblio.bib
	dvipdf proposal.dvi
	dvips -o proposal.ps -t letter proposal.dvi

bbl:
	rm -rf proposal.bbl
	latex proposal
	bibtex proposal
	latex proposal
	latex proposal

clean:
	rm -f $(FILES)
