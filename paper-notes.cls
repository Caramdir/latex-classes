\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper-notes}[2011/07/22 v0.1 My documentclass for notes on papers]

\newif\ifbw

\LoadClassWithOptions{notes}

\let\ck@paperref\@empty
\def\paperref#1{%
    \def\ck@paperref{#1}%
    \title{Notes on: \citeauthor{#1} --- \citetitle{#1}}%
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
    {\titlefont%
	 {\normalcolor Notes on:}\\%
     {\Large\citeauthor{\ck@paperref}\\}%
	 \citetitle{\ck@paperref}%
	 {\normalcolor\cite{\ck@paperref}}\par%
	}%
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
