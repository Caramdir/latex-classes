%%
%% This is file `long-notes.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `long-notes,common,long-common')
%% Copyright (C) 2011-2013 by Clemens Koppensteiner
%% -------------------------------------------
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at
%%  your option) any later version.
%% The latest version of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{long-notes}
   [2013/06/18 v0.3
      A class for longer notes
   ]
\LoadClassWithOptions{scrbook}
\RequirePackage{xstring}
\RequirePackage{iftex}
\newif\ifkindledxlandscape
\newif\ifkindledxportrait
\newif\ifkindledx
\newif\ifbw
\newif\iffinal
\newif\ifnumbertheorems
\numbertheoremstrue
\newif\ifnumberinsections
\newif\ifbiblatexalpha
\newif\ifcgs
\IfEndWith{\jobname}{\detokenize{-kindledxlandscape}}{\kindledxlandscapetrue}{}
\IfEndWith{\jobname}{\detokenize{-kindledxportrait}}{\kindledxportraittrue}{}
\IfEndWith{\jobname}{\detokenize{-bw}}{\bwtrue}{}
\IfEndWith{\jobname}{\detokenize{-cgs}}{\cgstrue}{}
\DeclareOption{kindledxlandscape}{
    \kindledxlandscapetrue
}
\DeclareOption{kindledxportrait}{
    \kindledxportraittrue
}
\DeclareOption{bw}{
    \bwtrue
}
\DeclareOption{final}{
    \finaltrue
}
\DeclareOption{no-theorem-numbers}{
    \numbertheoremsfalse
}
\DeclareOption{number-in-sections}{
    \numberinsectionstrue
}
\DeclareOption{biblatex-alpha}{
    \biblatexalphatrue
}
\DeclareOption{gcs}{
    \gcstrue
}

\ProcessOptions\relax

\ifkindledxportrait\kindledxtrue\fi
\ifkindledxlandscape\kindledxtrue\fi
\ifkindledx\bwtrue\fi
\KOMAoptions{
    fontsize=10pt,
    footinclude=false,
    headinclude=false,
    pagesize,
    twoside,
    open=right,
}
\recalctypearea
\ifkindledxlandscape
    \RequirePackage[papersize={19.5cm,12.5cm},lmargin=0.2cm,rmargin=5cm,marginparwidth=4.5cm,marginparsep=0.3cm,bottom=0.2cm,top=0.8cm, headsep=0.3cm,footskip=0cm,twoside=false]{geometry}
\fi

\ifkindledxportrait
    \RequirePackage[papersize={13.3cm,18.8cm},lmargin=0.2cm,rmargin=0.5cm,bottom=0.2cm,top=0.8cm,headsep=0.3cm,footskip=0cm,twoside=false]{geometry}
\fi
\RequirePackage{scrpage2}
\RequirePackage{amsmath,amsfonts,amssymb,amsthm,thmtools}
\RequirePackage{mathtools,extpfeil,xfrac}
\RequirePackage{mparhack}  % correct placement of margin notes
\iffinal
    \RequirePackage[disable]{todonotes}
\else
    \RequirePackage{todonotes}
\fi
\RequirePackage{csquotes}
\ifXeTeX
    \RequirePackage{polyglossia}
    \setmainlanguage{english}
\else
    \RequirePackage{babel}
\fi
\RequirePackage{paralist}
\setdefaultenum{(i)}{(a)}{(A)}{1.}
\RequirePackage{engord}
\RequirePackage{needspace}
\RequirePackage{dtklogos}
\RequirePackage[backend=biber,
    maxnames=100,
\ifbiblatexalpha
    style=alphabetic
\fi
    ]{biblatex}
\AtBeginDocument{
    \def\bibname{bibliography}
    \def\refname{references}
}
\RequirePackage{etoolbox}
\RequirePackage{microtype}
\RequirePackage{unicode-math}
\ifluatex
    \RequirePackage{lualatex-math}
\fi

\def\ck@mainfont{TeX Gyre Termes}
\setmainfont[
  Ligatures=TeX,
  Extension=.otf,
  UprightFont= *-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic,
  Scale=MatchUppercase,
  Numbers=OldStyle
]{texgyretermes}

\def\ck@sansfont{TeX Gyre Adventor}
\setsansfont[
  Ligatures=TeX,
  Extension=.otf,
  UprightFont= *-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic,
  Scale=MatchUppercase
]{texgyreadventor}

\def\ck@monofont{Liberation Mono}
\setmonofont[
  Ligatures=TeX,
  Scale=MatchLowercase
]{Liberation Mono}

\def\ck@mathfont{XITS Math}
\setmathfont{xits-math.otf}
\ifbw
    \colorlet{sectioningcolor}{black}
\else
    \colorlet{sectioningcolor}{cyan!15!blue}
\fi
\ifbw
    \setkomafont{chapter}{\normalfont\normalcolor\sffamily\scshape\huge\color{sectioningcolor}}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\scshape\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\scshape\large\color{sectioningcolor}}
\else
    \setkomafont{chapter}{\normalfont\normalcolor\sffamily\huge\color{sectioningcolor}}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\large\color{sectioningcolor}}
\fi
\setkomafont{paragraph}{\normalfont\normalcolor\scshape\color{sectioningcolor}}
\setkomafont{subparagraph}{\normalfont\normalcolor\itshape\color{sectioningcolor}}
\pagestyle{scrheadings}

\ifkindledx
    \AtBeginDocument{%
        \cfoot{}%
        \chead{\normalfont\scshape\headmark}%
        \ohead{\normalfont\pagemark}%
        \renewcommand*\partpagestyle{empty}%
        \renewcommand*\chapterpagestyle{empty}%
        \renewcommand*\indexpagestyle{empty}%
    }
\else
    \AtBeginDocument{%
        \lehead{\normalfont\scshape\headmark}%
        \setheadsepline{0.4pt}[\color{black!30}]%
    }
    \appto\backmatter{%
\rohead{\normalfont\scshape\headmark}%
    }
\fi
\RequirePackage{makeidx}
\RequirePackage{index}
\makeindex
\appto\theindex{%
\markboth{\indexname}{\indexname}%
\addcontentsline{toc}{chapter}{\indexname}%
}
\newcommand*\lettergroup[1]{%
    \par\textbf{\textsf{\color{sectioningcolor}#1}}\par%
    \nopagebreak
}

\RequirePackage[noprefix,refpage,intoc]{nomencl}
\renewcommand\nomname{List of Notation}
\renewcommand{\pagedeclaration}[1]{\hfill #1}
\makenomenclature
\RequirePackage{tikz}
\usetikzlibrary{
    positioning,
    calc,
    arrows,
    decorations.markings,
    decorations.pathmorphing,
    decorations.pathreplacing,
    matrix,
    intersections}
\tikzstyle{every picture}+=[>=latex]
\tikzset{commutative diagram/.style={
    matrix of math nodes,
    column sep=2.5em,
    row sep=2.5em,
    text height=1.5ex,
    text depth=0.25ex}}
\tikzset{spaced commutative diagram/.style={
    commutative diagram,
    column sep=3.5em,
    row sep=3.5em}}
\tikzset{commutative diagram arrows/.style={
    ->,
    font=\small}}
\tikzset{descr/.style={fill=white,inner sep=1pt}}
\ifkindledxportrait
    \newcommand\remark{\footnote}
\else
    \newcommand\remark[1]{\leavevmode\marginpar{\footnotesize\itshape #1}}
\fi

\newcommand\sidepicture[2][]{\marginpar{#2\\[0.5em]{\footnotesize\itshape #1}}}
\newcommand\reference[1]{\remark{\textit{Reference:} \normalfont #1}}
\usepackage{comment}
\newcommand\cgsformat{\small\color{black!60!green}}
\ifcgs
    \newcommand\textcgs[1]{{\cgsformat#1}}
    \specialcomment{cgs}{\begingroup\cgsformat}{\endgroup}
    \newcommand\cgsIntro{}
\else
    \newcommand\textcgs[1]{}
    \excludecomment{cgs}
    \newcommand\cgsIntro{}
\fi
\def\ck@todooptions{}
\def\todooptions#1{\def\ck@todooptions{#1}}
\let\oldtodo\todo
\def\todo{\@ifnextchar[{\ck@todo}{\ck@todo[]}}
\def\ck@todo[{\expandafter\oldtodo\expandafter[\ck@todooptions,}
\RequirePackage{newunicodechar}
\newunicodechar{ }{ } % no-break space
\newunicodechar{ }{ } % narrow no-break space
\RequirePackage[colorlinks=false,unicode=true]{hyperref}
\RequirePackage{bookmark}
\let\ck@oldtableofcontents\tableofcontents
\def\tableofcontents{%
    \cleardoublepage%
    \pdfbookmark{\contentsname}{Contents}%
    \ck@oldtableofcontents%
}
\theoremstyle{plain}
\ifnumbertheorems
    \ifnumberinsections
        \newtheorem{Thm}{Theorem}[section]
    \else
\newtheorem{Thm}{Theorem}[chapter]
    \fi
\else
    \newtheorem*{Thm}{Theorem}
\fi
\ifnumbertheorems
    \newtheorem{Fact}[Thm]{Fact}
    \newtheorem{Claim}[Thm]{Claim}
    \newtheorem{Prop}[Thm]{Proposition}
    \newtheorem{Cor}[Thm]{Corollary}
    \newtheorem{CorAd}[Thm]{Corollary*}
    \newtheorem{Lem}[Thm]{Lemma}
    \newtheorem{LemAd}[Thm]{Lemma*}
    \newtheorem{Alg}[Thm]{Algorithm}
    \newtheorem{DefProp}[Thm]{Definition and Proposition}
    \newtheorem{Conjecture}[Thm]{Conjecture}
\else
    \newtheorem*{Fact}{Fact}
    \newtheorem*{Claim}{Claim}
    \newtheorem*{Prop}{Proposition}
    \newtheorem*{Cor}{Corollary}
    \newtheorem*{CorAd}{Corollary*}
    \newtheorem*{Lem}{Lemma}
    \newtheorem*{LemAd}{Lemma*}
    \newtheorem*{Alg}{Algorithm}
    \newtheorem*{DefProp}{Definition and Proposition}
    \newtheorem*{Conjecture}{Conjecture}
\fi

\theoremstyle{definition}
\ifnumbertheorems
    \newtheorem{Def}[Thm]{Definition}
    \newtheorem{Assumption}[Thm]{Assumption}
\else
    \newtheorem*{Def}{Definition}
    \newtheorem*{Assumption}{Assumption}
\fi
\newtheorem*{Notation}{Notation}

\theoremstyle{remark}
\ifnumbertheorems
    \newtheorem{Rem}[Thm]{Remark}
    \newtheorem{RemAd}[Thm]{Remark*}
    \newtheorem{Rems}[Thm]{Remarks}
    \newtheorem{Exercise}[Thm]{Exercise}
    \newtheorem{Q}[Thm]{Question}
    \newtheorem{Warning}[Thm]{Warning}
\else
    \newtheorem*{Rem}{Remark}
    \newtheorem*{RemAd}{Remark*}
    \newtheorem*{Rems}{Remarks}
    \newtheorem*{Exercise}{Exercise}
    \newtheorem*{Q}{Question}
    \newtheorem*{Warning}{Warning}
\fi

\ifnumbertheorems
    \declaretheorem[name=Example,sibling=Thm,qed={\lower-0.3ex\hbox{$◃$}}]{Ex}
    \declaretheorem[name=Examples,sibling=Ex,qed={\lower-0.3ex\hbox{$◃$}}]{Exs}
\else
    \declaretheorem[name=Example,numbered=no,qed={\lower-0.3ex\hbox{$◃$}}]{Ex}
    \declaretheorem[name=Examples,numbered=no,qed={\lower-0.3ex\hbox{$◃$}}]{Exs}
\fi
\let\@version\@empty%
\newcommand{\version}[1]{\gdef\@version{#1}}%
\let\@author\@empty%
\let\@course\@empty%
\newcommand{\course}[1]{\gdef\@course{#1}}%
\let\@courseinfo\@empty%
\newcommand{\courseinfo}[1]{\gdef\@courseinfo{#1}}%
\let\@typedby\@empty%
\newcommand{\typedby}[1]{\gdef\@typedby{#1}}%
\let\@disclaimer\@empty%
\newcommand{\disclaimer}[1]{\gdef\@disclaimer{#1}}%
\AtBeginDocument{%
\hypersetup{
pdfinfo={
Title={\@title},
Author={\ifx\@author\@empty\ifx\@typedby\@empty\else\@typedby\fi\else\@author\fi}
}
}%
}
\newcommand\maketitlepage{%
\begin{titlepage}
    \sffamily
    \ifkindledx\relax\else\vspace*{3cm}\fi

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
    \ifx\@typedby\@empty{\ifx\@author\@empty\else\@author\\[1cm]\fi}\else
      written by \@typedby\\[1cm]
    \fi
    \normalcolor
    \large
    \ifx\@version\@empty\else
      Version \@version\\
    \fi
    \ifx\@date\today\else\@date\fi

\clearpage\normalfont\normalsize\normalcolor
\thispagestyle{plain}
\noindent
\ifx\@disclaimer\@empty\else\@disclaimer\\[1cm]\fi
The current version of this text as well as the \LaTeX{} source code can be found
at \url{http://caramdir.at/math}.

\ifkindledxlandscape%
\noindent This version of the document has been specially formatted to fit on a Kindle DX (second generation) in landscape rotation.
For optimal viewing select \enquote{actual size} from the text menu.
\fi
\ifkindledxportrait%
\noindent This version of the document has been specially formatted to fit on a Kindle DX (second generation).
\fi
\vfill

\noindent
This document was typeset with
\ifluatex Lua\LaTeX\fi\ifxetex \XeLaTeX\fi{} and KOMA-Script.
The used fonts are \ck@mainfont, \ck@sansfont, \ck@monofont{} and \ck@mathfont.
\vspace{1cm}

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
\endinput
%%
%% End of file `long-notes.cls'.
