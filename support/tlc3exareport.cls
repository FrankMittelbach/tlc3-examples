%%
%% The LaTeX Companion, 3rd ed
%%
%% Example ``report class for use with the Companion examples.
%%
%% Copyright (C) 2017-2022 Frank Mittelbach
%%
%% It may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%%
%% See https://www.latex-project.org/lppl.txt for details.
%%

\LoadClass{report}

\RequirePackage[T1]{fontenc}

\RequirePackage{tgtermes}
\RequirePackage[matchuppercase]{tgheros}

\renewcommand{\ttdefault}{lmtt}

\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax

\let\ps@origplain\ps@plain
\let\ps@plain\ps@empty % this class doesn't produces page numbers
                       % since this would make examples too big
                       % but if necessary there is origplain


% Improve \LaTeX and \TeX logo when used with slanted fonts

\DeclareRobustCommand\TeX{T%
  \ifdim\fontdimen1\font>\z@ \kern-.04em\fi     % new
  \kern-.1667em\lower.5ex\hbox{E}%
  \ifdim\fontdimen1\font>\z@ \kern.07em\fi      % new
  \kern-.125emX\@}

\DeclareRobustCommand{\LaTeX}{L%
  \ifdim\fontdimen1\font>\z@ \kern.1em\fi       % new
  \kern-.36em%
        {\sbox\z@ T%
         \vbox to\ht\z@{\hbox{\check@mathfonts
                              \fontsize\sf@size\z@
                              \math@fontsfalse\selectfont
                              A}%
                        \vss}%
        }%
        \kern-.15em%
        \TeX}

% Book version restricts to two colors. This is set up in the
% code below after \endinput.
%
\endinput


% As the book is printed in two colors only (black and blue) we need
% to ensure that other colors are replaced by gray if necessary:

\AddToHook{begindocument/before}{
\ifx\color\@undefined
\else
  \usepackage{colorspace}
  \definespotcolor{blue}{PANTONE 3005 U}{1,0.56,0,0} % what we call ``blue'' in this book
%
  \definecolor{red}{gray}{.7}
  \definecolor{green}{gray}{.8}
  \definecolor{yellow}{gray}{.9}
%
  \definecolor{orange}{gray}{.75}      % for todo notes
  \definecolor{chaptergrey}{gray}{0.6} % for quotechap example
\fi
}

\endinput

