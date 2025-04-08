# 📘 LaTeX in Cursor / Cursor에서 LaTeX 사용하기

> This guide explains how to set up and use LaTeX in [Cursor](https://www.cursor.sh/).  
> 이 가이드는 [Cursor](https://www.cursor.sh/) 에디터에서 LaTeX 환경을 설정하고 사용하는 방법을 설명합니다.

---

## 🌐 Language | 언어

- [🇺🇸 English Guide](#-english-guide)
- [🇰🇷 한국어 가이드](#-한국어-가이드)

---

## 🇺🇸 English Guide

### 1. Setup

#### 1.1 Install Extension
- Install the `LaTeX Workshop` extension  
  → Provides useful LaTeX editing features

#### 1.2 Install LaTeX Distribution
Choose one:
- [TeX Live](https://www.tug.org/texlive/)
- [MiKTeX](https://miktex.org/)
- [MacTeX](https://tug.org/mactex/) (Mac users)

#### 1.3 Configure Cursor
1. Open `Preferences: Open Settings (JSON)` (`Shift+Command+P`)  
2. Add the following:

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

### 2. Writing LaTeX

#### 2.1 Create File
- Create a new `.tex` file

#### 2.2 Example Structure

```latex
\documentclass{article}
\usepackage{xeCJK} % For Korean or CJK fonts
\begin{document}
Hello, LaTeX!
\end{document}
```

---

### 3. Compile & BibTeX

#### 3.1 Compilation Steps
Use a Makefile to automate:

#### 3.2 BibTeX
Instead of configuring BibTeX inside Cursor, use a Makefile to manage everything.

---

### 4. Using Makefile

#### 4.1 Sample Makefile

```makefile
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

#### 4.2 Run in Terminal
- Build PDF: `make`
- Clean files: `make clean`

#### 4.3 Use in Cursor
1. Install `Task Explorer` extension  
2. Open the Task Explorer from the sidebar  
3. Run `make` or `make clean` with one click

---

## 🇰🇷 한국어 가이드

### 1. 준비 단계

#### 1.1 확장 프로그램 설치
- `LaTeX Workshop` 확장 프로그램 설치  
  → LaTeX 문서 작성을 위한 기능 제공

#### 1.2 LaTeX 배포판 설치
아래 중 하나 설치:
- [TeX Live](https://www.tug.org/texlive/)
- [MiKTeX](https://miktex.org/)
- [MacTeX](https://tug.org/mactex/) (Mac 사용 시)

#### 1.3 기본 설정
1. `Shift+Command+P` → `Preferences: Open Settings (JSON)` 선택  
2. 아래 내용 삽입:

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

### 2. LaTeX 문서 작성

#### 2.1 새 문서 만들기
- `.tex` 확장자로 파일 생성

#### 2.2 문서 예시

```latex
\documentclass{article}
\usepackage{xeCJK} % 한글 또는 CJK 폰트 사용
\begin{document}
안녕하세요, LaTeX!
\end{document}
```

---

### 3. 컴파일 및 BibTeX

#### 3.1 컴파일 순서
- Makefile을 사용하면 자동화 가능

#### 3.2 BibTeX 설정
- Cursor에서 직접 실행하기보다 Makefile로 관리하는 것을 추천

---

### 4. Makefile 사용하기

#### 4.1 Makefile 예시

```makefile
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

#### 4.2 터미널에서 실행
- PDF 생성: `make`
- 파일 삭제: `make clean`

#### 4.3 Cursor에서 실행
1. `Task Explorer` 확장 프로그램 설치  
2. 사이드바에서 Task Explorer 아이콘 클릭  
3. `make`, `make clean` 태스크를 클릭하여 실행

---


---

## ⚖️ Ethical Considerations / 윤리적 고려사항

> This guide includes the use of AI tools such as Copilot and Cursor.  
> These tools are intended to assist in formatting, writing, and document preparation.  
> All scientific content, citations, and conclusions must be verified and validated by the human author.

> 이 가이드는 Copilot, Cursor와 같은 AI 도구의 사용을 포함합니다.  
> 이러한 도구는 문서 작성 및 형식을 지원하기 위한 보조 수단입니다.  
> 모든 학술적 내용, 인용, 결론에 대한 최종 검토와 책임은 인간 저자에게 있습니다.


## 📬 Contact

If you have any questions, feel free to reach out!
문의사항이 있으시면 언제든지 연락 주세요!
**[cacaowhite@g.skku.edu](mailto:cacaowhite@g.skku.edu)**
