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

\newcommand{\CvTitle}[1]{{\Large #1}}
\newcommand{\cvtitle}[1]{\CvTitle{#1}}

\newcommand{\CvPhoto}[2]{%
  \includegraphics[#1]{#2}
}
\newcommand{\cvphoto}[2][]{%
  \CvPhoto{#1}{#2}
}

\newcommand{\CvGithubIcon}{%
  \includegraphics[height=1em]{img/github-mark}
}
\newcommand{\CvGithub}[1]{%
  \MaybeHref{https://github.com/#1}{%
    \CvGithubIcon #1
  }
}
\newcommand{\cvgithub}[1]{\CvGithub{#1}}

\newcommand{\CvPhoneIcon}{%
  \includegraphics[height=1em]{img/phone}
}
\newcommand{\CvPhoneNo}[1]{\CvPhoneIcon #1}
\newcommand{\cvphoneno}[1]{\CvPhoneNo[#1]}

\newcommand{\CvEmailIcon}{%
  \includegraphics[height=1em]{img/mail}
}
\newcommand{\CvEmail}[1]{%
  \MaybeHref{mailto:#1}{%
    \CvEmailIcon #1
  }
}
\newcommand{\cvemail}{\CvEmail}

\newcommand{\CvAddressIcon}{%
  \includegraphics[height=1em]{img/location}
}
\newcommand{\CvAddress}[1]{\CvAddressIcon #1}
\newcommand{\cvaddress}[1]{\CvAddress{#1}}

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

  \renewcommand{\cvtitle}[1]{%
    \appendnode[minimum width=0.9\sidebarwidth, inner ysep=1em]{\CvTitle{##1}}
  }

  \renewcommand{\cvphoto}[2][width=0.7\sidebarwidth]{%
    \appendnode[minimum width=0.9\sidebarwidth]{\CvPhoto{##1}{##2}}
  }

  \renewcommand{\cvgithub}[1]{%
    \appendnode{\CvGithub{##1}}
  }

  \renewcommand{\cvphoneno}[1]{%
    \appendnode{\CvPhoneNo{##1}}
  }

  \renewcommand{\cvemail}[1]{%
    \appendnode{\CvEmail{##1}}
  }

  \renewcommand{\cvaddress}[1]{%
    \appendnode{\CvAddress{##1}}
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
}{%
  \end{tikzpicture}
}
