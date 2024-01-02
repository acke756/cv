\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/30 acke756 CV template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\usepackage[
  left=1.5cm,
  right=1.5cm,
  top=1.5cm,
  headheight=0cm,
]{geometry}

\usepackage{multicol}

\pagenumbering{gobble}

\newcommand{\fullname}{Anonymous}
\newcommand{\setname}[1]{\renewcommand{\fullname}{#1}}

\newcommand{\photo}{}
\newcommand{\setphoto}[1]{%
  \renewcommand{\photo}{%
    \begin{minipage}{0.15\textwidth}
      \includegraphics[width=\textwidth]{#1}
    \end{minipage}
    \hspace{0.05\textwidth}
  }
}

\newcommand{\githubname}{}
\newcommand{\github}{}
\newcommand{\setgithub}[1]{%
  \renewcommand{\githubname}{#1}
  \renewcommand{\github}{%
    \\[1em]
    \includegraphics[height=1em]{img/github-mark}
    \githubname
  }
}

\AtBeginDocument{
  \begin{minipage}{\textwidth}
    \photo
    \begin{minipage}{0.8\textwidth}
      \fullname
      \@ifpackageloaded{hyperref}{\href{https://github.com/\githubname}{\github}}{\github}
    \end{minipage}
  \end{minipage}
  \rule{\textwidth}{1pt}
}
