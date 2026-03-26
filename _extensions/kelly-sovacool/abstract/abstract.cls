%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% manuscript.cls
%
% Derived from the asm-article.cls, v1.3 2020/02/06
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manuscript}[2020/02/06, v1.3]

%% Definitions for adding placeholder journal elements
\def\@jlogo{}
\def\@jname{}
\def\@jyear{}
\def\@jpages{}
\def\@jvolume{}
\def\@jissue{}
\def\@jwebsite{}

\def\@affil{}
\def\@runningauthor{}
\def\@runningtitle{}
\def\@corraddress{}
\def\@equalcontrib{}

\def\@papertype{}
\def\@paperfield{}
\def\@paperdoi{}
\def\@showpagenumber{true}

\ProcessOptions\relax


\LoadClass[11pt]{article}

\sloppy

\newcommand{\jlogo}[1]{\def\@jlogo{#1}}
\newcommand{\jname}[1]{\def\@jname{#1}}
\newcommand{\jyear}[1]{\def\@jyear{#1}}
\newcommand{\jvolume}[1]{\def\@jvolume{#1}}
\newcommand{\jissue}[1]{\def\@jissue{#1}}
\newcommand{\jpages}[1]{\def\@jpages{#1}}
\newcommand{\jwebsite}[1]{\def\@jwebsite{#1}}

\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}
\newcommand{\runningtitle}[1]{\def\@runningtitle{#1}}
\newcommand{\corraddress}[1]{\def\@corraddress{#1}}
\newcommand{\equalcontrib}[1]{\def\@equalcontrib{#1}}


\newcommand{\paperdoi}[1]{\def\@paperdoi{#1}}
\newcommand{\papertype}[1]{\def\@papertype{#1}}
\newcommand{\paperfield}[1]{\def\@paperfield{#1}}
\newcommand{\showpagenumber}[1]{\def\@showpagenumber{#1}}


%% Fonts
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{fbb}
\RequirePackage[default,scale=0.82]{opensans}
\RequirePackage[scaled=0.82]{newtxsf}
\renewcommand{\ttdefault}{\sfdefault}

\RequirePackage{xpatch}
\RequirePackage{textcase}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{tikz,pgffor}
\RequirePackage{mdframed}
\RequirePackage{changepage}
\RequirePackage{enumitem}
\RequirePackage[mathlines]{lineno}

%% Colours
\definecolor{sectioncolor}{HTML}{000000}

%% Page geometry
\RequirePackage[letterpaper,
left=1in,right=1in,
top=1in,bottom=1in,
columnsep=2em,headheight=12pt,
headsep=0in,footskip=0.25in,
marginparwidth=0in,marginparsep=0.2in,
includehead,includefoot,heightrounded,
]{geometry}

\newenvironment{fullwidth}{\begin{adjustwidth}{}{-2.35in}}{\end{adjustwidth}}

%% Title and author block

\RequirePackage{authblk}
\renewcommand\Authfont{\bfseries}
\renewcommand\Affilfont{\normalfont}
\setlength{\affilsep}{0.3em}
%\newcommand{\corrauthor}[2][]{\affil[#1]{Correspondence: #2}}
\renewcommand{\maketitle}{%
  %\null%
  {\noindent\bfseries\centering\huge\@title\par}
  \vskip\baselineskip
  {\noindent\bfseries\raggedright\normalfont
  \@author
  \par}
  {\noindent\raggedright\scriptsize
  \@affil
  \par
  \ifdefstring{\@equalcontrib}{}{}{\@equalcontrib\par}}%
  \vskip0.5\baselineskip
  \thispagestyle{firstpage}%
}


\newcommand{\infobox}{%
\begin{mdframed}%
[backgroundcolor=black!10,
 font=\scriptsize,
 hidealllines=true,
 innerleftmargin=1em,
 innerrightmargin=1em,
 innertopmargin=1em,
 innerbottommargin=1em]%
\setlength{\parskip}{0.5em}%
\textbf{Compiled} \today\\
%This is a draft manuscript, pre-submission\par
\textsuperscript{\textdagger}Correspondence: \@corraddress.\par
\end{mdframed}
}

\newcommand{\correspondence}[1]{\par\noindent\raggedright\textsuperscript{\textdagger}Correspondence: \@corraddress\par\vskip0.5\baselineskip}


%% Coloured abstract
\RequirePackage[runin]{abstract}
\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}
\setlength{\abstitleskip}{-\parindent}
\renewcommand{\abstractname}{ABSTRACT}
\renewcommand{\abstractnamefont}{\bfseries\color{sectioncolor}\scshape}
\renewcommand{\abstracttextfont}{\normalfont}
\abslabeldelim{\quad}
\appto\abstract{
\newenvironment{importance}
  {\newline\noindent{\abstractnamefont IMPORTANCE}\@bslabeldelim}{}
}

% \newcommand{\projectwebsite}[1]{{\raggedright\textbf{\color{sectioncolor}PROJECT WEBSITE:}\hspace{0.3em}#1\par}\vspace{\baselineskip}}
% \newcommand{\sourcecode}[1]{{\raggedright\textbf{\color{sectioncolor}SOURCE CODE:}\hspace{0.3em}#1\par}\vspace{\baselineskip}}
% \newcommand{\license}[1]{{\raggedright\textbf{\color{sectioncolor}LICENSE:}\hspace{0.3em}#1\par}\vspace{\baselineskip}}

\newenvironment{project_website}
  {\par\noindent\textbf{\color{sectioncolor}PROJECT WEBSITE:}\hspace{0.3em}\raggedright}
  {\par}

\newenvironment{source_code}
  {\par\noindent\textbf{\color{sectioncolor}SOURCE CODE:}\hspace{0.3em}\raggedright}
  {\par}

\newenvironment{license_txt}
  {\par\noindent\textbf{\color{sectioncolor}LICENSE:}\hspace{0.3em}\raggedright}
  {\par}

\newcommand{\keywords}[1]{{\raggedright\textbf{\color{sectioncolor}KEYWORDS:}\hspace{0.3em}#1\par}\vspace{\baselineskip}}

%% Headers
\RequirePackage{fancyhdr}
\addtolength{\headwidth}{\marginparsep}
\addtolength{\headwidth}{\marginparwidth}
\renewcommand{\headrule}{}
\fancyhf{}
\lhead{\footnotesize{\@runningauthor}}
\rhead{\footnotesize{\@runningtitle}}
\lfoot{}
\rfoot{\footnotesize\@jwebsite\ifdefstring{\@pagenumbers}{true}{\quad\textbf{\thepage}}{}}
%\cfoot{%
%  \tikz[remember picture,overlay]
%  \node[transform shape,rotate=90,anchor=north,yshift=-6pt,text=gray] at (current page.west)
%  {\foreach \n in {1,...,10}{Author Manuscript Preprint \hspace{1em}}};
%}
\pagestyle{fancy}

\fancypagestyle{firstpage}{
  \pagestyle{fancy}%
  \lfoot{}%
  \lhead{}
  \rhead{%
    \textcolor{sectioncolor}{\bfseries\MakeUppercase{\@papertype}}\\%
    \@paperfield%
  }
}

%% Drop-cap
\RequirePackage{lettrine}
\renewcommand{\LettrineFontHook}{\bfseries\color{gray}}
\newcommand{\dropcap}[2][]{\lettrine[#1,nindent=0pt,lines=2,loversize=0.05]{#2}{}}

%% Sectional headings
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\bfseries\color{sectioncolor}}
  {}{0pt}{\MakeTextUppercase{#1}}
\titlespacing*{\section}{0pt}{\baselineskip}{0pt}
\titleformat{\subsection}[runin]
  {\bfseries}
  {}{0pt}{#1}
\titlespacing*{\subsection}
{\parindent}
{0pt}{0.3em}

%% Disable \subsubsection, \paragraph, \subparagraph
%\let\subsubsection\relax
%\let\paragraph\relax
%\let\subparagraph\relax

%% Citations and References (page-width, 2 columns)
\RequirePackage[numbers,round]{natbib}
\RequirePackage{multicol}
\RequirePackage[noperiod]{jabbrv}
\DefineJournalAbbreviation{National}{Natl}
%% Renamed vancouver-asm.bst to msystems.bst on 12 July, 2019
\bibliographystyle{msystems}
\renewcommand{\bibnumfmt}[1]{\makebox[1.5em][l]{#1.}}
\renewcommand{\bibfont}{\footnotesize}
\setlength{\bibsep}{0pt}
\renewcommand{\bibpreamble}{%
  \nolinenumbers%
  \setlength{\multicolsep}{0pt}
}
\preto{\endthebibliography}{}

%% Lists
\RequirePackage{enumitem}
\setlist{nosep,labelindent=\parindent}

%% Tables
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\newcommand{\tnote}[1]{\textsuperscript{\textit{#1}}}
\newlist{tablenotes}{description}{1}
\setlist[tablenotes]{labelsep=0pt,format=\mdseries\itshape\textsuperscript}

% http://tex.stackexchange.com/a/266441/226
\newcommand*{\belowrulesepcolor}[1]{%
  \noalign{%
    \kern-\belowrulesep
    \begingroup
      \color{#1}%
      \hrule height\belowrulesep
    \endgroup
  }%
}
\newcommand*{\aboverulesepcolor}[1]{%
  \noalign{%
    \begingroup
      \color{#1}%
      \hrule height\aboverulesep
    \endgroup
    \kern-\aboverulesep
  }%
}
\colorlet{tableheadcolor}{black!20}
\newcommand{\headrow}{\rowcolor{tableheadcolor}}
\newcommand{\headrowfillerT}{\belowrulesepcolor{tableheadcolor}}
\newcommand{\headrowfillerB}{\aboverulesepcolor{tableheadcolor}}
\apptocmd{\tablenotes}{\footnotesize}{}{}

% Left-, right- and center-aligned auto-wrapping column types
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}

%% Captions
\RequirePackage[singlelinecheck=false]{caption}
\renewcommand{\figurename}{FIG}
\renewcommand{\tablename}{TABLE}
\DeclareCaptionFont{eb}{\fontseries{eb}\selectfont}
\captionsetup*{labelsep=quad}
\captionsetup*[figure]{font={small},labelfont={eb}}
\captionsetup*[table]{labelfont=bf,position=above,skip=0pt}

%% Enable coloured links
\RequirePackage[hyphens]{url}
\RequirePackage[colorlinks,allcolors=blue,breaklinks]{hyperref}
\urlstyle{same}

%% Quarto compatibility
\providecommand{\pandocbounded}[1]{#1}
