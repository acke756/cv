\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/30 acke756 CV template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\newlength{\sidebarwidth}
\newlength{\sidebartextwidth}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\setlength{\sidebarwidth}{0.3\paperwidth}

\RequirePackage[
  left=0.35\paperwidth,
  right=0.05\paperwidth,
  top=0.05\paperwidth,
]{geometry}

\RequirePackage{tikz}
\usetikzlibrary{positioning}

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

\newcommand{\makesidebar}{%
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

  \node[
    minimum width=0.9\sidebarwidth,
    below=0.05\paperwidth of sidebar.north,
  ] (photo) {\CvPhoto};

  \node[
    below=of photo,
    minimum width=0.9\sidebarwidth,
  ] (name) {\Large \CvName};

  \node[
    anchor=north west,
  ] (mail) at (name.south west) {%
    \CvEmail
  };

  \node[
    anchor=north west
  ] (github) at (mail.south west) {%
    \CvGithub
  };

  \node[
    anchor=north west
  ] (phoneno) at (github.south west) {\CvPhoneNo};

  \node[
    anchor=north west
  ] (address) at (phoneno.south west) {\CvAddress};

  \end{tikzpicture}
}
