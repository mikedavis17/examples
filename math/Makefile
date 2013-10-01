
DOCS = category.pdf

doc : $(DOCS)

$(DOCS) : %.pdf : %.tex
	latex $<
	latex $<
	dvips -o $*.ps $*.dvi
	ps2pdf $*.ps $@
	rm $*.dvi $*.ps

