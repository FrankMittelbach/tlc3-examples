%%
%% The LaTeX Companion, 3rd ed
%%
%% Copyright (C) 2017-2022 Frank Mittelbach
%%
%% It may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%%
%% See https://www.latex-project.org/lppl.txt for details.
%%
%
\LoadClass[twoside]{article}

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
% \endinput


% As the book is printed in two colors only (black and blue) we need
% to ensure that other colors are replaced by gray if necessary:

%shadings defined in the preamble muss use cmyk:
\PassOptionsToPackage{cmyk}{xcolor}

\AddToHook{package/xcolor/after}{%
   \def\XC@col@rlet[#1]#2[#3]#4%
 {\begingroup
  \edef\@@cls{#1}\XC@edef\@@nam{#2}\XC@sdef\@@mod{#3}\XC@edef\@@clr{#4}%
  \XC@info\@@clr\@@tmp\XC@@tstfalse
  \ifnum\@@tmp<2 \ifx\@@mod\@empty %instead of =\@ne
    \ifx\@@cls\@empty
      \XC@@tsttrue
    \else
      \edef\@@tmp
       {\expandafter\expandafter\expandafter\@secondoffive
         \csname\@backslashchar color@\@@clr\endcsname}%
      \ifx\@@cls\@@tmp\XC@@tsttrue\fi
    \fi
  \fi\fi
  \ifXC@@tst
    \XC@logdef\@@nam\XC@c@l@rlet\@@nam\@@clr
  \else
    \extractcolorspec\@@clr\@@clr
    \ifx\@@mod\@empty\else
      \expandafter\convertcolorspec\@@clr\@@mod\@@clr
      \edef\@@clr{{\@@mod}{\@@clr}}\fi
    \edef\@@tmp{\noexpand\XC@definecolor[\@@cls]{\@@nam}\@@clr}%
  \fi
  \expandafter\endgroup\@@tmp\xglobal@stop}%
}

\ExplSyntaxOn
%if the color is not a spot color, color space shouldn't set it.
%this is a simple test looking if the specification starts with a /:
\AddToHook{package/colorspace/after}{%
\cs_set:cpn {pgfsys@color@&spot@fill} #1{%
  \spc@getir{\string\color@pgffillcolor}%
  \tl_if_head_eq_charcode:fNT {\spc@ir}/
  {
    \pgfsysprotocol@literal{\spc@ir\space cs}%
    \pgfsysprotocol@literal{#1~sc}
  }}
\cs_set:cpn {pgfsys@color@&spot@stroke} #1{%
  \spc@getir{\string\color@pgfstrokecolor}%
  \tl_if_head_eq_charcode:fNT {\spc@ir}/
   {
     \pgfsysprotocol@literal{\spc@ir\space CS}%
     \pgfsysprotocol@literal{#1~SC}
   }}}

%for the deviceN we need to declare a few pgf commands
% they don't harm if not used
\def\pgfsys@color@bluexblack@fill#1#2{
 \spc@getir{\string\color@pgffillcolor}
  \tl_if_head_eq_charcode:fNT {\spc@ir}/
   {
     \pgfsysprotocol@literal{\spc@ir\space cs}%
     \pgfsysprotocol@literal{#1~#2~scn}
   }}

\def\pgfsys@color@bluexblack@stroke#1#2{
 \spc@getir{\string\color@pgfstrokecolor}
  \tl_if_head_eq_charcode:fNT {\spc@ir}/
   {
     \pgfsysprotocol@literal{\spc@ir\space CS}%
     \pgfsysprotocol@literal{#1~#2~SCN}
   }}

\def\pgfsys@color@bluexblack#1#2{\pgfsys@color@bluexblack@stroke{#1}{#2}%
  \pgfsys@color@bluexblack@fill{#1}{#2}}
\ExplSyntaxOff


\AddToHook{begindocument/before}{
\ifx\color\@undefined
\else
  \def\pgfutil@colorlet#1#2{\colorlet{#1}{#2}}
  %in case it hasn't been loaded
  \usepackage{xcolor}

  %we need natural model when setting up the spot colors
  \selectcolormodel{natural}
  \usepackage{colorspace}
  \definespotcolor{blue}{PANTONE 3005 U}{1,0.56,0,0}      % what we call ``blue'' in this book
  \definecolorspace{bluexblack}{mixed}{blue,black}
  \definecolor{spotblack}{bluexblack}{0,1}
  \definecolor{spotblue}{bluexblack}{1,0}

  %
  \definecolor{red}{gray}{.7}
  \definecolor{green}{gray}{.8}
  \definecolor{yellow}{gray}{.9}
  %
  \definecolor{orange}{gray}{.75}      % for todo notes
  %for shadings defined later
  \selectcolormodel{cmyk}
  %don't convert colors anymore!
  \convertcolorsUfalse
  \convertcolorsDfalse
\fi
}


% for margin rules in math examples we need color to make them
% blue. So in this class color is actually always present:

\RequirePackage{color}

\newcommand \EX@rulewidth {0.25pt}

%% Keep on hacking!
\newcommand \SetupMarginLines{%
%  
% with new kernel this should use a later hook ...
% \AtBeginDocument
  \AddToHook{begindocument/end}%
     {\hbox\bgroup \kern-\EX@rulewidth
      {\color{blue}\vrule width \EX@rulewidth}%
      \vbox\bgroup}%
  \AtEndDocument
     {\egroup       
      {\color{blue}\vrule width \EX@rulewidth}%
      \kern-\EX@rulewidth \egroup}%   
}


\SetupMarginLines


\endinput

