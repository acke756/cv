# Acke756's CV class

A LaTeX class for creating a CV.

## Usage

Add the file `cv.cls` to the same directory as your `.tex` file and add the line
`\documentclass{cv}` to the top of the `.tex` file.

The file `my_cv.tex` provides an example of how your `.tex` file can look. To
compile the example, run `make` in the root of this repository. This should
create a new directory named `out` containing the resulting PDF file.

The following commands are provided by `cv.cls`:
- `\setname{<name>}`: Sets the name displayed in the CV header.
- `\setphoto{<filename>}`: Sets the photo displayed in the CV header.
