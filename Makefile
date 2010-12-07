PACKAGE=currfile

all: package doc

package: ${PACKAGE}.sty

doc: ${PACKAGE}.pdf

${PACKAGE}.sty: ${PACKAGE}.ins ${PACKAGE}.dtx
	yes | pdflatex $<

${PACKAGE}.pdf: ${PACKAGE}.dtx ${PACKAGE}.sty
	latexmk -pdf $<

ctanify: ${PACKAGE}.dtx ${PACKAGE}.ins ${PACKAGE}.pdf README Makefile
	-pdfopt ${PACKAGE}.pdf temp.pdf && ${MV} temp.pdf ${PACKAGE}.pdf
	ctanify $^

clean:
	latexmk -C ${PACKAGE}.dtx

