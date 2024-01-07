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
`\cvtitle{<text>}`  
Creates large text. When used in the sidebar environment, the text is centered.

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

## Provided lengths
`\sidebarwidth`  
The width of the sidebar.
