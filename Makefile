
all: package doc

package: currfile.sty

doc: currfile.pdf

currfile.sty: currfile.ins currfile.dtx
	pdflatex $<

currfile.pdf: currfile.dtx currfile.sty
	latexmk -pdf $<

ctanify: currfile.dtx currfile.ins currfile.pdf README Makefile
	-pdfopt currfile.pdf temp.pdf && ${MV} temp.pdf currfile.pdf
	ctanify $^

clean:
	latexmk -C currfile.dtx

