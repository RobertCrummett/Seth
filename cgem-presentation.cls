%% CGEM Presentation Package
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgem-presentation}[2024/10/21 CGEM Presentations]

%----------------------------------------
%% CGEM Presentation Package Dependencies
\LoadClass[aspectratio=169]{beamer}

% Preamble
\RequirePackage{amsmath, amsfonts, amssymb} % Math
\RequirePackage{array} % array stretch
\RequirePackage{bm} % bold math
\RequirePackage[backend=biber, style=authoryear-comp]{biblatex} % Bibliography, change style if you prefer
\RequirePackage{fontspec} % Fonts --- If this fails to compile, try XeLaTeX or LuaTeX
\RequirePackage{hyperref} % Links
\RequirePackage{longtable} % explanation of equations table
\RequirePackage{newtxmath} % prettier math
\RequirePackage[absolute,overlay]{textpos} % Figure placement
\RequirePackage{xcolor} % Colors

%-----------------------------------------
%% Global TeX Settings and Options Processing

% Presentation color options
\definecolor{highlight}{HTML}{FFC000} % Highlight color
\definecolor{cgemblue}{HTML}{90C5FB} % Light CGEM blue
\definecolor{pres-blue}{HTML}{496EAF} % Darkish blue
\definecolor{pres-red}{HTML}{BD3939} % Beautiful red

% Parse the optional color argument
\DeclareOption{dark}{
  \colorlet{ZeroColor}{black}
  \colorlet{FirstColor}{white}
  \colorlet{SecondColor}{cgemblue}
  \colorlet{ThirdColor}{cgemblue!40!red}
  \newcommand{\LogoFileCGEM}{cgem-logo-dark}
  \newcommand{\LogoFileMines}{mines-logo-dark}
}
\DeclareOption{light}{
  \colorlet{ZeroColor}{white}
  \colorlet{FirstColor}{black}
  \colorlet{SecondColor}{pres-blue}
  \colorlet{ThirdColor}{pres-red}
  \newcommand{\LogoFileCGEM}{cgem-logo-light}
  \newcommand{\LogoFileMines}{mines-logo-light}
}
\ProcessOptions\relax

% Font Settings
\setsansfont{Arial}

% Hyperlink settings
\hypersetup{
  colorlinks=true,
  citecolor=ThirdColor,
  linkcolor=SecondColor,
  urlcolor=ThirdColor,
} % Link to corresponding author

% Background and default text color
\setbeamercolor{background canvas}{bg = ZeroColor}
\setbeamercolor{normal text}{fg = FirstColor}\usebeamercolor*{normal text}

% Turn off Beamer navigation buttons
\beamertemplatenavigationsymbolsempty

% Page numbering
\setbeamertemplate{footline}{
  \begin{flushright}
    \textcolor{SecondColor}{\large \insertframenumber}
    \hspace{1mm}
    \vspace{-1mm}
  \end{flushright}
}

%------------------------------------------
%% Enumeration / Itemize  / List Settings, ie, Bullet Point Lists

% Base level
\setbeamertemplate{itemize/enumerate item}{\LARGE \color{FirstColor} \textbullet}
\setbeamerfont*{itemize/enumerate body}{size=\LARGE}
\setbeamercolor{itemize/enumerate body}{fg=FirstColor}

% First Level
\setbeamertemplate{itemize/enumerate subitem}{\Large \color{FirstColor} --}
\setbeamerfont*{itemize/enumerate subbody}{size=\Large}
\setbeamercolor{itemize/enumerate subbody}{fg=FirstColor}

% Second Level -- only use in emergencies!!
\setbeamertemplate{itemize/enumerate subsubitem}{\large \color{FirstColor} \textbullet}
\setbeamerfont*{itemize/enumerate subsubbody}{size=\large}
\setbeamercolor{itemize/enumerate subsubbody}{fg=FirstColor}

%------------------------------------------
%% Frame title format

% Frame titles centers, Huge and white by default
\setbeamertemplate{frametitle}[default][center]
\setbeamerfont*{frametitle}{size=\Huge}
\setbeamercolor{frametitle}{fg=FirstColor}

%------------------------------------------
%% Question Slide

% Print a horizontal while bar across the text width of frame
\newcommand{\HorizontalBar}[1]{ \textcolor{#1}{\noindent \makebox[\linewidth]{\rule{\textwidth}{0.7pt}}} }

%-------------------------------------------
%% Bibliography Style

% Biblography colors
\setbeamercolor*{bibliography entry title}{fg=FirstColor}
\setbeamercolor*{bibliography entry location}{fg=FirstColor}
\setbeamercolor*{bibliography entry note}{fg=FirstColor}
\setbeamercolor*{bibliography entry author}{fg=FirstColor}
\setbeamercolor*{bibliography item}{fg=SecondColor}

% No numbering on continued reference slides
\setbeamertemplate{frametitle continuation}{}

%--------------------------------------------
%% Citations

% Inline citation settings
\renewcommand*{\citesetup}{
  \color{ThirdColor}
  \biburlsetup
}

%------------------------------------------
% Math blocks
\AtBeginEnvironment{theorem}{
  \setbeamerfont{block title}{size=\LARGE, series=\bfseries}
  \setbeamerfont{block body}{size=\Large, series=\normalfont}
  \setbeamercolor{block title}{fg=SecondColor}
  \setbeamercolor{block body}{fg=FirstColor}
}
\setbeamertemplate{theorems}[numbered]

\AtBeginEnvironment{proof}{
  \setbeamerfont{block title}{size=\LARGE, series=\bfseries}
  \setbeamerfont{block body}{size=\Large, series=\normalfont}
  \setbeamercolor{block title}{fg=SecondColor}
  \setbeamercolor{block body}{fg=FirstColor}
}
\setbeamertemplate{proofs}[numbered]
\setbeamertemplate{qed symbol}{\color{FirstColor} \blacksquare}

\AtBeginEnvironment{definition}{
  \setbeamerfont{block title}{size=\LARGE, series=\bfseries}
  \setbeamerfont{block body}{size=\Large, series=\normalfont}
  \setbeamercolor{block title}{fg=SecondColor}
  \setbeamercolor{block body}{fg=FirstColor}
}
