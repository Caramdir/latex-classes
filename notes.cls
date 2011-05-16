\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{caramdir-notes}[2011/01/30 v0.1 My documentclass for notes]

\newif\ifbw

\LoadClassWithOptions{scrartcl}

\input{ck-general-setup.tex}

\KOMAoptions{numbers=enddot}

% set various font options
\ifbw
    \setkomafont{section}{\normalfont\normalcolor\sffamily\scshape\Large\color{sectioningcolor}}
    \setkomafont{subsection}{\normalfont\normalcolor\sffamily\scshape\large\color{sectioningcolor}}
\else
    \setkomafont{title}{\normalfont\normalcolor\scshape\LARGE\color{sectioningcolor}}
    \setkomafont{section}{\normalfont\normalcolor\scshape\large\color{sectioningcolor}\centering}
    \setkomafont{subsection}{\normalfont\normalcolor\scshape\color{sectioningcolor}}
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

% -------------------------
% Title
% -------------------------

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
    {\titlefont \@title \par}%
    \vskip .5em
    {\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
    \vskip 1em
    {\scshape
      \lineskip .5em%
      \begin{tabular}[t]{c}
        \@author
      \end{tabular}\par
    }%
    {\scshape \@date \par}%
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
