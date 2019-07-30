% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

%modified for University of New Mexico by Anirban N. Chowdhury

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, oneside, letterpaper]{book}

%
% Options
%
\RequirePackage{etoolbox}
\RequirePackage{amsmath}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[left=1.5in,top=1in,width=6in,height=9in, letterpaper]{geometry}
\usepackage{ragged2e}
%\RaggedRight
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}

%mathspec redefined RequirePackage to check whether amsmath has been loaded or not. This causes an error if a package loaded later also requires amsmath. The following three lines fix this error.
\makeatletter % undo the wrong changes made by mathspec
\let\RequirePackage\original@RequirePackage
\let\usepackage\RequirePackage

%commented out EB Garamond for math; use CM instead
%\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
%\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\usepackage{libertineotf}			%comment out this line and uncomment the next four lines to use EB Garamond, Lato and Source Code Pro fonts
%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0, BoldFont=EBGaramond-SemiBold]{EB Garamond}
%\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
%\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
%\setmonofont[Scale=MatchLowercase]{Source Code Pro}

\RequirePackage[font={small,singlespacing},
					labelfont={bf,sf,small,singlespacing},
                textfont={sf,small,singlespacing},
                justification={justified,RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
%\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\fancyhead{}
\fancyhead[L]{\footnotesize \scshape \leftmark}
\setlength{\headheight}{15pt}
\pagestyle{fancy}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize}
\renewcommand\listfigurename{List of figures}
\renewcommand\listtablename{List of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
%\renewcommand\bibname{References}
%\RequirePackage[]{natbib}
%\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\previousdegrees#1{\gdef\@previousdegrees{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\defensedate#1{\gdef\@defensedate{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
%\def\pdOneName#1{\gdef\@pdOneName{#1}}
%\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
%\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
%\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
%\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
%\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{The University of New Mexico}
\universitycity{Albuquerque}
\universitystate{New Mexico}

% School color found from university's graphic identity site:
% http://www.nyu.edu/employees/resources-and-services/media-and-communications/styleguide.html
\definecolor{SchoolColor}{rgb}{0.3412, 0.0235, 0.5490} % purple
\definecolor{chaptergrey}{rgb}{0.2600, 0.0200, 0.4600} % dialed back a little
\definecolor{midgrey}{rgb}{0.4, 0.4, 0.4}

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}

% Formatting guidelines found in:
% http://gsas.nyu.edu/docs/IO/4474/formattingguide.pdf

\renewcommand{\frontmatter}{
	\pagestyle{plain}
	\pagenumbering{roman}
	\input{frontmatter/personalize}
	\approval
	\maketitle
	\copyrightpage
%	\frontispiece
	\dedicationpage
	\acknowledgments
%	\preface
	\abstractpage
	\tableofcontents

	% figure listing - required if you have any figures
	\listoffigures
	\phantomsection
	\addcontentsline{toc}{chapter}{List of figures}

	% table listing - required if you have any tables
%	\listoftables
%	\phantomsection
%	\addcontentsline{toc}{chapter}{List of tables}

	% appendix listing - required only if you have two or more appendices
	% \newpage
	% \thispagestyle{empty}
	% \phantomsection
	% \addcontentsline{toc}{chapter}{List of appendices}
	% \chapter*{List of appendices}
	% \contentsline {chapter}{Appendix A}{\pageref{AppendixA}}{}

	\newpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
	\pagestyle{fancy}
}

\newcommand{\approval}{
\newpage
\Large\noindent\theauthor\normalsize\\
\noindent\makebox[\linewidth][l]{\rule{5in}{1pt}}\\
\textit{Candidate} \\

\Large\noindent\@department\normalsize\\
\noindent\makebox[\linewidth][l]{\rule{5in}{1pt}} \\
\textit{Department, The University of New Mexico}\\ \vspace{30pt}

\noindent This dissertation is approved, and it is acceptable in quality and form for publication:\\ \vspace{10pt}\\
\large\noindent \textit{Approved by the Dissertation Committee:}\\
\vspace{10pt}\\
\Large
%Copy a new version of these 5 lines for every new committee member
\@advisor~{\small (Chair)} \\
\noindent\makebox[\linewidth][l]{\rule{5.5in}{1pt}}\\
\vspace{5pt}\\
\@committeeInternalOne\\
\noindent\makebox[\linewidth][l]{\rule{5.5in}{1pt}}\\
\vspace{5pt}\\
\@committeeInternalTwo\\
\noindent\makebox[\linewidth][l]{\rule{5.5in}{1pt}}\\
\vspace{5pt}\\
\@committeeExternal \\
\noindent\makebox[\linewidth][l]{\rule{5.5in}{1pt}}\\
\vspace{10pt}\\
\normalsize Defended \@defensedate.
\newpage
}

\renewcommand{\maketitle}{
%	\thispagestyle{empty}
	\vspace*{\fill}
	\vspace{30pt}
	\begin{center}
	{\Huge \textcolor{midgrey}{\thetitle} \normalsize \\
	\vspace{25pt}
	by \\
	\vspace{15pt}
	\theauthor}\\
	\vspace{15pt}
	\@previousdegrees \\
	\vspace{40pt}
	\begin{center}
    \includegraphics[width=100pt]{resources/unm_logo.eps}
	\end{center}
	\vspace{40pt}
	\large DISSERTATION \normalsize\\
	\vspace{15pt}
	Submitted in Partial Fulfillmentof the\\ Requirements for the Degree of \\
	\vspace{15pt}
	{\large \@degree \\
	\@field \\}
	\vspace{15pt}
	\@university \\
	\@universitycity, \@universitystate\\
	\vspace{15pt}
	\@degreemonth, \@degreeyear
	\end{center}
	\vspace*{\fill}
}

\newcommand{\copyrightpage}{
	\newpage
%	\thispagestyle{empty}
	\vspace*{25pt}
	\begin{center}
	 \noindent \small \copyright \  \small  \theauthor \\
	All rights reserved, \@degreeyear
	\end{center}
	\newpage
	\rm
}

\newcommand{\frontispiece}{
	\newpage
%	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
    \includegraphics[width=45pt]{resources/unm_logo.eps}
	\end{center}
	\vspace*{\fill}
}

\newcommand{\dedicationpage}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Dedication}
	\newpage
	\vspace*{\fill}
	\itshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill}
	\newpage
	\rm
}

\newcommand{\acknowledgments}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Acknowledgments}
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} \newpage
}

\newcommand{\preface}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Preface}
	\chapter*{Preface}
	\input{frontmatter/preface}
}

\newcommand{\abstractpage}{
	\phantomsection
	\newpage
	\addcontentsline{toc}{chapter}{Abstract}
	\begin{center}
	{\Huge \textcolor{midgrey}{\thetitle} \normalsize \\
	\vspace{25pt}
	by \\
	\vspace{15pt}
	\theauthor}\\
	\vspace{15pt}
	\@previousdegrees \\
	\@degree, \@department, \@degreeyear
	\vspace{50pt}\\
	 {\huge Abstract}
	\end{center}
	\vspace{15pt}
	\input{frontmatter/abstract}
}


\renewcommand{\backmatter}{
    \begin{appendices}
        \include{chapters/hsim-proofs}
        \include{chapters/function-approximations}
        \include{chapters/hamiltonian-stochastic}
    \end{appendices}
%    \input{endmatter/personalize}
    \clearpage
    \singlespacing
    \bibliographystyle{references/abbrv-alpha-letters-links}
    \bibliography{references/references}
    \addcontentsline{toc}{chapter}{References}
%    \include{endmatter/colophon}
}


