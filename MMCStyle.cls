% 要求使用LaTeX2e的特定版本
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
% 定义MathorCupmodeling文档类，版本为1.0
\ProvidesClass{MMCStyle}[2020/01/14 version 1.0]

% 加载ctexart文档类，设置纸张为A4纸，行距为1.25倍，默认字号为小4
\LoadClass[oneside,a4paper,UTF8,linespread=1.25,zihao=-4]{ctexart}

% 设置章节格式
\ctexset{
    % 设置章节标题格式
    section={
        format={\zihao{4}\heiti\centering},
        name={,、},
        aftername={\hspace{0pt}},
        number=\chinese{section},
    },
    % 设置子章节标题格式
    subsection={
        format={\zihao{-4}\heiti\raggedright},
        name={},
        aftername={\hspace{5bp}},
        number={\arabic{section}.\arabic{subsection}},
    },
    % 设置子子章节标题格式
    subsubsection={
        format={\zihao{-4}\heiti\raggedright},
        name={},
        aftername={\hspace{5bp}},
        number={\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
    },
    % 设置附录格式
    appendix={
        name={附录,：},
        number=\arabic{section},
    }
}

\def\bianhao#1{\gdef\@bianhao{#1}}
\def\tihao#1{\gdef\@tihao{#1}}
\def\timu#1{\gdef\@timu{#1}}
\def\keyword#1{\gdef\@keyword{#1}}
\renewenvironment{abstract}%
{%
\phantom{1}\\
\hspace*{\fill}\begin{tabularx}{7.82cm}{|Y|Y|}
	\hline
	队伍编号 & \@bianhao \\
	\hline
	题号 & \@tihao \\
	\hline
\end{tabularx}\hspace*{\fill}\\
\phantom{1}\\
\rule{\textwidth}{1.5pt}\\
\phantom{1}\\
\phantom{1}\hfill{\zihao{4}\@timu}\hfill\phantom{1}\\
\phantom{1}\hfill{\label{zy}摘~~要}\hfill\phantom{1}\pdfbookmark[1]{摘要}{zy}\par%
}{\\\phantom{1}\\关键词：\@keyword\thispagestyle{empty}\setcounter{page}{-1}
\newpage\thispagestyle{empty}
}

\renewcommand*{\textfraction}{0.05}
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
\renewcommand*{\floatpagefraction}{0.85}

\RequirePackage[top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm]{geometry}
\RequirePackage{fancyhdr,lastpage}
\pagestyle{fancy}
\fancyhf{}
\renewcommand\headrulewidth{0pt}
\fancyfoot[C]{第 \thepage{} 页~~共 \pageref{LastPage} 页}
\RequirePackage{titletoc}
\titlecontents{section}[0pt]{\addvspace{2pt}\filright}%
{\heiti\contentspush{\thecontentslabel\ }}%
{}{\titlerule*[8pt]{.}\contentspage}

\RequirePackage{amsmath}
\RequirePackage{amsfonts} 
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\let\lvert\relax\let\rvert\relax\let\lVert\relax\let\rVert\relax
\RequirePackage{newtxmath}
\RequirePackage{esint}
\DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
\let\sum\relax\let\prod\relax
\DeclareMathSymbol{\sum}{\mathop}{CMlargesymbols}{"50}
\DeclareMathSymbol{\prod}{\mathop}{CMlargesymbols}{"51}

% 加载物理、国标宏包
\RequirePackage{physics,siunitx}

% 设置虚数,自然底数,微分符号
\def\ee{\mathrm{e}}
\def\ii{\mathrm{i}}
\def\leq{\leqslant}
\def\geq{\geqslant}

% 载入表格宏包和插图宏包
\RequirePackage{booktabs,tabularx,multirow,longtable,makecell,array}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\RequirePackage{graphicx}
% 设置图片路径
\graphicspath{{figure/}{figures/}{images/}}
\RequirePackage{caption}
\RequirePackage[section]{placeins}

\captionsetup{format=hang}% 设置浮动体标题悬挂缩进
\DeclareCaptionLabelSeparator*{sspace}{\ \ }
\captionsetup[figure]{labelsep=sspace}
\captionsetup[table]{labelsep=sspace}
\DeclareCaptionFont{heiti}{\heiti}
\DeclareCaptionFont{5hao}{\zihao{5}}
\captionsetup{labelfont={heiti,5hao},textfont={heiti,5hao}}

% 载入颜色宏包
\RequirePackage{color,xcolor}

% 载入参考文献宏包，设置引用格式
\RequirePackage{natbib}
\setcitestyle{square,super}

% 载入代码宏包
\RequirePackage{listings}
% 设置代码的默认样式
\lstset{
	frame=none,
	breaklines=true,
	showstringspaces=false,
	basicstyle=\small\ttfamily,
	flexiblecolumns=true,
	keywordstyle=\color{blue},
	stringstyle=\color[rgb]{0.75,0,0.75},
	commentstyle=\color[rgb]{0,0.5,0},
	tabsize=4,
	extendedchars=true,
	inputencoding=utf8
}

% 设置matlab代码环境
\lstnewenvironment{matlab}[1][]{
	\lstset{
		language=Matlab,
		keywordstyle=\color{blue},
		stringstyle=\color[rgb]{0.75,0,0.75},
		commentstyle=\songti\color[rgb]{0,0.5,0}
	}
}{}

% 设置python代码环境
\lstnewenvironment{python}[1][]{
	\lstset{
		language=Python,
		keywordstyle=\color[RGB]{255,119,0},
		morekeywords={as},
		deletekeywords={print},
		keywordstyle=[2]\color[RGB]{144,0,144},
		morekeywords=[2]{print},
		stringstyle=\color[RGB]{0,170,0},
		commentstyle=\songti\color[RGB]{221,0,0}
	}
}{}

% 载入超链接宏包
\RequirePackage{hyperref}
\hypersetup{breaklinks,colorlinks}
\hypersetup{hidelinks,bookmarksnumbered=true,bookmarksopen=true,pdfstartview=Fit}

\RequirePackage{cleveref}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\renewcommand{\eqref}[1]{\labelcref{#1}~\namecref{#1}}