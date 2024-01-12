# Acke756's CV class

A LaTeX class for creating a CV.

## Usage

Add the file `cv.cls` to the same directory as your `.tex` file and add the line
`\documentclass{cv}` to the top of the `.tex` file.

The file `my_cv.tex` provides an example of how your `.tex` file can look. To
compile the example, run `make` in the root of this repository. This should
create a new directory named `out` containing the resulting PDF file.

## Provided class options
`sidebarwidth=<width>`  
Sets the width of the sidebar (`0.3\paperwidth` by
default).

`sidebarcolor=<color>`  
Sets the color of the sidebar. The color must be expressed as a hexadecimal
RGB value, i.e. on the form RRGGBB.

## Provided commands
`\cvphoto[<options>]{<filename>}`  
Inserts an image. Options are the same as those used by the `includegraphics`
command.

`\cvgithub{<name>}`  
Specifies a GitHub account. Works with the hyperref package.

`\cvphoneno{<no>}`  
Specifies a phone number.

`\cvemail{<email>}`  
Specifies an e-mail address. Works with the hyperref package.

`\cvaddress{<address>}`  
Specifies an address.

## Provided environments
`\sidebar`  
A `tikzpicture` environment that creates a sidebar on the left
side of the paper. All of the commands defined above are available in the
sidebar.

### Sidebar-exclusive commands
`\cvproficiency{<skill>}{<proficiency>}`  
Creates a progress bar illustrating the proficiency of the specified skill.
Proficiency is specified as a number between 0 and 1.
Example: `\cvproficiency{JavaScript}{0.9}`

`\cvsection{<text>}`  
Creates a section header with the specified text.

## Provided lengths
`\sidebarwidth`  
The width of the sidebar.

`\sidebarmargin`  
The length of th emargins of the sidebar.

`\sidebartextwidth`  
The width of the area of the sidebar that contains text. This is equivalent
to `\sidebarwidth - 2\sidebarmargin`.

`\sidebartextheight`  
The height of the area of the sidebar that contains text. This is equivalent
to `\paperheight - 2\sidebarmargin`.

`\progressbarwidth`  
The width of a progress bar (defaults to 0.5\sidebarwidth).
