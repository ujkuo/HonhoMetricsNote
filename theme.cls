\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{Theme}

\LoadClass[a4paper, 12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[top = 2cm, bottom = 2cm, left = 2cm, right = 2cm,]{geometry} 
\RequirePackage{amsmath, bm} % For the usage of \because and \therefore
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{etoolbox}
\RequirePackage{indentfirst}
\RequirePackage{tabularx}
\RequirePackage{mathtools}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{authblk}
\RequirePackage{dsfont}
\RequirePackage[calcwidth]{titlesec}
\RequirePackage{bookmark}
\RequirePackage[capitalize]{cleveref}
\RequirePackage{array}
\RequirePackage[english]{babel}
\RequirePackage{enumitem} 
\RequirePackage{natbib}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\bibliographystyle{econ}
\RequirePackage[T1]{fontenc}
%\usepackage{newpxtext,newpxmath}
\RequirePackage{pxfonts}
\RequirePackage{pgfplots}
\pgfplotsset{width=4cm, compat=1.9}
\RequirePackage{halloweenmath}
\RequirePackage{cancel}
%\RequirePackage{stix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format Setting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
% Macros for setting basic info
\gdef\@uni{National Taiwan University}
\gdef\@department{Information Management}
\gdef\@me{Yu-Chieh Kuo}

\newcommand{\course}[2][]{
    \ifstrempty{#1}{
        \gdef\shortcourse{#2}
    }{
        \gdef\shortcourse{#1}
    }
    \gdef\@course{#2}
}
\newcommand{\teacher}[1]{\gdef\@teacher{#1}}
\newcommand{\semester}[1]{\gdef\@semester{#1}}
\newcommand{\uni}[1]{\gdef\@uni{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\hwname}[1]{\gdef\@hwname{#1}}
\newcommand{\student}[3][]{
    \ifstrempty{#1}{
        \author{\textbf{#2} \textbf{#3}}
    }{
        \author[#1]{\textbf{#2} \textbf{#3}}
    }
}
\newcommand{\week}[2][\@hwname]{
    \ifstrempty{#2}{
        \gdef\@week{#1}
    }{
        \gdef\@week{#1 #2}
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title Page Style Setting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{title}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \cfoot{\footnotesize Page {\thepage} of \pageref*{LastPage}} 
}
\newcommand{\ujtitle}{
    \thispagestyle{title}
    \noindent\begin{tabularx}{\linewidth}{Xr} % This is a simple tabular environment to align your text nicely 
    {\large \bf{\@course}} & {\it Professor Hon Ho Kwok}  \\
    National Taiwan University, \@semester & {\@date}  \\
    \bottomrule % \hline produces horizontal lines.
    \vspace{1mm}
    \end{tabularx}
    
    \begin{center}
        {\huge\bf\textsc{\@week : \@date}}\\[3mm]
        {\@author}
    \end{center}

}
\newcommand{\mymaketitle}{
    \thispagestyle{title}
    \vspace*{-15mm}
    \noindent\begin{tabularx}{\linewidth}{Xr}
                                & \textsl{National Taiwan University} \\
        \large\textbf{\@semester,} & \textsl{Department of \@department}         \\
        \large\textbf{\@course} & \textsl{Prof. \@teacher}\Bstrut\\
        \bottomrule
    \end{tabularx}

    \vspace*{10mm}

    \begin{center}
        {\huge\textsc{\@week{}}}\\[6mm]
        {\@author}
    \end{center}

    \vspace*{1cm}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Content Page Style Setting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{13.6pt}
\lhead{\small {\@course}: {\@week}}
\rhead{\small {\it Professor Hon Ho Kwok}}
\cfoot{\small {Page {\thepage} of \pageref*{LastPage}}} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem and Subproblem Setting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{0}
\newcounter{problem}
\newcounter{subproblem}[problem]
\newbool{appendix}
\gdef\problemName{Problem}
\newcommand{\problem}[2][]{
    \setcounter{equation}{0}
    \ifstrempty{#1}{
        \stepcounter{problem}
    }{
        \setcounter{problem}{#1}
    }
    \ifstrempty{#2}{
        \ifbool{appendix}{
            \section{\hspace{-5mm}\problemName{} \Alph{problem}.}
        }{
            \section{\hspace{-5mm}\problemName{} \arabic{problem}}
        }
    }{
        \ifbool{appendix}{
            \section{\hspace{-5mm}\problemName{} \Alpa{problem}: #2}
        }{
            \section{\hspace{-5mm}\problemName{} \arabic{problem}: #2}
        }
    }
}
\newcommand{\subproblem}[2][]{
    \setcounter{equation}{0}
    \ifstrempty{#1}{
        \stepcounter{subproblem}
    }{
        \setcounter{subproblem}{#1}
    }
    \ifstrempty{#2}{
        \ifbool{appendix}{
            \section{\hspace{-2mm}\Alph{problem}.\arabic{subproblem}}
        }{
            \section{\hspace{-2mm}\arabic{problem}.(\alph{subproblem})}
        }
    }{
        \ifbool{appendix}{
            \section{\hspace{-2mm}\Alph{problem}.\arabic{subproblem}. #2}
        }{
            \section{\hspace{-2mm}\arabic{problem}.(\alph{subproblem}) #2}
        }
    }
}
% Bookmarks
\RequirePackage{hyperref}
\hypersetup{
    colorlinks = true,
        citecolor=myblue,
        linkcolor=myred,
        urlcolor=myred
}

% Reference nome for task and subtask
\crefname{section}{\sectionname}{\sectionnamepl}


\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math Operatiob Definition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \everymath{\displaystyle} 
% commands for spacing
\newcommand{\Tstrut}{\rule{0pt}{4mm}}         % = `top' strut
\newcommand{\Bstrut}{\rule[-2mm]{0mm}{0mm}}   % = `bottom' strut

% Paired Delimiters {}, (), []
\providecommand\given{} % so it exists
\newcommand\SetSymbol[1][]{
   \nonscript\,#1\vert \allowbreak \nonscript\,\mathopen{}}
\DeclarePairedDelimiterX{\Bkt}[1]{[}{]}{#1}
\DeclarePairedDelimiterX{\Paren}[1]{(}{)}{#1}
\DeclarePairedDelimiterX{\Curly}[1]{\{ }{\}}{#1}
\DeclarePairedDelimiterX{\Abs}[1]{\lvert}{\rvert}{#1}
\newcommand{\PR}[1]{\Pr\Bkt*{#1}}
\newcommand{\overbar}[1]{\mkern 1.5mu\overline{\mkern-1.5mu#1\mkern-1.5mu}\mkern 1.5mu}
\newcolumntype{D}{>{$(}l<{)$}}
\newcolumntype{R}{>{\displaystyle}r}
\newcolumntype{C}{>{\displaystyle}c}
\newcolumntype{L}{>{\displaystyle}l}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declare operator and useful math command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Econometrics and Stats %%%%%%%%%%%%%
\DeclareMathOperator{\EOp}{\mathbb{E}}
% Expectation
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
% Invert matrix
\newcommand{\inv}{^{-1}}
% Expectation
\newcommand{\E}[1]{\ensuremath{\EOp\Bkt*{#1}}}
% Hat Expectation
\newcommand{\hE}[1]{\ensuremath{\hat{\EOp}\Bkt*{#1}}}
% Distribution asymptotically to 
\newcommand{\dto}{\stackrel{d}{\to}}
% Probability asymptotically to
\newcommand{\pto}{\stackrel{p}{\to}}
% Almost surely to
\newcommand{\asto}{\stackrel{a.s.}{\to}}
% Normal distribution
\newcommand{\nor}[1]{\mathcal{N}\left(#1\right)}
% Bernoulli distribution 
\newcommand{\bnl}[1]{\text{Bernoulli}\left(#1\right)}
% Probability Prob
\newcommand{\pr}[1]{\text{Prob}\left(#1\right)}
% Probability mathcal P
\newcommand{\p}[1]{\mathcal{P}\left(#1\right)}
% Prob limit
\DeclareMathOperator*{\plim}{plim}
% Variance
\newcommand{\var}[1]{Var\left(#1\right)}
% Column matrix
\newcommand{\col}[1]{\begin{pmatrix} #1 \end{pmatrix}}
% Estimation methods
\newcommand{\ols}{{OLS}}
\newcommand{\mle}{{MLE}}
\newcommand{\gls}{{GLS}}
\newcommand{\gmm}{{GMM}}
\newcommand{\iv}{{IV}}
\newcommand{\linf}{\lim_{n\to\infty}}
\newcommand{\plinf}{\plim_{n\to\infty}}
\newcommand{\iid}{{\it i.i.d.}}
\newcommand{\hyi}{\hat{y}_i}
\newcommand{\yio}{y_i^{out}}
\newcommand{\bgn}{\overline{g_n}}
\newcommand{\tib}{\tilde{\beta}}
\newcommand{\til}{\tilde{\lambda}}
\newcommand{\hab}{\hat{\beta}}

%%%%%%%%%%%%%%%%%%% Abbreviation %%%%%%%%%%%%%%%%%%%
\newcommand{\sumn}{\sum_{i=1}^n}
\newcommand{\sumN}{\sum_{i=1}^N}
\newcommand{\prodn}{\prod_{i=1}^n}
\newcommand{\prodN}{\prod_{i=1}^N}
\newcommand{\barc}{\[ \begin{array}{RCL}}
\newcommand{\baro}[1]{\[ \begin{array}{#1}}
\newcommand{\earc}{\end{array} \]}

%%%%%%%%%%%%%%%%%% Greek Alphabet %%%%%%%%%%%%%%%%%%
\newcommand{\al}{\alpha}
\newcommand{\be}{\beta}
\newcommand{\lbd}{\lambda}
\newcommand{\Lbd}{\Lambda}
\newcommand{\tht}{\theta}
\newcommand{\vth}{\vartheta}
\newcommand{\Tht}{\Theta}
\newcommand{\gm}{\gamma}
\newcommand{\Gm}{\Gamma}
\newcommand{\de}{\delta}
\newcommand{\De}{\Delta}
\newcommand{\si}{\sigma}
\newcommand{\hb}{\hat{\beta}}
\newcommand{\hth}{\hat{\theta}}
\newcommand{\hae}{\hat{e}}


%%%%%%%%%%%%%%%%%%% Common usage %%%%%%%%%%%%%%%%%%%
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\ve}{\varepsilon}
\newcommand{\es}{\emptyset}
\newcommand{\sst}{\subset}
\newcommand{\sse}{\subseteq}
\newcommand{\spt}{\supset}
\newcommand{\spe}{\supseteq}
\newcommand{\ie}{\text{ i.e., }}
\newcommand{\st}{\text{ s.t.  }}
\newcommand{\hl}[1]{\textcolor{myred}{#1}}
\newcommand{\br}[1]{\Paren*{#1}}
\newcommand{\set}[1]{\Curly*{#1}}
\newcommand{\pdv}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\ppdv}[3]{\frac{\partial^2 #1}{\partial #2 \partial #3}}
\newcommand{\why}{\textbf{\hl{why??????}}}
\newcommand{\tand}{\text{and}}
\newcommand{\frn}{\frac{1}{n}}
\newcommand{\sqrn}{\sqrt{n}}
\newcommand{\lgr}{\mathcal{L}}

% Declare delimiter
\DeclareMathDelimiter{\lVert}
  {\mathopen}{symbols}{"6B}{largesymbols}{"0D}
\DeclareMathDelimiter{\rVert}
  {\mathclose}{symbols}{"6B}{largesymbols}{"0D}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
%\DeclarePairedDelimiter\vector{\langle}{\rangle}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Theorem Style Setting 
%\theoremstyle{plain}
\newtheorem{corollary}{Corollary}
\newtheorem{proposition}{Proposition}
\newtheorem{claim}{Proposition}
\crefname{claim}{Proposition}{Proposition}
%\theoremstyle{remark}
%\newtheorem*{remark}{Remark}
%\newtheorem*{defi}{Definition}
\declaretheoremstyle[
  numbered=no,
  spaceabove=6pt, spacebelow=6pt,
  headfont=\normalfont\bfseries,
  notefont=\mdseries, notebraces={(}{)},
  bodyfont=\normalfont,
  postheadspace=1em,
  qed= \qedsymbol
]{mystyle}
\declaretheorem[style=mystyle]{remark}
\declaretheorem[style=mystyle]{example}
\declaretheorem[style=mystyle, name=Definition]{defi}
\declaretheorem[style=mystyle, name=Theorem]{thm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{minted}
\setminted[python]{frame=single, linenos, numbersep=4pt, style=tango, breaklines=true, fontsize=\small, tabsize=2}
\setmintedinline[python]{fontsize=\normalsize}
\renewcommand{\theFancyVerbLine}{\sffamily\textcolor[rgb]{0.7,0.7,0.7}{\scriptsize\arabic{FancyVerbLine}}}
\setminted[stata]{frame=single, linenos, numbersep=4pt, style=tango, breaklines=true, fontsize=\small, tabsize=2}
\setmintedinline[stata]{fontsize=\normalsize}
\renewcommand{\theFancyVerbLine}{\sffamily\textcolor[rgb]{0.7,0.7,0.7}{\scriptsize\arabic{FancyVerbLine}}}
% Boxing examples
\def\posskip{\vskip2pt plus 2pt minus 2pt}
\def\negskip{\vskip-8pt plus 2pt minus 2pt}
\newcommand{\fox}[1]{\noindent\framebox{\begin{minipage}{0.984\textwidth}#1\end{minipage}}\ignorespaces}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\setCJKmainfont{思源宋體 TW}
%\setmainfont{思源宋體 TW}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use listing package to display different programming language
% Use xcolor package to display syntax color for programming language
% Usage: \env{lstlisting}[language=LANGUAGENAME]
% Common language name: Python, bash, C, C++, R, sh, make, Matlab
\RequirePackage{listings}
\RequirePackage{xcolor}
\definecolor{myred}{RGB}{192,46,46}
\definecolor{myblue}{RGB}{7,75,164}
\definecolor{mygreen}{rgb}{0.11,0.7,0.02}

\lstset{frame=tb,
  language=Python,
      aboveskip=3mm,
    belowskip=3mm,
    showstringspaces=false,
  columns=flexible,
      basicstyle={\small\ttfamily},
    numbers=none,
    numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
      commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
    breaklines=true,
  breakatwhitespace=true,
      tabsize=3
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hwname{Week}
\course{Econometrics Theory (I) B}
\semester{Fall 2022}
\student[$\dagger$]{Note Writer:}{Yu-Chieh Kuo}
\affil[$\dagger$]{Department of Information Management, National Taiwan University}


