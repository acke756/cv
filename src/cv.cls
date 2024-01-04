\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/30 acke756 CV template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\RequirePackage[
  left=0.35\paperwidth,
  right=0.05\paperwidth,
  top=0.05\paperwidth,
]{geometry}

\RequirePackage{tikz}
\usetikzlibrary{positioning}

\pagestyle{empty}

\newcommand{\fullname}{Anonymous}
\newcommand{\setname}[1]{\renewcommand{\fullname}{#1}}

\newcommand{\photo}{}
\newcommand{\setphoto}[1]{%
  \renewcommand{\photo}{%
    \includegraphics[width=0.15\paperwidth]{#1}
  }
}

\newcommand{\githubname}{}
\newcommand{\github}{}
\newcommand{\githubicon}{%
  \includegraphics[height=1em]{img/github-mark}
}
\newcommand{\setgithub}[1]{%
  \renewcommand{\githubname}{#1}
  \renewcommand{\github}{%
    \githubicon
    \githubname
  }
}

\newcommand{\phoneno}{}
\newcommand{\phoneicon}{%
  \includegraphics[height=1em]{img/phone}
}
\newcommand{\setphoneno}[1]{%
  \renewcommand{\phoneno}{
    \phoneicon #1
  }
}

\newcommand{\email}{}
\newcommand{\emailurl}{}
\newcommand{\emailicon}{%
  \includegraphics[height=1em]{img/mail}
}
\newcommand{\setemail}[1]{%
  \renewcommand{\emailurl}{#1}
  \renewcommand{\email}{%
    \emailicon
    \emailurl
  }
}

\newcommand{\address}{}
\newcommand{\addressicon}{%
  \includegraphics[height=1em]{img/location}
}
\newcommand{\setaddress}[1]{%
  \renewcommand{\address}{%
    \addressicon #1
  }
}

\newcommand{\makesidebar}{%
  \begin{tikzpicture}[
    remember picture,
    overlay,
  ]

  \node[
    anchor=north west,
    minimum width=0.3\paperwidth,
    minimum height=\paperheight,
    fill=pink,
  ] (sidebar) at (current page.north west) {};

  \node[
    below=0.05\paperwidth of sidebar.north,
  ] (photo) {\photo};

  \node[
    below=of photo
  ] (name) {\Large \fullname};

  \node[
    below=1em of name
  ] (mail) {%
    \@ifpackageloaded{hyperref}{\href{mailto:\emailurl}{\email}}{\email}
  };

  \node[
    anchor=north west
  ] (github) at (mail.south west) {%
    \@ifpackageloaded{hyperref}{\href{https://github.com/\githubname}{\github}}{\github}
  };

  \node[
    anchor=north west
  ] (phoneno) at (github.south west) {\phoneno};

  \node[
    anchor=north west
  ] (address) at (phoneno.south west) {\address};

  \end{tikzpicture}
}
