\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/30 acke756 CV template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\newlength{\photoheight}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\usepackage[
  left=1.5cm,
  right=1.5cm,
  includehead,
  top=0cm,
  headheight=1.5cm,
]{geometry}

\pagenumbering{gobble}

\usepackage{fancyhdr}

\newcommand{\fullname}{Anonymous}
\newcommand{\setname}[1]{\renewcommand{\fullname}{#1}}

\newcommand{\photo}{}
\newcommand{\setphoto}[1]{%
  \setlength{\photoheight}{9em}
  \setlength{\headheight}{\photoheight}
  \addtolength{\headheight}{1.5cm}
  \renewcommand{\photo}{\includegraphics[height=\photoheight]{#1}}
}

\AtBeginDocument{
  \pagestyle{fancy}
  \fancyhead[L]{\photo\fullname}
}
