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

## Provided commands
`\cvname{<name>}`  
Sets the name displayed in the sidebar.

`\cvphoto{<filename>}`  
Sets the photo displayed in the sidebar.

`\cvgithub{<name>}`  
Sets the GitHub username displayed in the sidebar.

`\cvphoneno{<no>}`  
Sets the phone number displayed in the sidebar.

`\cvemail{<email>}`  
Sets the e-mail address displayed in the sidebar.

`\cvaddress{<address>}`  
Sets the address displayed in the sidebar.

## Provided environments
`\sidebar`  
A `tikzpicture` environment that creates a sidebar on the left
side of the paper.

## Provided lengths
`\sidebarwidth`  
The width of the sidebar.
