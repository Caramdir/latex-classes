\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{caramdir-notes}[2011/01/30 v0.1 My documentclass for notes]

\newif\ifbw

\LoadClassWithOptions{scrartcl}
\RequirePackage{scrpage2}

\KOMAoptions{
    fontsize=10pt,
    %DIV=, % basic value for typearea
    %BCOR=, % binding correction
    footinclude=false, % include the footer as part of the text for layout
                       % calculations?
    headinclude=false, % include the header as part of the text for layout
                       % calculations?
    pagesize           % correctly specify pdf page size
}
\recalctypearea

% Misc packages
\RequirePackage{amsmath,amsthm}
\RequirePackage{mparhack}  % correct placement of margin notes
\RequirePackage{mathtools,extpfeil,xfrac} % \mathclap, extensible arrows and
                                          % slanted fractions
\RequirePackage{todonotes}
\RequirePackage{csquotes} % proper quotes
\RequirePackage{babel}
\RequirePackage{paralist}
\RequirePackage{engord}	  % English ordinals
\RequirePackage{biblatex}

% Fonts
\RequirePackage{unicode-math}
\setmainfont[
	Ligatures=TeX,
	Extension=.otf,
	UprightFont= *-regular,
	BoldFont=*-bold,
	ItalicFont=*-italic,
	BoldItalicFont=*-bolditalic,
]{texgyretermes}
\setsansfont[
	Ligatures=TeX,
	Extension=.otf,
	UprightFont= *-regular,
	BoldFont=*-bold,
	ItalicFont=*-italic,
	BoldItalicFont=*-bolditalic,
	Scale=MatchUppercase
]{texgyreadventor}
\setmathfont{XITS Math}
\setmathfont[range=\mathscr,Scale=MatchUppercase]{FreeSerif}

% TikZ
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc,arrows,decorations.markings,decorations.pathmorphing,decorations.pathreplacing,matrix}
\tikzstyle{every picture}+=[>=latex]
\tikzset{commutative diagram/.style={matrix of math nodes,column sep=2em,row sep=2em,text height=1.5ex, text depth=0.25ex}}

% Theorems and sections
\theoremstyle{plain}
\newtheorem{Thm}{Theorem}
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
\newtheorem{Rem}{Remark}
\newtheorem{Rems}[Rem]{Remarks}
\newtheorem{Ex}{Example}
\newtheorem{Exs}[Ex]{Examples}
\newtheorem{Exercise}{Exercise}

% margin notes
\newcommand\remark[1]{\leavevmode\marginpar{\footnotesize\itshape #1}}
\newcommand\sidepicture[2][]{\marginpar{#2\\[0.5em]{\footnotesize\itshape #1}}}

\DeclareOption{bw}{
    \bwtrue
}    

\ProcessOptions\relax

% set various font options
\ifbw
    \colorlet{sectioningcolor}{black}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\scshape\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\scshape\large\color{sectioningcolor}}
\else
    \colorlet{sectioningcolor}{cyan!15!blue}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\large\color{sectioningcolor}}
\fi

\setkomafont{paragraph}{\normalfont\normalcolor\sffamily\bfseries}
\setkomafont{subparagraph}{\normalfont\normalcolor\sffamily\itshape}

\AtBeginDocument{
	\clearscrheadfoot
	\let\@@title\@title
	\ihead{\normalfont\scshape\@@title}
	\chead{}
	\ohead{\pagemark}
	\cfoot[\pagemark]{}
	\setheadsepline{0.7pt}
}
\pagestyle{scrheadings}

\RequirePackage[colorlinks=false]{hyperref}
