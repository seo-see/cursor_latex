# 사용 방법:
# make        : PDF 파일 생성
# make clean  : 생성된 파일들 삭제

.PHONY: all clean

all: manuscript.pdf

manuscript.pdf: manuscript.tex references.bib
	xelatex manuscript.tex
	bibtex manuscript
	xelatex manuscript.tex
	xelatex manuscript.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.synctex.gz *.pdf