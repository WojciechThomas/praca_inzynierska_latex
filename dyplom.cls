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
\def\author#1{\gdef\@author{#1}}
\def\@author{\@latex@error{No \noexpand\author given}\@ehc}
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
\gdef\@specjalnosc{\@latex@warning@no@line{No \noexpand\specjalnosc given}\@ehc}
\def\rodzajpracy#1{\gdef\@rodzajpracy{#1}}
\gdef\@rodzajpracy{\@latex@warning@no@line{No \noexpand\rodzajpracy given}\@ehc}
\def\slowakluczowe#1{\gdef\@slowakluczowe{#1}}
% nowe pola wymagana w szablonie okładki WIZ
\gdef\@slowakluczowe{\@latex@error{No \noexpand\slowakluczowe given}\@ehc}
\def\titlen#1{\gdef\@titlen{#1}}
\gdef\@titlen{\@latex@error{No \noexpand\titlen given}\@ehc}
%
\RequirePackage{microtype}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{scrextend}
\let\lll\undefined
\RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\RequirePackage{enumerate}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{afterpage}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{float}
\RequirePackage{xstring,xifthen}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\RequirePackage{stackengine} 
\RequirePackage{tikz}
\RequirePackage{arydshln}
\definecolor{col1}{RGB}{35,31,32}
\definecolor{col2}{RGB}{255,255,255}
\def\dotfill#1{\cleaders\hbox to #1{.}\hfill}
\newcommand\dotline[2][.5em]{\leavevmode\hbox to #2{\dotfill{#1}\hfil}}
\def\dlugoscmaxa{450}  
\def\dlugoscmaxb{500}
\def\dlugoscmaxc{150}
\def\dlugoscmaxd{29}
\def\dlugoscmaxe{32}
\def\dlugoscmaxf{36} 
\def\dlugoscmaxg{80}
\RequirePackage{etoolbox}

\renewcommand\maketitle{%
	\pagenumbering{alph}%
	\thispagestyle{empty}
	\newgeometry{left=2cm, right=2cm, top=2.5cm, bottom=2.5cm}
	\begin{center}
		\textbf{\huge Politechnika Wrocławska}
		
		\vspace{.1cm}\textbf{\Large \@wydzial}
		
		\vspace{-.3cm}\rule{\textwidth}{.1pt}
	\end{center}
	\begin{flushleft}
		\begin{minipage}[t]{4cm}
			\begin{tabular}{ l l }
				Kierunek studiów: \textbf{\@kierunek} \\
				
				%Uncomment if speciality is required
				% Speciality:     & \textbf{\@specjalnosc} \\ 
			\end{tabular}
		\end{minipage}
	\end{flushleft}
	
	\vspace{2cm}
	\begin{center}
		{\Huge {\MakeUppercase{
					Praca \if@inzynier inżynierska \fi%
					\if@magister magisterska \fi}}}\\
		\vspace{0cm plus .3fill}
		\StrLen{\@title}[\tytuldlugosc]
		\ifthenelse{\tytuldlugosc > \dlugoscmaxg}{
			\Large
			\textbf{\@title}\\
		}{
			\huge\textbf{\@title}\\
		}
		
		\vspace{.5cm}{\Large\@author}
		
		\vspace{2cm}{\normalsize Opiekun pracy}
		
		\vspace{-.4cm}{\Large\@promotor}
	\end{center}
	\vspace{\fill}
	
	\begin{flushleft}
		\normalsize Słowa kluczowe: \@slowakluczowe
	\end{flushleft}
	
	\vspace{-.7cm}
	\begin{center}   
		\rule{\textwidth}{.2pt}
		
		\vspace{-.2cm}\large Wrocław \the\year
	\end{center}

\cleardoublepage
\restoregeometry
\pagenumbering{arabic}
}

\renewcommand{\abstract}[2]{

% Abstract nie pojawia się w spisie treści
\addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
\begingroup
	\chapter*{Streszczenie} % po polsku
	#1
	% Abstract pojawił się na tej samej stronie co Streszczenie
	\renewcommand{\cleardoublepage}{}
	\renewcommand{\clearpage}{}
	\chapter*{Abstract} % ...i to samo po angielsku
	#2
\endgroup
\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}	
}
% patch wyrównujący spis listingów do lewego marginesu 
%https://tex.stackexchange.com/questions/58469/why-are-listof-and-listoffigures-styled-differently
\makeatletter
\renewcommand*{\listof}[2]{%
	\@ifundefined{ext@#1}{\float@error{#1}}{%
		\expandafter\let\csname l@#1\endcsname \l@figure  % <- use layout of figure
		\float@listhead{#2}%
		\begingroup
		\setlength\parskip{0pt plus 1pt}%               % <- or drop this line completely
		\@starttoc{\@nameuse{ext@#1}}%
		\endgroup}}
\makeatother

\RequirePackage{url}
\RequirePackage{minted}

% otoczenie do składania listingów
\RequirePackage{float}
\newfloat{listing}{htp}{lop}
\floatname{listing}{Listing}
\RequirePackage{chngcntr}
\counterwithin{listing}{chapter}

\endinput % dla porządku
