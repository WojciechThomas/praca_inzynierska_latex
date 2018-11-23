\NeedsTeXFormat{LaTeX2e} % dla pełnej jasności
\ProvidesClass{dyplom} % jedyny niezbędny element klasy :-)
%% Opcje
% magister – strona tytułowa magisterska
% inzynier – strona tytułowa inzynierska
% archiwum – wersja do archiwum (wedlug zalecen ze strony)
% druk – wersja do druku (dla promotora)
\newif\if@archiwum
\newif\if@druk
\newif\if@inzynier
\newif\if@magister
\newif\if@ramka
\@inzyniertrue
\@archiwumtrue
\@ramkafalse
\DeclareOption{archiwum}{\@archiwumtrue\@drukfalse}
\DeclareOption{druk}{\@druktrue\@archiwumfalse}
\DeclareOption{inzynier}{\@inzyniertrue\@magisterfalse}
\DeclareOption{magister}{\@magistertrue\@inzynierfalse}
\DeclareOption{ramka}{\@ramkatrue}
\DeclareOption*{%                               wszystkie opcje
  \PassOptionsToClass{\CurrentOption}{mwrep}} % mają być przekazywane
                                              % do klasy mwrep
\ProcessOptions
\if@archiwum
\LoadClass[12pt,openany,doublesided]{mwrep} % ładujemy klasę bazową, do opcji
                                % podanych w dokumencie dodajemy 12pt
                                % i openany oraz doublesided
\fi
\if@druk
\LoadClass[12pt]{mwrep} % ładujemy klasę bazową, do opcji
                                % podanych w dokumencie dodajemy 12pt
\fi
\RequirePackage[OT4]{polski}      % odpowiednik \usepackage
%\RequirePackage[utf8]{inputenc} % to właściwie powinno być na zewnątrz
\RequirePackage{array,graphicx} 
\if@archiwum
\RequirePackage[a4paper,left=25mm,right=25mm,top=25mm,bottom=25mm]{geometry}
\fi
\if@druk
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage[a4paper,left=35mm,right=25mm,top=25mm,bottom=25mm]{geometry}
\fi
\RequirePackage{tgtermes}
\RequirePackage[absolute]{textpos} % to na potrzeby strony tytułowej
\RequirePackage{xcolor} % na potrzeby strony tytułowej
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}
%%% Tytularia
%\renewcommand*\sectsettings{}
%% chapter -- pierwszy stopień
\SetSectionFormatting[breakbefore,wholewidth]{chapter}
        {56\p@}
        {\FormatBlockHeading{\normalsize\bfseries\MakeUppercase}}
        {24\p@}
%% section -- drugi stopień
\SetSectionFormatting{section}
        {24\p@\@plus5\p@\@minus2\p@}
        {\FormatHangHeading{\footnotesize\bfseries\MakeUppercase}}
        {10\p@\@plus3\p@}
%% subsection -- ewentualny trzeci poziom
\SetSectionFormatting{subsection}
        {16\p@\@plus4\p@\@minus1\p@}
        {\FormatHangHeading{\footnotesize\rmfamily\bfseries}}
        {6\p@\@plus2\p@}

%%% Floaty
%% Rysunki
\renewcommand\figurename{Rys.}

%%% Strona tytułowa
\def\promotor#1{\gdef\@promotor{#1}}
\def\@promotor{\@latex@error{No \noexpand\promotor given}\@ehc}
\def\konsultant#1{\gdef\@konsultant{#1}}
%% Zakładam, że konsultanci nie będą występowali zbyt często.
%% Na kartę trafią tylko wtedy gdy będą...
\def\wydzial#1{\gdef\@wydzial{#1}}
\def\@wydzial{Wydzia{\l} Mechaniczny}
\def\kierunek#1{\gdef\@kierunek{#1}}
\gdef\@kierunek{IPS}
\def\specjalnosc#1{\gdef\@specjalnosc{#1}}
\gdef\@specjalnosc{\@latex@warning@no@line{No \noexpand\specjalnosc given}}
\def\kluczowe#1{\gdef\@kluczowe{#1}}
\def\@kluczowe{\@latex@error{No \noexpand\kluczowe given}\@ehc}
\def\streszczenie#1{\gdef\@streszczenie{#1}}
\def\@streszczenie{\@latex@error{No \noexpand\streszczenie given}\@ehc}
\def\titlen#1{\gdef\@titlen{#1}}
\def\@titlen{\@latex@error{No \noexpand\titlen given}\@ehc}
%
\renewcommand\maketitle{\begin{titlepage}%
\pagenumbering{alph}%
\begin{textblock*}{210mm}(0mm,0mm)
\noindent\unitlength1mm%
\begin{picture}(0,0)
\put(25,-45){\line(1,0){170}}
\put(25,-272){\line(1,0){170}}
\put(132,-33){\makebox(0,0)[cb]{\fontsize{22pt}{24pt}\usefont{T1}{ugm}{m}{n}\MakeUppercase POLITECHNIKA WROC\L AWSKA}}%
\put(132,-42){\makebox(0,0)[cb]{\fontsize{20pt}{24pt}\usefont{T1}{ugm}{m}{n}\MakeUppercase\@wydzial}}%
\put(25,-59){\makebox(0,0)[lb]{\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}KIERUNEK: \@kierunek}}
\if@ramka\definecolor{jasnoszary}{rgb}{.92 .92 .92}%
\textcolor{jasnoszary}{%
\put(68,-186){\rule{128mm}{4mm}}\put(68,-186){\rule{4mm}{80mm}}
\put(68,-110){\rule{128mm}{4mm}}\put(192,-186){\rule{4mm}{80mm}}
}\else\fi
\if@inzynier
 \put(132,-96){\makebox(0,0)[cb]{\parbox{115mm}{\centering\fontsize{24pt}%
  {28pt}\usefont{T1}{ugm}{m}{n}PRACA DYPLOMOWA\linebreak{}IN\.ZYNIERSKA}}}%
\fi
\if@magister
 \put(132,-96){\makebox(0,0)[cb]{\parbox{115mm}{\centering\fontsize{24pt}%
  {28pt}\usefont{T1}{ugm}{m}{n}PRACA DYPLOMOWA\linebreak{}MAGISTERSKA}}}%
 \put(25,-67){\makebox(0,0)[lb]{\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}SPECJALNO\'S\'C: \@specjalnosc}}
\fi
\put(132,-115){\makebox(0,0)[t]{\parbox{115mm}{\centering\fontsize{16pt}{18pt}\usefont{T1}{ugm}{m}{n}\@title\\[6pt]\@titlen\par}}}%
\put(132,-180){\makebox(0,0)[b]{\parbox{115mm}{\centering\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}AUTOR:\linebreak\@author}}}%
%\put(192,-197){\makebox(0,0)[tr]{\parbox{115mm}{\fontsize{12pt}{14pt}\usefont{T1}{ugm}{m}{n}\raggedleft s{\l}owa kluczowe:\\\@kluczowe}}}%
%\put(72,-237){\makebox(0,0)[tl]{\parbox{115mm}{\fontsize{10pt}{12pt}\usefont{T1}{ugm}{m}{n}\raggedright kr\'otkie streszczenie:\\\@streszczenie}}}%
\put(132,-282){\makebox(0,0)[bc]{\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n} WROC{\L}AW \number\year}}%
\put(132,-213){\makebox(0,0)[b]{\parbox{115mm}{\centering\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}PROMOTOR:\linebreak \@promotor}}}%
\ifundefined{@konsultant}
\else
\put(132,-227){\makebox(0,0)[b]{\parbox{115mm}{\centering\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}KONSULTANT:\linebreak \@konsultant}}}%
\fi
\put(132,-238){\makebox(0,0)[b]{\parbox{115mm}{\centering\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}OCENA PRACY:}}}%
\end{picture}
\end{textblock*}
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \mbox{}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@titlen\@empty
  \global\let\@wydzial\@empty
  \global\let\@streszczenie\@empty
  \global\let\@kluczowe\@empty
  \global\let\@promotor\@empty
  \global\let\title\relax
  \global\let\titlen\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\streszczenie\relax
  \global\let\wydzial\relax
  \global\let\kluczowe\relax
  \global\let\promotor\relax
  \pagenumbering{arabic}
}
\endinput % dla porządku
