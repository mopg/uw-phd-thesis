%%
%% MIT LaTeX Thesis Class
%%

\ProvidesClass{mitthesis}
\NeedsTeXFormat{LaTeX2e}

% Based on the memoir class
\newcommand{\draftstring}{}
\DeclareOption{draftversion}{\renewcommand{\draftstring}{[draft: \today]}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass{memoir}


%%
%% Fixes
%%
\RequirePackage{memhfixc}

\RequirePackage{lipsum}

% Constant spacing between paragraphs
\raggedbottom

%%
%% Fonts
%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{newpxtext}
\RequirePackage{newpxmath}
\useosf % old-style figures in text, not in math
\newcommand{\lowercapsss}[1]{\textls[40]{\textsc{\MakeLowercase{#1}}}}
\newcommand{\lowercaps}[1]{\textls[70]{\textsc{\MakeLowercase{#1}}}}
\newcommand{\uppercaps}[1]{\textls[120]{\textsc{\MakeUppercase{#1}}}}
\newcommand{\uppercapsss}[1]{\textsc{\MakeUppercase{#1}}}

\newcommand*{\myliningnumfont}{\fontfamily{ppl}\selectfont}


% verbatim fonts
\RequirePackage[scaled=.85]{beramono}
\RequirePackage{fancyvrb}

%%
%% Page layout -- per UW, everything needs to be within 1in of the edge of the page
%%
\RequirePackage[letterpaper,
      top=1in,
      bottom=1in,
      right=2.75in,
      left=1in,
      includefoot,% footnote is also included in the 1in margin
      marginparwidth=1.6in,
      marginparsep=0.15in,
      asymmetric,
      ignoremp]{geometry}

% \settypeblocksize{*}{\textwidth}{2}
\setsidecaps{0.15in}{1.6in}
\setmarginnotes{0.15in}{1.6in}{6pt}
\sideparmargin{right}%
\sidecapmargin{right}
\setsidecappos{b}

\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}
\setlength{\textfloatsep}{14pt}% plus 0.0pt minus 0.0pt}
\setlength{\intextsep}{14pt}% plus 0.0pt minus 0.0pt}
\setlength{\floatsep}{0pt}% plus 0.0pt minus 0.0pt}

% Full-size figures
\newlength\marginextra\marginextra=1.75in
\newlength\fullwidth\fullwidth=\textwidth
\advance\fullwidth by \marginextra

\newcounter{fullfigcnt}

\newlength{\fullwidthlen}
\setlength{\fullwidthlen}{\marginparwidth}
\addtolength{\fullwidthlen}{\marginparsep}
\strictpagechecktrue
\newlength\zzza
\newlength\zzzb
\newenvironment{fullwidthfig}{%
  \begin{adjustwidth}{0em}{-\wholemargin}%
}{%
  \end{adjustwidth}%
}

\let\savedCaption=\caption
\newcommand*{\captionb}[3][\shortcaption]{%
  \def\shortcaption{#2}%
  \sidepar{\vspace{2pt}%
  \savedCaption[#1]{#2}\label{#3}}%
  \vspace{-0.26in}%
}

% No orphans
\clubpenalty = 500
\widowpenalty = 1000

% Add or remove lines from facing pages
\RequirePackage{addlines}

%%
%% Line breaking
%%

\RequirePackage[final=true,step=1]{microtype}
\RequirePackage{ragged2e}

%%
%% Colors
%%

\RequirePackage[table,pdftex,dvipsnames]{xcolor}

\definecolor{MITred}{RGB}{163, 31, 52}
\definecolor{MITdg}{RGB}{138, 139, 140}
\definecolor{MITlg}{RGB}{194, 192, 191}
\definecolor{AAblue}{RGB}{0, 23, 63}
\definecolor{AAMITmix}{RGB}{82, 27, 58}

\definecolor{UWpurple}{RGB}{50, 0, 110} % #32006e

\definecolor{redc}{RGB}{230, 50, 50}
\definecolor{bluec}{RGB}{0, 70, 150}
\definecolor{greenc}{RGB}{50, 140, 80}

\definecolor{red}{HTML}{AD1737}
\definecolor{brown}{HTML}{990000}
\definecolor{bar}{HTML}{8D9965}

\colorlet{chapnum}{UWpurple}
\definecolor{largeornament}{gray}{0.85}
\definecolor{smallornament}{gray}{0.65}

\colorlet{title}{black}
\colorlet{partnum}{UWpurple}
\colorlet{tocchapnum}{UWpurple}


%%
%% Graphics
%%

\RequirePackage{float}
\RequirePackage{morefloats}
\RequirePackage{graphicx}
\RequirePackage{epstopdf}
\RequirePackage{subfig} % subcaptions for subfigures
\RequirePackage{varwidth} % package to limit the width of tikzpictures
\RequirePackage{fixltx2e} % make sure list of figures is ordered correctly

\RequirePackage{tikz}
\RequirePackage{adjustbox}
\RequirePackage{pgfplots}
\usetikzlibrary{arrows,shapes,positioning,shadows,trees,patterns,intersections,matrix,fit,backgrounds}
\pgfplotsset{compat=newest}
  \pgfplotsset{plot coordinates/math parser=false}
\newlength\figureheight
    \newlength\figurewidth
\RequirePackage{tikz-3dplot}
\RequirePackage{tkz-euclide}
\tikzset{
  basic box/.style={
    shape=rectangle, rounded corners, align=center,
    draw=#1, fill=#1!25},
}
\RequirePackage{standalone}

%%
%% Math
%%

\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{relsize}
\RequirePackage{siunitx} % to align numbers on the period
\newcommand\bmmax{0}
\RequirePackage{bm}
\RequirePackage{mathtools}
\RequirePackage{textcomp} % Needed for symbols such as degrees, copyright, etc.

%%
%% Fonts (2)
%%
\DoubleSpacing % per UW requirements, body needs to be double-spaced
\DeclareMathAlphabet{\mathfrak}{OMS}{cmsy}{m}{n}
\SetMathAlphabet\mathfrak{bold}{OMS}{cmsy}{b}{n}
\let\mathscr\mathfrak

%%
%% Division styles
%%

% Part style
\renewcommand{\partnamefont}{\raggedright\LARGE\scshape}
\renewcommand{\partnumfont}{\color{partnum}\LARGE\scshape}
\renewcommand{\parttitlefont}{\color{black}\raggedright\LARGE\scshape}
\renewcommand{\printparttitle}[1]{\parttitlefont \uppercaps{#1}}

% Chapter style
\RequirePackage{titlesec}
\makechapterstyle{uw}{%
  \renewcommand{\printchaptername}{}
  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchapternum}{%
   \marginnote[8.5pt]{\fontsize{50pt}{60pt}\textsf{\selectfont\textcolor{chapnum}{{\thechapter}}}}%
  }%
  \renewcommand{\afterchapternum}{}
  %\renewcommand{\chaptitlefont}{\raggedright\large\setSpacing{1.5}\uppercaps}
  \renewcommand{\printchaptertitle}[1]{\raggedright\large\setSpacing{1.5}\uppercaps{##1}}
  \renewcommand{\afterchaptertitle}{\vspace*{-10pt}\linebreak\rule{\linewidth}{0.2pt}\par\nobreak\vskip0.5\baselineskip}%
}

\titleformat{\section}
    {\relax}{\large\textsc{\MakeLowercase{\thesection}}}{1em}{\large\lowercaps}

\titleformat{\subsection}
    {\relax}{\textsc{\MakeLowercase{\thesubsection}}}{1em}{\lowercaps}

% Paragraph break
\newcommand{\parabreak}{%
  \fancybreak{%
    \vspace{\baselineskip}
    \color{smallornament}\Large\decofourleft
    \vspace{\baselineskip}
  }
}


%%
%% Tops and tails
%%

% Page style
\nouppercaseheads
\createmark{chapter}{left}{shownumber}{}{\hspace{0.25em} }
\createmark{section}{right}{shownumber}{}{\hspace{0.25em} }

\makepagestyle{uw}
\makeevenfoot{uw}{\small\textcolor{black!60}{\thepage}}%
                  {}%
                  {\footnotesize\scshape\textcolor{black!60}{\lowercapsss{\rightmark}}}
\makeoddfoot{uw}{\footnotesize\scshape\textcolor{black!60}{\lowercapsss{\leftmark}}}%
                 {}%
                 {\small\textcolor{black!60}{\thepage}}

% Plain headers and footers
\makeevenfoot{plain}{\small\textcolor{black!60}{\thepage}}{}{}
\makeoddfoot{plain}{}{}{\small\textcolor{black!60}{\thepage}}

% Empty part page style
\aliaspagestyle{part}{empty}


%%
%% Lists
%%

% Table of Contents
\maxtocdepth{section}

\renewcommand{\cftpartfont}{\large}
\renewcommand{\cftpartleader}{}
\renewcommand{\cftpartafterpnum}{\cftparfillskip}
\cftsetindents{part}{0em}{0em}
\renewcommand{\partnumberline}[1]{}
\cftpagenumbersoff{part}

\renewcommand{\cftchapterfont}{\normalsize}
\renewcommand{\cftchapterpagefont}{\normalsize}
\renewcommand{\cftchapterpresnum}{\color{tocchapnum}}
\renewcommand{\cftchapterleader}{}
\renewcommand{\cftchapterafterpnum}{\cftparfillskip}

\renewcommand{\cftsectionfont}{\small}
\renewcommand{\cftsectionpagefont}{\small}
\renewcommand{\cftsectionleader}{}
\renewcommand{\cftsectionafterpnum}{\cftparfillskip}

\renewcommand*{\cftchapterformatpnum}[1]{%
  \cftchapterformatpnumhook{#1}%
  {\quad\cftchapterpagefont #1}
}
\renewcommand*{\cftsectionformatpnum}[1]{%
  \cftsectionformatpnumhook{#1}%
  {\quad\cftsectionpagefont #1}
}

% List of Figures/Tables
\renewcommand{\cftfigurepresnum}{\color{tocchapnum}}
\renewcommand{\cftfigureleader}{ }
\renewcommand{\cftfigureafterpnum}{\cftparfillskip\vspace{4pt}}

\renewcommand{\cfttablepresnum}{\color{tocchapnum}}
\renewcommand{\cfttableleader}{ }
\renewcommand{\cfttableafterpnum}{\cftparfillskip\vspace{4pt}}

% Enumeratable list
\newenvironment{enum}{%
  \begin{list}{\textcolor{UWpurple!75!black}{\arabic{enumi}.}}{%
    \setlength{\topsep}{\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{\parskip}
    \setlength{\itemsep}{\parskip}
    \usecounter{enumi}
  }
}{\end{list}}

% Itemized list
\newenvironment{items}{%
  \begin{list}{\textcolor{UWpurple!75!black}{\textbullet}}{%
    \setlength{\topsep}{0.5\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{\parskip}
    \setlength{\itemsep}{1.25\parskip}
    \setlength{\leftmargin}{\parindent}
    \setlength{\itemindent}{0pt}
  }
}{\end{list}}

% Definitions in lists
\newcommand{\iterm}[1]{\item \term{#1}}

% In-paragraph lists
\usepackage{paralist}

%%
%% Captions
%%

\RequirePackage{caption}
\captionsetup[figure]{labelfont={footnotesize,rm,bf},font={footnotesize,rm},
                      justification=RaggedRight,%
                      singlelinecheck=false}
\captionsetup[table]{labelfont={footnotesize,rm,bf},font={footnotesize,rm},
                     justification=RaggedRight,%
                     singlelinecheck=false,%
                     position=bottom}
\captionsetup[sourcecode]{font={footnotesize,rm},%
                          justification=RaggedRight,%
                          singlelinecheck=false,%
                          position=bottom}

\DeclareCaptionStyle{marginfigure}{labelfont={footnotesize,rm,bf},font={footnotesize,rm},
                            justification=RaggedRight,%
                            singlelinecheck=false}

%%
%% Tables
%%

\RequirePackage{longtable}
\RequirePackage{pdflscape}
\RequirePackage{multirow}

\newcommand{\twoguides}{%
  \begin{tikzpicture}
    \draw (-1,1) -- (-1,1);
    \begin{scope}[color=red]
      \draw (-1,0.75) -- (-0.25,0.5);
      \draw (-1,0.2) -- (-0.25,0.5);
    \end{scope}
  \end{tikzpicture}}

\newcommand{\threeguides}{%
  \begin{tikzpicture}
    \draw (-1,1) -- (-1,1);
      \draw (-1,0.75) -- (-0.25,0.75);
      \draw (-1,0.225) -- (-0.25,0.75);
      \draw (-1,0.175) -- (-0.25,-0.35);
      \draw (-1,-0.35) -- (-0.25,-0.35);
    \begin{scope}[color=red]
      \draw (-1,0.70) -- (-0.25,0.2);
      \draw (-1,-0.30) -- (-0.25,0.2);
    \end{scope}
  \end{tikzpicture}}

\newcommand{\fourguides}{%
  \begin{tikzpicture}
    \draw (-1,0.7) -- (-1,0.7);
    \begin{scope}[color=red]
      \draw (-1,0.5) -- (-0.25,0);
      \draw (-1,-0.5) -- (-0.25,-0);
    \end{scope}
  \end{tikzpicture}}


%%
%% Side notes/tables/figures
%%

\RequirePackage{footnote}
\makesavenoteenv{table}
\makesavenoteenv{tabular}
\renewcommand*{\thefootnote}{\alph{footnote}}

\RequirePackage{marginnote}
\makeatletter
\let\oldmarginnote\marginnote
\renewcommand*{\marginnote}[2][0pt]{%
   \begingroup%
   \strictpagechecktrue
   \checkoddpage
   \ifoddpage%
     %
   \else%
     \reversemarginpar%
   \fi%
   \oldmarginnote{#2}[#1]%
   \endgroup%
}
\makeatother

% The mark on the sidenote
\newcommand{\sidemark}[1]{\textsuperscript{#1}{\:}}

% \RequirePackage{mparhack}
\newcommand{\marginelement}[2][0]{%
  \marginnote{%
    \strictpagechecktrue
    \checkoddpage
    \ifoddpage%
      \RaggedLeft\footnotesize%
    \else%
      \RaggedRight\footnotesize%
    \fi%
    #2%
  }[#1\onelineskip]%
}%

\RequirePackage{marginfix} % for citations, needs to be loaded before footmisc

\RequirePackage[symbol]{footmisc}
\newcounter{mparcnt}
\renewcommand\themparcnt{\fnsymbol{mparcnt}}
\newcommand\sidenote[2][0pt]{\refstepcounter{mparcnt}\textsuperscript{\themparcnt}\marginpar{\SingleSpacing\vspace{#1}\scriptsize\linespread{1.05}\textsuperscript{\themparcnt}#2}}
\makeatletter
\@addtoreset{mparcnt}{chapter}
\makeatother

\newcommand\published[2][-4pt]{\marginpar{\SingleSpacing\vspace{#1}\RaggedRight\scriptsize\linespread{1.05}\textcolor{gray}{#2}}}

% Sidetable (have to use marginpar since tabular doesn't work with marginnote)
\newcommand{\sidetable}[3][]{%
  \marginpar{%
    \strictpagechecktrue
    \checkoddpage
    \ifoddpage%
      \captionsetup[table]{font={footnotesize,rm},%
                           justification=RaggedRight,%
                           singlelinecheck=false}
      \RaggedRight\footnotesize%
    \else
      \captionsetup[table]{font={footnotesize,rm},%
                           justification=RaggedLeft,%
                           singlelinecheck=false}
      \RaggedLeft\footnotesize%
    \fi
    #3
    \captionof{table}[#1]{#2}
  }
}

% Sidefigure
\newcommand{\sidefigure}[4][]{%
  \marginpar{%
      \captionsetup[figure]{labelfont={footnotesize,rm,bf},font={footnotesize,rm},%,stretch=1.075},%
                            justification=RaggedRight,%
                            singlelinecheck=false}
    #4%
    \captionof{figure}[#1]{#2}\label{#3}
  }
}


%%
%% Environments
%%

% Full width quote environment
\renewenvironment{quote}{%
  \list{}{%
    \setlength{\topsep}{\baselineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\itemindent}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\leftmargin}{0pt}
  }%
  \itshape\item[]
}{\endlist}

\newlength{\wholemargin}\setlength{\wholemargin}{\marginparwidth}
\addtolength{\wholemargin}{\marginparpush}
\newlength{\wholewidth}\setlength{\wholewidth}{\textwidth}
\addtolength{\wholewidth}{\wholemargin}

% Whole environment
\newenvironment{whole}{%
  \centering
  \strictpagechecktrue
  \begin{adjustwidth*}{-\wholemargin}{0em}
  \strictpagechecktrue
  \checkoddpage
  \ifoddpage%
    \raggedright
  \else%
    \raggedleft
  \fi%
}{%
  \end{adjustwidth*}
}

\newlength{\foreminusspine}\setlength{\foreminusspine}{\foremargin}
\addtolength{\foreminusspine}{-\spinemargin}

% Centered environment
\newenvironment{centered}{%
  \begin{adjustwidth*}{0em}{-\foreminusspine}
    \centering
}{%
  \end{adjustwidth*}
}


\newcommand{\codelist}[4]{%
  \noindent\textbf{\texttt{#1}}\vskip0.125em
  \noindent#2\vskip0.125em
  \noindent\textit{#3}\vskip0.125em
  \noindent\textsf{#4}\vskip1.25em%
}

%%
%% Citations
%%

\RequirePackage[citestyle=ama, bibstyle=ama]{biblatex}
\DeclareCiteCommand{\mciten} % only prints number and puts reference in margin
  {}
  {\printtext[bibhyperref]{\printfield{labelnumber}}%
   \usebibmacro{sidecite}}
  {}
  {}
\DeclareCiteCommand{\citen} % only prints number, but not in margin (useful for figures)
  {}
  {\printtext[bibhyperref]{\printfield{labelnumber}}}
  {}
  {}

\DeclareCiteCommand{\nocite} % only prints number and puts reference in margin
  {}
  {\usebibmacro{sidecite}}
  {}
  {}

\DeclareFieldFormat{sidecite}{\marginpar{\linespread{1.05}\scriptsize#1}}
\newbibmacro{sidecite}{%
  \printtext[sidecite]{%
    \RaggedRight%
    \printtext[bibhyperref]{\textcolor{UWpurple}{\printfield{labelnumber}.}}
    \textcolor{gray}{%
    \printnames{labelname}%
    \unspace, %
    \iffieldundef{doi}{%
      \iffieldundef{isbn}{%
        \iffieldundef{url}{%
          \ifentrytype{patent}{%
            \href{https://patents.google.com/patent/US\thefield{number}/en}{\printfield[citetitle]{labeltitle}}%
          }{%
            \printfield[citetitle]{labeltitle}%
          }%
        }{% if only url is available
          \href{https://\thefield{url}}{\printfield[citetitle]{labeltitle}}%
        }%
        %\printfield[citetitle]{labeltitle}%
      }{% if only url or isbn is available
        \href{https://books.google.com/books?vid=ISBN\thefield{isbn}}{\printfield[citetitle]{labeltitle}}%
      }%
    }%
    {%
      \href{https://dx.doi.org/\thefield{doi}}{\printfield[citetitle]{labeltitle}}%
    }%
    \setunit{\addperiod\space}%
    \printfield{year}%
    }%
    }%
  \setunit{}}

\makeatletter

\DeclareCiteCommand{\cbx@mcite}[\mkbibsuperscript]
  {\usebibmacro{cite:init}%
   \let\multicitedelim=\supercitedelim
   \iffieldundef{prenote}
     {}
     {\BibliographyWarning{Ignoring prenote argument}}%
   \iffieldundef{postnote}
     {}
     {\BibliographyWarning{Ignoring postnote argument}}%
   }
  {\usebibmacro{citeindex}%
   \usebibmacro{cite:comp}}
  {}
  {\usebibmacro{cite:dump}}

\DeclareCiteCommand{\mcite}[\cbx@mcite@init\cbx@mcite]
  {\gdef\cbx@savedkeys{}%
   \citetrackerfalse%
   \pagetrackerfalse%
   \DeferNextCitekeyHook%
   \usebibmacro{cite:init}%
   }
  {\xappto\cbx@savedkeys{\thefield{entrykey},}%
   \usebibmacro{sidecite}}
  {}
  {\protected@xappto\cbx@savedcites{{\cbx@savedkeys}}}

\newrobustcmd{\cbx@mcite@init}[2]{%
  \def\cbx@savedcites{#1}#2\cbx@savedcites\empty}

\DeclareCitePunctuationPosition{\mcite}{f} % cite like autocite
\makeatother

%%
%% Hyperlinks
%%

\RequirePackage[pdftex,plainpages=false,breaklinks=true]{hyperref}
\RequirePackage{cleveref}%  smart page, figure, table, and equation referencing
\RequirePackage[all]{hypcap} % Makes sure hyperref points to beginning of
                         % the float, not the caption
\RequirePackage{bookmark}
\hypersetup{bookmarksdepth=2}

% Use lining number in equation numbers
 \makeatletter
 \let\reftagform@=\tagform@
 \def\tagform@#1{\maketag@@@{(\ignorespaces{\myliningnumfont#1}\unskip\@@italiccorr)}}
 \renewcommand{\eqref}[1]{\textup{\reftagform@{\ref{#1}}}}
 \makeatother

 % Use lining number in table
 \setfloatadjustment{table}{\myliningnumfont}

% break also on hyphens inside the \url command
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
  \do\)\do\,\do\?\do\'\do+\do\=\do\#\do-} % \do- is new!

% \urlstyle{sf}
\urlstyle{same}

\hypersetup{%
  colorlinks=false,%true,
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  urlcolor=black,
  breaklinks,
  pdfborder=0 0 0,
}


%%
%% Reference shorthands.
%%

\crefname{equation}{Eq.}{Equations}
\Crefname{equation}{Eq.}{Equations}
\crefname{figure}{Figure}{Figures}
\Crefname{figure}{Figure}{Figures}
\crefname{table}{Table}{Tables}
\Crefname{table}{Table}{Tables}
\crefname{chapter}{Chapter}{Chapters}
\Crefname{chapter}{Chapter}{Chapters}
\crefname{appendix}{Appendix}{Appendices}
\Crefname{appendix}{Appendix}{Appendices}
\crefname{section}{Section}{Sections}
\Crefname{section}{Section}{Sections}
\crefname{algorithm}{Algorithm}{Algorithms}
\Crefname{algorithm}{Algorithm}{Algorithms}
\crefname{appchap}{Appendix}{Appendices}
\Crefname{appchap}{Appendix}{Appendices}

%%%
%% Index (2)
%%%
\RequirePackage[toc,nomain,acronym]{glossaries} % List of acronyms and glossary
\setacronymstyle{long-sc-short}
\renewcommand*{\glsnamefont}[1]{\textup{#1}}

\RequirePackage{makeidx}

\makeglossaries
\makeindex

%%
%% Declerative formatting
%%

% Abbreviations (mostly acronyms, but all full caps abbreviations)
\let\abbr\lowercaps

% Titlepage
\RequirePackage{pdfpages}
\newlength\frontwidth\frontwidth=6in%
\renewcommand{\maketitle}{%

  \begin{titlingpage*}
  \DoubleSpacing
  \begin{tikzpicture}[remember picture,overlay]

    \node[at=(current page.north),anchor=north,yshift=-0.75in]{\draftstring{}};

    % Title
    \node[at=(current page.north west),anchor=north west,xshift=1.25in,yshift=-2in,text width=\wholewidth]{
    \begin{minipage}{\wholewidth}%
      \centering
      {%
      {\LARGE Very long title of  \vskip5pt%
      some interesting thesis} \vspace{1pc} }\\
      {\Large John Doe } \vspace{0.5pc} \\
    \end{minipage}
    };

    % Fulfillments
    \node[at=(current page.west),anchor=west,xshift=1.25in,yshift=0.5in,text width=\frontwidth]{
    \begin{minipage}{\linewidth}%
      \centering
      \OnehalfSpacing
      A dissertation \\
      submitted in partial fulfillment of the \\
      requirements for the degree of \vspace{1.25pc} \\
      {\large Doctor of Philosophy} \vspace{1.25pc} \\
      {\large University of Washington} \\
      {\large 2025}
    \end{minipage}
    };

    % Signatures
    \node[at=(current page.south west),anchor=south west,xshift=1.25in,yshift=2in,text width=\frontwidth]{%
    \begin{minipage}{\linewidth}%
      \centering
      \DoubleSpacing
      Reading Committee: \vspace{0.5pc}\\
      Professor 1, Chair\\
      Professor 2\\
      Professor 3 \vspace{2pc}\\

      Program Authorized to Offer Degree:\\
      Health Services
    \end{minipage}%
    };

  \end{tikzpicture}

 % Copyright
 \newpage%
 \thispagestyle{empty}%
 \begin{tikzpicture}[remember picture,overlay]

    \node[at=(current page.north),anchor=north,yshift=-1in,text width=0.5\paperwidth,align=center]{
        \begin{minipage}{\linewidth}
              \centering
              \copyright\ Copyright 2025\\
              John Doe
        \end{minipage}};
 \end{tikzpicture}

 \cleardoublepage

 \end{titlingpage*}
}

\newcommand{\printabstract}[1]%
{%
  \phantomsection%
  \thispagestyle{plain}%
  \addcontentsline{toc}{chapter}{Abstract}
  \noindent%
      {%
      \centering%
      University of Washington\\
      \null\vspace{0.5pc}

      {\large \noindent \textbf{\lowercaps{Abstract}}} \vspace{1.0pc} \\

      {\Large{\color{title}Very long title} \textit{of} {\color{title} some} \textit{very} \color{title} interesting thesis} \vspace{1pc} \\

      {\large John Doe}\vspace{1pc} \\

      Chair of the Supervisory Committee:\\
      Professor 1 \\
      Department of Health Systems and Population Health \vspace{2pc} \\
      }

      {\noindent \input{#1}}
  \clearpage%
}
