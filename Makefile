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

clean:
	(rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof *.log *.lot *.nlo *.nls *.out *.toc)

veryclean: clean
	rm -f *~ *.*% && \
		rm -f $(FILE).pdf $(FILE).ps

