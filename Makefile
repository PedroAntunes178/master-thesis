# ---------------------------------------------------------
# type "make" command in Unix to create the PDF file 
# ---------------------------------------------------------

# Main filename
FILE=thesis

# ---------------------------------------------------------

all:
	pdflatex  ${FILE} && biber ${FILE} && \
		makeglossaries ${FILE}  && \
		pdflatex  ${FILE} && pdflatex  ${FILE}
# makeindex $(FILE).nlo -s nomencl.ist -o $(FILE).nls
# makeindex $(FILE).glo -s $(FILE).ist -o $(FILE).gls -t $(FILE).glg
	

clean:
	(rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof *.log *.lot *.nlo *.nls *.out *.toc)

veryclean: clean
	rm -f *~ *.*% && \
		rm -f $(FILE).pdf $(FILE).ps

