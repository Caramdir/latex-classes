\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ck-article}
   [2020/06/29 v0.1
      A class for my articles and notes
   ]
\LoadClassWithOptions{scrartcl}

\RequirePackage{xstring}
\RequirePackage{iftex}

\newif\ifbw
\newif\iffinal
\newif\ifendatcurrentposition
\newif\ifnumberinsections
\newif\ifnumberinsubsections
\newif\iflargefont
\newif\ifnumberparagraphs

\IfEndWith{\jobname}{\detokenize{-bw}}{\bwtrue}{}
\IfEndWith{\jobname}{\detokenize{-large}}{\largefonttrue}{}

\DeclareOption{bw}{
    \bwtrue
}

\DeclareOption{final}{
    \finaltrue
}

\DeclareOption{number-in-sections}{
    \numberinsectionstrue
}
\DeclareOption{number-in-subsections}{
    \numberinsubsectionstrue
}

\DeclareOption{number-paragraphs}{
    \numberparagraphstrue
}

\DeclareOption{large-font}{
    \largefonttrue
}

\ProcessOptions\relax

\IfEndWith{\jobname}{\detokenize{-current}}{
	\finaltrue
	\newcommand\currentpos{\ifx\outro\undefined\else\outro\fi\end{document}}
}{
	\newcommand\currentpos{}
}

\KOMAoptions{
    footinclude=false,
    headinclude=false,
    pagesize,
}
\iflargefont
    \KOMAoptions{fontsize=14pt}
\else
    \KOMAoptions{fontsize=10pt}
\fi
\recalctypearea

\RequirePackage{newunicodechar}
\newunicodechar{ }{ } % no-break space
\newunicodechar{ }{ } % narrow no-break space

\RequirePackage{scrlayer-scrpage}
\RequirePackage{amsmath,amsfonts,amssymb,amsthm,thmtools}
\RequirePackage{mathtools,extpfeil,xfrac}
\RequirePackage{mparhack}  % correct placement of margin notes

\iffinal
    \RequirePackage[disable]{todonotes}
\else
    \RequirePackage{todonotes}
\fi

\RequirePackage{csquotes}

\RequirePackage[overload]{textcase}

\RequirePackage{polyglossia}
\setmainlanguage{english}

\RequirePackage{enumitem}
\setlist[enumerate,1]{label=(\roman*)}
\setlist[enumerate,2]{label=(\alph*)}
\setlist[enumerate,3]{label=(\Alph*)}
\setlist[enumerate,4]{label=\arabic*.}

\RequirePackage{engord}

\RequirePackage{needspace}

\RequirePackage[
    backend=biber,
    style=alphabetic,
    maxnames=100,
    maxalphanames=100,
]{biblatex}

\DeclareLabelalphaTemplate{
    \labelelement{
        \field[final,lowercase]{shorthand}
        \field{label}
        \field[strwidth=1,strside=left,lowercase]{labelname}
    }
}

\DeclareFieldFormat{labelalpha}{\textsc{#1}}
\DeclareFieldFormat{extraalpha}{\textsc{#1}}

\defbibheading{bibliography}[\refname]{%
    \bookmarksetupnext{level=section}
    \phantomsection%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
    \markboth{#1}{#1}%
}

\RequirePackage{etoolbox}
\RequirePackage{microtype}

\RequirePackage{unicode-math}
\ifluatex
    \RequirePackage{lualatex-math}
\fi

\setmainfont[
  Ligatures=TeX,
  Scale=MatchUppercase,
  Numbers=OldStyle
]{Linux Libertine}

\setsansfont[
  Ligatures=TeX,
  Scale=MatchUppercase
]{Linux Biolinum}

\setmonofont[
  Ligatures=TeX,
  Scale=MatchLowercase
]{Inconsolata}

\setmathfont{TeX Gyre Termes Math}

\ifbw
    \colorlet{sectioningcolor}{black}
\else
    \colorlet{sectioningcolor}{cyan!15!blue}
\fi

\RequirePackage{titlesec, titletoc}

\titleformat
    {\section}
    [block]
    {\centering\normalfont\ifbw\Large\else\large\fi\scshape\color{sectioningcolor}}
    {\thesection.\ }
    {0pt}
    {\MakeLowercase}
    []

\titleformat
    {\subsection}
    [hang]
    {\normalfont\normalsize\ifbw\bfseries\fi\scshape\color{sectioningcolor}}
    {\thesubsection.\ }
    {0pt}
    {\MakeLowercase}
    []

\titleformat
    {\subsubsection}
    [hang]
    {\normalfont\normalsize\ifbw\bfseries\fi\itshape\color{sectioningcolor}}
    {\thesubsubsection.\ }
    {0pt}
    {}
    []

\ifnumberparagraphs
	\setcounter{secnumdepth}{4}
	\titleformat
		{\paragraph}
		[runin]
		{\stepcounter{Thm}\normalfont\normalsize\bfseries}
		{\theThm.\ }
		{0pt}
		{}
		[\protected@xdef\@currentlabel{\p@Thm\theThm}]
\else
	\titleformat
		{\paragraph}
		[runin]
		{\normalfont\normalsize\bfseries}
		{}
		{0pt}
		{}
\fi

\setkomafont{disposition}{\normalfont}

%\dottedcontents{section}[3.8em]{}{2.3em}{1pc}
% TODO: Make subsections appear in the PDF bookmarks, but not in the toc.
%\dottedcontents{subsection}[6.1em]{}{3.2em}{1pc}

\pagestyle{scrheadings}

\AtBeginDocument{%
    \clearscrheadfoot%
    \ihead{\normalfont\scshape\color{gray}\MakeLowercase{\@title}}%
    \ohead{\pagemark}%
	\cfoot[\pagemark]{}%
    \setheadsepline{0.4pt}[\color{gray}]%
}
\appto\backmatter{%
    \rohead{\normalfont\scshape\MakeLowercase{\headmark}}%
}

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

\RequirePackage{tikz-cd}

\iffinal
    \newcommand\remark[1]{}
\else
    \newcommand\remark[1]{\leavevmode\marginpar{\footnotesize\itshape #1}}
\fi

\newcommand\sidepicture[2][]{\marginpar{#2\\[0.5em]{\footnotesize\itshape #1}}}

\def\ck@todooptions{}
\def\todooptions#1{\def\ck@todooptions{#1}}
\let\oldtodo\todo
\def\todo{\@ifnextchar[{\ck@todo}{\ck@todo[]}}
\def\ck@todo[{\expandafter\oldtodo\expandafter[\ck@todooptions,}

\RequirePackage[colorlinks=false,unicode=true]{hyperref}
\RequirePackage{bookmark}

\theoremstyle{plain}
\ifnumberinsections
	\newtheorem{Thm}{Theorem}[section]
\else
	\ifnumberinsubsections
		\newtheorem{Thm}{Theorem}[subsection]
	\else
		\newtheorem{Thm}{Theorem}
	\fi
\fi
\newtheorem{Theorem}[Thm]{Theorem}
\newtheorem{Satz}[Thm]{Satz}
\newtheorem{Fact}[Thm]{Fact}
\newtheorem{Claim}[Thm]{Claim}
\newtheorem{Prop}[Thm]{Proposition}
\newtheorem{Proposition}[Thm]{Proposition}
\newtheorem{Cor}[Thm]{Corollary}
\newtheorem{Corollary}[Thm]{Corollary}
\newtheorem{CorAd}[Thm]{Corollary*}
\newtheorem{Lem}[Thm]{Lemma}
\newtheorem{Lemma}[Thm]{Lemma}
\newtheorem{LemAd}[Thm]{Lemma*}
\newtheorem{Alg}[Thm]{Algorithm}
\newtheorem{Algorithm}[Thm]{Algorithm}
\newtheorem{DefProp}[Thm]{Definition and Proposition}
\newtheorem{Conjecture}[Thm]{Conjecture}

\theoremstyle{definition}
\newtheorem{Def}[Thm]{Definition}
\newtheorem{Definition}[Thm]{Definition}
\newtheorem{Assumption}[Thm]{Assumption}
\newtheorem{Construction}[Thm]{Construction}
\newtheorem*{Notation}{Notation}

\theoremstyle{remark}
\newtheorem{Rem}[Thm]{Remark}
\newtheorem{Remark}[Thm]{Remark}
\newtheorem{RemAd}[Thm]{Remark*}
\newtheorem{Rems}[Thm]{Remarks}
\newtheorem{Remarks}[Thm]{Remarks}
\newtheorem{Exercise}[Thm]{Exercise}
\newtheorem{Q}[Thm]{Question}
\newtheorem{Question}[Thm]{Question}
\newtheorem{A}[Thm]{Answer}
\newtheorem{Answer}[Thm]{Answer}
\newtheorem{Problem}[Thm]{Problem}
\newtheorem{Warning}[Thm]{Warning}
\declaretheorem[name=Example,sibling=Thm,qed={\lower-0.3ex\hbox{$◯$}}]{Ex}
\declaretheorem[name=Examples,sibling=Ex,qed={\lower-0.3ex\hbox{$◯$}}]{Exs}
\declaretheorem[name=Example,sibling=Thm,qed={\lower-0.3ex\hbox{$◯$}}]{Example}
\declaretheorem[name=Examples,sibling=Ex,qed={\lower-0.3ex\hbox{$◯$}}]{Examples}
\declaretheorem[name=Beispiel,sibling=Thm,qed={\lower-0.3ex\hbox{$◯$}}]{Beispiel}
\declaretheorem[name=Beispiele,sibling=Ex,qed={\lower-0.3ex\hbox{$◯$}}]{Beispiele}

% Unnumbered theorems
\theoremstyle{plain}
\newtheorem*{Thm*}{Theorem}
\newtheorem*{Fact*}{Fact}
\newtheorem*{Claim*}{Claim}
\newtheorem*{Prop*}{Proposition}
\newtheorem*{Cor*}{Corollary}
\newtheorem*{CorAd*}{Corollary*}
\newtheorem*{Lem*}{Lemma}
\newtheorem*{LemAd*}{Lemma*}
\newtheorem*{Alg*}{Algorithm}
\newtheorem*{DefProp*}{Definition and Proposition}
\newtheorem*{Conjecture*}{Conjecture}

\theoremstyle{definition}
\newtheorem*{Def*}{Definition}
\newtheorem*{Assumption*}{Assumption}
\newtheorem*{Construction*}{Construction}
\newtheorem*{Notation*}{Notation}

\theoremstyle{remark}
\newtheorem*{Rem*}{Remark}
\newtheorem*{RemAd*}{Remark*}
\newtheorem*{Rems*}{Remarks}
\newtheorem*{Exercise*}{Exercise}
\newtheorem*{Q*}{Question}
\newtheorem*{A*}{Answer}
\newtheorem*{Problem*}{Problem}
\newtheorem*{Warning*}{Warning}
\declaretheorem[numbered=no,name=Example,qed={\lower-0.3ex\hbox{$◯$}}]{Ex*}
\declaretheorem[numbered=no,name=Examples,qed={\lower-0.3ex\hbox{$◯$}}]{Exs*}

\let\@version\@empty%
\newcommand{\version}[1]{\gdef\@version{#1}}%

\AtBeginDocument{%
    \hypersetup{
        pdfinfo={
            Title={\@title},
            Author={\@author}
        }
    }%
}

\renewcommand*{\@maketitle}{%
  \clearpage
  \let\footnote\thanks
  \ifx\@extratitle\@empty \else
    \noindent\@extratitle \next@tpage \if@twoside \null\next@tpage \fi
  \fi
  \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
  \ifx\@titlehead\@empty \else
    \begin{minipage}[t]{\textwidth}
      \@titlehead
    \end{minipage}\par
  \fi
  \null
  \vskip 2em%
  \begin{center}%
    \ifx\@subject\@empty \else
      {\subject@font \@subject \par}
      \vskip 1.5em
    \fi
    {\LARGE\scshape\color{sectioningcolor}\MakeLowercase{\@title} \par}%
    \vskip .5em
    {\ifx\@subtitle\@empty\else\Large\scshape\color{sectioningcolor}\MakeLowercase{\@subtitle}\par\fi}%
    \vskip 1em
    {\scshape
      \lineskip .5em%
      \begin{tabular}[t]{c}
        \MakeLowercase{\@author}
      \end{tabular}\par
    }%
    {\scshape \MakeLowercase{\@date}%
      \ifx\@version\@empty\else{} --- v\@version\fi%
      \par
    }%
    \vskip \z@ \@plus 1em
    {\Large \@publishers \par}
    \ifx\@dedication\@empty \else
      \vskip 2em
      {\Large \@dedication \par}
    \fi
  \end{center}%
  \par
  \vskip 1em
}%

\newcommand\maketitleonly{%
	\def\@maketitle{%
		\clearpage
		\setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
		\vskip 2em%
		\begin{center}%
			{\LARGE\scshape\color{sectioningcolor}\MakeLowercase{\@title} \par}%
			\vskip .5em
			{\ifx\@subtitle\@empty\else\Large\scshape\color{sectioningcolor}\MakeLowercase{\@subtitle}\par\fi}%
		\end{center}%
		\par
		\vskip 1em
	}%
	\maketitle
}

% Characters that do not exist is TeX Gyre Termes Math
\AtBeginDocument{
	\def\similarrightarrow{\xrightarrow{\sim}}
	\def\setminus{-}
    \def\rightdasharrow{\mathrel{-\,}\rightarrow}
}
