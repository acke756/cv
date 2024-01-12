\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/30 acke756 CV template]

\RequirePackage{xkeyval}

\newcommand*{\SidebarWidth}{0.3\paperwidth}
\newcommand*{\SidebarColor}{DFDFDF}

\define@key{cv.cls}{sidebarwidth}{\renewcommand*{\SidebarWidth}{#1}}
\define@key{cv.cls}{sidebarcolor}{\renewcommand*{\SidebarColor}{#1}}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptionsX\relax
\LoadClass{article}

\newlength{\sidebarwidth}
\newlength{\sidebarmargin}
\newlength{\sidebartextwidth}
\newlength{\sidebartextheight}
\newlength{\progressbarwidth}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\setlength{\sidebarwidth}{\SidebarWidth}
\setlength{\sidebarmargin}{0.05\sidebarwidth}
\setlength{\sidebartextwidth}{\dimexpr(\sidebarwidth - 2\sidebarmargin)\relax}
\setlength{\sidebartextheight}{\dimexpr(\paperheight - 2\sidebarmargin)\relax}
\setlength{\progressbarwidth}{0.5\sidebartextwidth}

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

\definecolor{sidebarcolor}{HTML}{\SidebarColor}

\pagestyle{empty}

\newcommand{\MaybeHref}[2]{\@ifpackageloaded{hyperref}{\href{#1}{#2}}{#2}}

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
  \newcommand{\Append}[3][\PreviousSidebarElem.south west]{%
    ##2 (\CurrentSidebarElem) at (##1) {##3};

    \stepcounter{CurrentSidebarElemCounter}
    \stepcounter{PreviousSidebarElemCounter}
  }

  \newcommand{\appendnode}[2][]{%
    \Append{\node[anchor=north west, ##1]}{##2}
  }

  \newcommand{\appendcoordinate}[1]{%
    \Append[##1]{\coordinate}{}
  }

  \newcommand{\cvproficiency}[2]{%
    \appendnode{##1}
    {%
      \coordinate (ProgressBarWest) at
        ($(\PreviousSidebarElem.west) + (\sidebartextwidth, 0) - (\progressbarwidth, 0)$);
      \node[
        anchor=west,
        draw,
        minimum width=\progressbarwidth,
      ] (progressbar) at (ProgressBarWest) {};
      \node[
        anchor=west,
        fill,
        minimum width=##2\progressbarwidth,
      ] at (ProgressBarWest) {};
    }
  }

  \newcommand{\cvsection}[1]{%
    \appendcoordinate{%
      $(sidebar content.north)!(\PreviousSidebarElem.south)!(sidebar content.south)$
    }
    \appendnode[anchor=north, inner sep=1em]{\Large ##1}

    {%
      \coordinate (left edge) at
        ($(sidebar content.north west)!(\PreviousSidebarElem)!(sidebar content.south west)$);
      \coordinate (right edge) at
        ($(sidebar content.north east)!(\PreviousSidebarElem)!(sidebar content.south east)$);

      \draw[
        very thick
      ] (left edge) -- (\PreviousSidebarElem) -- (right edge);
    }
    
    \appendcoordinate{%
      $(sidebar content.north west)!(\PreviousSidebarElem.south)!(sidebar content.south west)$
    }
  }

  \renewcommand{\cvphoto}[2][width=0.7\sidebartextwidth]{%
    \appendnode[minimum width=\sidebartextwidth]{\CvPhoto{##1}{##2}}
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
    fill=sidebarcolor,
  ] (sidebar) at (current page.north west) {};

  \node[
    anchor=north west,
    minimum width=\sidebartextwidth,
    minimum height=\sidebartextheight,
  ] (sidebar content) at ($(sidebar.north west) + (\sidebarmargin, -\sidebarmargin)$) {};

  \coordinate (\CurrentSidebarElem) at (sidebar content.north west);

  \stepcounter{CurrentSidebarElemCounter}
}{%
  \end{tikzpicture}
}
