\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{caramdir-lecturenotes}[2010/11/06 v0.1 My documentclass for lecture notes]

\newif\ifkindledxlandscape
\newif\ifkindledxportrait
\newif\ifkindledx
\newif\ifbw

\LoadClassWithOptions{scrbook}
\RequirePackage{scrpage2}

\KOMAoptions{
    open=right, % start chapters on a right page
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
\RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\RequirePackage{mparhack}  % correct placement of margin notes
\RequirePackage{mathtools,extpfeil,xfrac} % \mathclap, extensible arrows and
                                          % slanted fractions
\RequirePackage{todonotes}
\RequirePackage{csquotes} % proper quotes
\RequirePackage{babel}
\RequirePackage{paralist}
\RequirePackage{engord}	  % English ordinals

% Fonts
\RequirePackage{unicode-math}
%\setmainfont[Ligatures=TeX]{XITS} % option makes -- and similar commands work
\setsansfont[
	Ligatures=TeX,
	Extension=.otf,
	UprightFont= *-regular,
	BoldFont=*-bold,
	ItalicFont=*-italic,
	BoldItalicFont=*-bolditalic,
	Scale=MatchUppercase
]{texgyretermes}
%\setmainfont[Ligatures=TeX]{XITS} % option makes -- and similar commands work
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
%\setmathfont[range=\mathscr,Scale=MatchUppercase]{FreeSerif}

% TikZ
\RequirePackage{tikz}
\usetikzlibrary{positioning,calc,arrows,decorations.markings,decorations.pathmorphing,decorations.pathreplacing,matrix}
\tikzstyle{every picture}+=[>=latex]
\tikzset{commutative diagram/.style={matrix of math nodes,column sep=2em,row sep=2em,text height=1.5ex, text depth=0.25ex}}

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
\newcommand\remark[1]{\leavevmode\marginpar{\footnotesize\itshape #1}}
\newcommand\sidepicture[2][]{\marginpar{#2\\[0.5em]{\footnotesize\itshape #1}}}

% -------------------------
% Process options and set up layout and formatting
% -------------------------

\RequirePackage{xstring}

% set options based on jobname
\IfEndWith{\jobname}{\detokenize{-kindledxlandscape}}{\kindledxlandscapetrue}{}
\IfEndWith{\jobname}{\detokenize{-kindledxportrait}}{\kindledxportraittrue}{}
\IfEndWith{\jobname}{\detokenize{-bw.tex}}{\bwtrue}{}

% set options based on class options

\DeclareOption{kindledxlandscape}{
    \bwtrue
    \kindledxtrue
    \kindledxlandscapetrue
}

\DeclareOption{kindledxportrait}{
    \bwtrue
    \kindledxtrue
    \kindledxportraittrue
}

\DeclareOption{bw}{
    \bwtrue
}    

\ProcessOptions\relax

\ifkindledxportrait\kindledxtrue\fi
\ifkindledxlandscape\kindledxtrue\fi
\ifkindledx\bwtrue\fi

% set various font options
\ifbw
    \colorlet{sectioningcolor}{black}
    \setkomafont{chapter}{\normalfont\normalcolor\sffamily\scshape\huge\color{sectioningcolor}}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\scshape\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\scshape\large\color{sectioningcolor}}
\else
    \colorlet{sectioningcolor}{cyan!15!blue}
    \setkomafont{chapter}{\normalfont\normalcolor\sffamily\huge\color{sectioningcolor}}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\large\color{sectioningcolor}}
\fi

\setkomafont{paragraph}{\normalfont\normalcolor\sffamily\bfseries}
\setkomafont{subparagraph}{\normalfont\normalcolor\sffamily\itshape}


\ifkindledx
    \AtBeginDocument{%
        \cfoot{}%
        \ohead{\pagemark}
        \renewcommand*\partpagestyle{empty}%
        \renewcommand*\chapterpagestyle{empty}%
        \renewcommand*\indexpagestyle{empty}%
    }
\else
    \AtBeginDocument{%
        \lehead{\normalfont\scshape\headmark}%
        \setheadsepline{0.4pt}[\color{black!30}]%
    }
\fi

\ifkindledxlandscape
    \RequirePackage[papersize={19.5cm,12.5cm},lmargin=0.2cm,rmargin=5cm,marginparwidth=4.5cm,marginparsep=0.3cm,bottom=0.2cm,top=0.8cm, headsep=0.3cm,footskip=0cm,twoside=false]{geometry}
\fi

\ifkindledxportrait
    \RequirePackage[papersize={13.3cm,18.8cm},lmargin=0.2cm,rmargin=0.5cm,bottom=0.2cm,top=0.8cm,headsep=0.3cm,footskip=0cm,twoside=false]{geometry}
\fi

% chapter and section in the header
\pagestyle{scrheadings}

% -------------------------
% hyperref
% -------------------------
 
\RequirePackage[colorlinks=false]{hyperref}

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
    \ifx\@typedby{\ifx\@author\@empty\else\@author\\[1cm]\fi}\else
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
