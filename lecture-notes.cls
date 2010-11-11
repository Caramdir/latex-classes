\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{caramdir-lecturenotes}[2010/11/06 v0.1 My documentclass for lecture notes]

\LoadClass[
    open=right, % start chapters on a right page
    fontsize=10pt,
    %DIV=, % basic value for typearea
    %BCOR=, % binding correction
    footinclude=false, % include the footer as part of the text for layout
                       % calculations?
    headinclude=false, % include the header as part of the text for layout
                       % calculations?
]{scrbook}

% Misc packages
\RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\RequirePackage[colorlinks=false]{hyperref}
\RequirePackage{mparhack}  % correct placement of margin notes
\RequirePackage{mathtools,extpfeil,xfrac} % \mathclap, extensible arrows and
                                          % slanted fractions
\RequirePackage{todonotes}
\RequirePackage{csquotes} % proper quotes
\RequirePackage{babel}

% Fonts
\RequirePackage{unicode-math}
\setmainfont[Ligatures=TeX]{XITS} % option makes -- and similar commands work
\setsansfont[
	Ligatures=TeX,
	Extension=.otf,
	UprightFont= *-regular,
	BoldFont=*-bold,
	ItalicFont=*-italic,
	BoldItalicFont=*-bolditalic
]{texgyreadventor}
\setmathfont{XITS Math}
\setmathfont[range=\mathscr,Scale=MatchUppercase]{Tangerine Bold}

% TikZ
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc,arrows,decorations.markings,decorations.pathmorphing,matrix}
\tikzstyle{every picture}+=[>=latex]

% Theorems and sections
\theoremstyle{plain}
\newtheorem{Thm}{Theorem}[chapter]
\newtheorem{Fact}[Thm]{Fact}
\newtheorem{Prop}[Thm]{Proposition}
\newtheorem{Cor}[Thm]{Corollary}
\newtheorem{Lem}[Thm]{Lemma}
\newtheorem{LemAd}[Thm]{Lemma*}
\newtheorem{Alg}[Thm]{Algorithm}
\newtheorem{DefProp}[Thm]{Definition and Proposition}

\theoremstyle{definition}
\newtheorem{Def}[Thm]{Definition}
\newtheorem*{Notation}{Notation}

\theoremstyle{remark}
\newtheorem{Rem}[Thm]{Remark}
\newtheorem{RemAd}[Thm]{Remark*}
\newtheorem{Rems}[Thm]{Remarks}
\newtheorem{Ex}[Thm]{Example}
\newtheorem{Exs}[Thm]{Examples}
\newtheorem{Exercise}[Thm]{Exercise}

% Bibliography
\bibliographystyle{alphaurl}

% Index
\RequirePackage{makeidx}
\RequirePackage{index}
\makeindex

% List of Notation
\RequirePackage[noprefix,refpage]{nomencl}
\renewcommand\nomname{List of Notation}
\renewcommand{\pagedeclaration}[1]{\hfill #1}
\makenomenclature

% margin notes
\newcommand\remark[1]{\marginpar{\footnotesize\itshape #1}}
\newcommand\sidepicture[2][]{\marginpar{#2\\[0.5em]{\footnotesize\itshape #1}}}

% -------------------------
% Layout
% -------------------------

% chapter and section in the header
\pagestyle{headings}

% set various font options
\colorlet{sectioningcolor}{cyan!15!blue}
\setkomafont{chapter}{\normalfont\normalcolor\sffamily\huge\color{sectioningcolor}}
\setkomafont{section}{\normalfont\normalcolor\sffamily\Large\color{sectioningcolor}}
\setkomafont{subsection}{\normalfont\normalcolor\sffamily\large\color{sectioningcolor}}

% -------------------------
% The title page
% -------------------------
\newcommand*{\@course}{}%
\newcommand{\course}[1]{\gdef\@course{#1}}%
\newcommand*{\@courseinfo}{}%
\newcommand{\courseinfo}[1]{\gdef\@courseinfo{#1}}%
\newcommand*{\@typedby}{}%
\newcommand{\typedby}[1]{\gdef\@typedby{#1}}%
\newcommand*{\@version}{}%
\newcommand{\version}[1]{\gdef\@version{#1}}%
\newcommand*{\@disclaimer}{}%
\newcommand{\disclaimer}[1]{\gdef\@disclaimer{#1}}%

\newcommand\maketitlepage{%
\begin{titlepage}
    \sffamily
    \vspace*{3cm}

    \noindent
    \huge\color{sectioningcolor}
    \@title\\[0.6cm]
    \ifx\@course\@empty \else
      \normalcolor\large
      based on the course\\
      \emph{\@course}%
      \ifx\@courseinfo\@empty\else\\\@courseinfo\fi\\[1cm]
    \fi
    \Large
    \ifx\@typedby{\ifx\@author\@empty\else\@author\\[1cm]\fi}\else
      written by \@typedby\\[1cm]
    \fi
    \large
    \ifx\@version\@empty\else
      Version \@version\\
    \fi
    \ifx\@date\today\else\@date\fi

\clearpage\normalfont\normalsize\normalcolor

\noindent
\ifx\@disclaimer\@empty\else\@disclaimer\\[1cm]\fi
%The current version of this text as well as the \LaTeX{} source code can be found
%at \url{http://caramdir.at/math}.
\vfill

\noindent
This work is licensed under the Creative Commons Attribution-Share Alike 3.0 Austria License.
To view a copy of this license, visit \url{http://creativecommons.org/licenses/by-sa/3.0/at/}
or send a letter to\\
Creative Commons\\
171 Second Street, Suite 300\\
San Francisco\\
California, 94105\\
USA.
\end{titlepage}
\cleardoublepage
}
