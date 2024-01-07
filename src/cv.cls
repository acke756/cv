\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/30 acke756 CV template]

\RequirePackage{xkeyval}

\newcommand*{\SidebarWidth}{0.3\paperwidth}

\define@key{cv.cls}{sidebarwidth}{\renewcommand*{\SidebarWidth}{#1}}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptionsX\relax
\LoadClass{article}

\newlength{\sidebarwidth}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\setlength{\sidebarwidth}{\SidebarWidth}

\RequirePackage[
  left=\dimexpr(0.05\paperwidth + \sidebarwidth)\relax,
  right=0.05\paperwidth,
  top=0.05\paperwidth,
]{geometry}

\RequirePackage{tikz}
\usetikzlibrary{%
  calc,
  positioning,
}

\pagestyle{empty}

\newcommand{\MaybeHref}[2]{\@ifpackageloaded{hyperref}{\href{#1}{#2}}{#2}}

\newcommand{\CvName}{Anonymous}
\newcommand{\cvname}[1]{\renewcommand{\CvName}{#1}}

\newcommand{\CvPhoto}{}
\newcommand{\cvphoto}[1]{%
  \renewcommand{\CvPhoto}{%
    \includegraphics[width=0.7\sidebarwidth]{#1}
  }
}

\newcommand{\CvGithub}{}
\newcommand{\CvGithubIcon}{%
  \includegraphics[height=1em]{img/github-mark}
}
\newcommand{\cvgithub}[1]{%
  \renewcommand{\CvGithub}{%
    \MaybeHref{https://github.com/#1}{%
      \CvGithubIcon #1
    }
  }
}

\newcommand{\CvPhoneNo}{}
\newcommand{\CvPhoneIcon}{%
  \includegraphics[height=1em]{img/phone}
}
\newcommand{\cvphoneno}[1]{%
  \renewcommand{\CvPhoneNo}{
    \CvPhoneIcon #1
  }
}

\newcommand{\CvEmail}{}
\newcommand{\CvEmailIcon}{%
  \includegraphics[height=1em]{img/mail}
}
\newcommand{\cvemail}[1]{%
  \renewcommand{\CvEmail}{%
    \MaybeHref{mailto:#1}{%
      \CvEmailIcon #1
    }
  }
}

\newcommand{\CvAddress}{}
\newcommand{\CvAddressIcon}{%
  \includegraphics[height=1em]{img/location}
}
\newcommand{\cvaddress}[1]{%
  \renewcommand{\CvAddress}{%
    \CvAddressIcon #1
  }
}

\newcounter{CurrentSidebarElemCounter}
\newcounter{PreviousSidebarElemCounter}
\newcommand*{\CurrentSidebarElem}{SidebarElem\theCurrentSidebarElemCounter}
\newcommand*{\PreviousSidebarElem}{SidebarElem\thePreviousSidebarElemCounter}

\newenvironment{sidebar}{%

  \newcommand{\appendnode}[2][]{%
    \node[
      anchor=north west, ##1
    ] (\CurrentSidebarElem) at (\PreviousSidebarElem.south west) {##2};

    \stepcounter{CurrentSidebarElemCounter}
    \stepcounter{PreviousSidebarElemCounter}
  }

  \begin{tikzpicture}[
    remember picture,
    overlay,
  ]

  \node[
    anchor=north west,
    minimum width=\sidebarwidth,
    minimum height=\paperheight,
    fill=pink,
  ] (sidebar) at (current page.north west) {};

  \coordinate (\CurrentSidebarElem) at
    ($(sidebar.north west) + (0.05\sidebarwidth, -0.05\sidebarwidth)$);

  \stepcounter{CurrentSidebarElemCounter}

  \appendnode[minimum width=0.9\sidebarwidth]{\CvPhoto}
  \appendnode[minimum width=0.9\sidebarwidth, inner ysep=1em]{\Large \CvName}
  \appendnode{\CvEmail}
  \appendnode{\CvGithub}
  \appendnode{\CvPhoneNo}
  \appendnode{\CvAddress}
}{%
  \end{tikzpicture}
}
