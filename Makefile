DOC := my_cv
TEXC := pdflatex
OPEN := xdg-open

.PHONY: all clean mostlyclean run

all:
	-mkdir out
	cd src; $(TEXC) -output-directory ../out $(DOC).tex

run:
	$(OPEN) out/$(DOC).pdf

mostlyclean:
	$(RM) out/$(DOC).log out/$(DOC).aux out/$(DOC).out

clean:
	$(RM) out/*
