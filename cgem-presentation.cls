%% CGEM Presentation Package
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgem-presentation}[2024/12/09 CGEM Presentation]

%----------------------------------------
%% CGEM Presentation Package Dependencies
\LoadClass[aspectratio=169]{beamer}

% Preamble
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage[backend=biber, style=authoryear-comp]{biblatex}
\RequirePackage{color}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage{libertinus}
\RequirePackage[absolute,overlay]{textpos}

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
\setsansfont{Montserrat}
\setmathrm{Libertinus Serif}
\usefonttheme{professionalfonts}

% Hyperlink settings
\hypersetup{
	colorlinks=true,
	citecolor=ThirdColor,
	linkcolor=SecondColor,
	urlcolor=ThirdColor,
}

% Background and default text color
\setbeamercolor{background canvas}{bg = ZeroColor}
\setbeamercolor{normal text}{fg = FirstColor}
\usebeamercolor*{normal text}

% Turn off Beamer navigation buttons
\beamertemplatenavigationsymbolsempty

% Page numbering
\setbeamertemplate{footline}{
	\begin{flushright}
		\color{SecondColor}
		\large
		\insertframenumber
		\hspace{1mm}
		\vspace{-1mm}
	\end{flushright}
}

%------------------------------------------
%% Enumeration / Itemize  / List Settings, ie, Bullet Point Lists

% Base level
\setbeamertemplate{itemize item}{\LARGE \color{FirstColor} \textbullet}
\setbeamertemplate{enumerate item}{\LARGE \color{FirstColor} \textbullet}
\setbeamerfont*{itemize/enumerate body}{size=\LARGE}
\setbeamercolor{itemize/enumerate body}{fg=FirstColor}

% First Level
\setbeamertemplate{itemize subitem}{\Large \color{FirstColor} --}
\setbeamertemplate{enumerate subitem}{\Large \color{FirstColor} --}
\setbeamerfont*{itemize/enumerate subbody}{size=\Large}
\setbeamercolor{itemize/enumerate subbody}{fg=FirstColor}

%------------------------------------------
%% Frame title format

% Frame titles centers, Huge and white by default
\setbeamertemplate{frametitle}[default][center]
\setbeamerfont*{frametitle}{size=\Huge}
\setbeamercolor{frametitle}{fg=FirstColor}

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
