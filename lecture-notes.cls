\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{caramdir-lecturenotes}[2010/11/06 v0.1 My documentclass for lecture notes]

\LoadClassWithOptions{scrbook}

\def\ck@thmreset{chapter}   % reset theorem counter each chapter

% Load some packages before hyperref
\RequirePackage{makeidx}
\RequirePackage{index}
\RequirePackage[noprefix,refpage,intoc]{nomencl}


\input{ck-general-setup.tex}

\KOMAoptions{
    open=right, % start chapters on a right page
}

% set various font options
\ifbw
    \setkomafont{chapter}{\normalfont\normalcolor\sffamily\scshape\huge\color{sectioningcolor}}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\scshape\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\scshape\large\color{sectioningcolor}}
\else
    \setkomafont{chapter}{\normalfont\normalcolor\sffamily\huge\color{sectioningcolor}}
    \setkomafont{section}{\normalfont\normalcolor\sffamily\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\large\color{sectioningcolor}}
\fi

\setkomafont{paragraph}{\normalfont\normalcolor\sffamily\bfseries}
\setkomafont{subparagraph}{\normalfont\normalcolor\sffamily\itshape}


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
\fi

\ifkindledxlandscape
    \RequirePackage[papersize={19.5cm,12.5cm},lmargin=0.2cm,rmargin=5cm,marginparwidth=4.5cm,marginparsep=0.3cm,bottom=0.2cm,top=0.8cm, headsep=0.3cm,footskip=0cm,twoside=false]{geometry}
\fi

\ifkindledxportrait
    \RequirePackage[papersize={13.3cm,18.8cm},lmargin=0.2cm,rmargin=0.5cm,bottom=0.2cm,top=0.8cm,headsep=0.3cm,footskip=0cm,twoside=false]{geometry}
    \renewcommand\remark\footnote
\fi

% chapter and section in the header
\pagestyle{scrheadings}

% Index
\makeindex
\appto\theindex{%
	\markboth{\indexname}{\indexname}%
	\addcontentsline{toc}{chapter}{\indexname}%
}

% List of Notation
\renewcommand\nomname{List of Notation}
\renewcommand{\pagedeclaration}[1]{\hfill #1}
\makenomenclature

% Backmatter formatting
\appto\backmatter{%
	\ifkindledx\else%
		\rohead{\normalfont\scshape\headmark}%
	\fi%
}

% pdf info
\AtBeginDocument{%
	\hypersetup{
		pdfinfo={
			Title={\@title},
			Author={\ifx\@author\@empty\ifx\@typedby\@empty\else\@typedby\fi\else\@author\fi}
		}
	}%
}

% -------------------------
% The title page
% -------------------------
\let\@author\@empty%
\let\@course\@empty%
\newcommand{\course}[1]{\gdef\@course{#1}}%
\let\@courseinfo\@empty%
\newcommand{\courseinfo}[1]{\gdef\@courseinfo{#1}}%
\let\@typedby\@empty%
\newcommand{\typedby}[1]{\gdef\@typedby{#1}}%
\let\@version\@empty%
\newcommand{\version}[1]{\gdef\@version{#1}}%
\let\@disclaimer\@empty%
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
The used fonts are \@mainfont, \@sansfont, \@monofont{} and \@mathfont.
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
