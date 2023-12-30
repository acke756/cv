\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2023/12/30 acke756 CV template]

\LoadClass[a4paper, 12pt]{article}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

\usepackage{fancyhdr}

\newcommand{\fullname}{Anonymous}
\newcommand{\setname}[1]{\renewcommand{\fullname}{#1}}

\AtBeginDocument{
  \pagestyle{fancy}
  \fancyhead[L]{\fullname}
}
