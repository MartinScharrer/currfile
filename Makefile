PACKAGE=currfile
LATEX=pdflatex

all: package doc

package: ${PACKAGE}.sty

doc: ${PACKAGE}.pdf

${PACKAGE}.sty: ${PACKAGE}.ins ${PACKAGE}.dtx
	yes | pdflatex $<

%.pdf: %.dtx %.sty
	${LATEX} $*.dtx
	-makeindex -s gind.ist -o $*.ind $*.idx
	-makeindex -s gglo.ist -o $*.gls $*.glo
	${LATEX} $*.dtx
	${LATEX} $*.dtx

ctanify: ${PACKAGE}.dtx ${PACKAGE}.ins ${PACKAGE}.pdf README Makefile
	-pdfopt ${PACKAGE}.pdf temp.pdf && ${MV} temp.pdf ${PACKAGE}.pdf
	ctanify $^

fullclean: clean
	rm ${PACKAGE}.pdf

clean:
	latexmk -C ${PACKAGE}.dtx
	@rm -f ${PACKAGE}.cod ${PACKAGE}.glo ${PACKAGE}.gls ${PACKAGE}.sty ${PACKAGE}.log ${PACKAGE}.aux

install: package doc
	-@mkdir ${HOME}/texmf/tex/latex/currfile/ 2>/dev/null || true
	cp ${PACKAGE}.sty ${HOME}/texmf/tex/latex/currfile/
	cp ${PACKAGE}.pdf ${HOME}/texmf/tex/latex/currfile/
	texhash ${HOME}/texmf

