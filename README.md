
# Cursor에서 LaTeX 사용하기

## 1. 준비 단계

### 1.1 확장 프로그램 설치
- `LaTeX Workshop` 확장 프로그램 설치  
  → LaTeX 문서 작성에 필요한 다양한 기능 제공

### 1.2 LaTeX 배포판 설치
- 다음 중 하나를 선택하여 설치:
  - TeX Live
  - MiKTeX
  - MacTeX (Mac 사용자)

### 1.3 기본 설정
1. Cursor 설정에서 LaTeX Workshop 관련 옵션 확인 및 조정  
2. `Shift+Command+P` → `Preferences: Open Settings (JSON)` 선택  
3. 아래 코드를 중간에 삽입:

```json
{
  "latex.linter.enabled": false,
  "[latex]": {
    "editor.formatOnPaste": false,
    "editor.suggestSelection": "recentlyUsedByPrefix"
  },
  "latex-workshop.latex.tools": [
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "xelatex",
      "tools": [
        "xelatex"
      ]
    }
  ]
}
```

---

## 2. LaTeX 문서 작성

### 2.1 새 문서 만들기
- `.tex` 확장자로 새 파일 생성

### 2.2 기본 문서 구조
> (예시 문서 구조는 사용자가 필요에 따라 작성)

---

## 3. 컴파일 및 BibTeX

### 3.4 컴파일 순서
- Make를 사용하여 컴파일 과정을 자동화  
  → 자세한 내용은 [4. Makefile 사용하기](#4-makefile-사용하기) 참고

### 3.5 Cursor에서 BibTeX 설정
- Cursor에서 직접 BibTeX을 설정하는 대신, Makefile을 사용하여 컴파일 과정을 관리

---

## 4. Makefile 사용하기

### 4.1 Makefile 확인
- 프로젝트 루트 디렉토리에 `Makefile`이라는 이름의 파일이 있는지 확인
```makefile
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
```

### 4.2 Makefile 사용하기
- 터미널에서 다음 명령어 실행:
  - PDF 생성: `make`
  - 생성된 파일 삭제: `make clean`

### 4.3 Cursor에서 Makefile 사용
1. Cursor에 `Task Explorer` 확장 프로그램 설치  
2. 사이드바에서 Task Explorer 아이콘 클릭  
3. Makefile 태스크가 자동으로 인식되어 표시됨  
4. `make` 태스크 클릭 → PDF 생성  
5. `make clean` 태스크 클릭 → 생성된 파일 삭제

## Question
If you have any questions, contact me at ([cacaowhite@g.skku.edu](mailto:cacaowhite@g.skku.edu))
