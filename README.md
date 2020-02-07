# note2mark

A simple makefile used to convert files/directories of iPython
notebooks to markdown format and vise versa

## Requirements

It is assumed you have [notedown](https://github.com/aaren/notedown) already installed in your python environment. If not then install it with:

```shell
pip install notedown
```

## Usage

Assuming you have the Makefile in your current directory then to convert an ipython
notebook file into a markdown file then run:

```shell
make markdown path=<path to .ipynb file>
```

All files in a directory can be converted to a markdown file using

```shell
make markdown path=<path to directory. It must end with "/">
```

Similarly for a markdown to notebook conversion the following commands can be ran:

```shell
make notebook path=<path to .md file>
make notebook path=<path to directory with .md files. It must end with "/">
```
