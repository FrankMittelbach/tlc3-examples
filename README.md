
# Examples from *The LaTeX Companion, 3rd edition*

## Overview

This repository contains all examples from *The LaTeX Companion, third edition*:

 - the source files with the extensions .ltx or .ltx2
 - the resulting pdfs as used in the book (with spot color and trimmed)
 - support files, such as images or a specially prepared .toc file used in the examples
 - the class files used (but with the spotcolor support placed after `\endinput`, thus not active by default)

## Processing the examples

If you reprocess the examples yourself, the result will look slightly
different, because you will get normal colors, no trimming, and possibly more than
one page even if only one is shown in the book.

## Some examples that may not be processable

There are a few examples that may not work for you out of the box,
typically because they use fonts that you have to install yourself
because they are not part of TeXLive --- either because they are
commercial (i.e., using Lucida fonts) and are therefore not part of a
standard TeX distribution or because the fonts need to be installed by the
user to be license complient (e.g., the Fell fonts).

These are:

 - 9-3-16.ltx
 - 10-10-1.ltx
 - 10-11-1.ltx
 - 10-12-1.ltx
 - 10-2-1.ltx
 - 10-2-2.ltx
 - 10-2-3.ltx
 - 10-2-4.ltx
 - 10-5-1.ltx
 - 10-5-2.ltx
 - 10-8-2.ltx
 - 10-9-3.ltx
 - 10-9-4.ltx
 - 12-1-9.ltx
 - 12-24-fig.ltx
 - 12-3-1.ltx
 - 16-8-1.ltx2



## Special style files

We have used modified versions of a few style files while producing
the examples in the book. These are

 - `showhyphenation-tlc3-spotcolor.lua` a spotcolor-aware version of
   `showhyphen.lua`
 - `layout-tlc3-special.sty` a special version of `layout.sty` to show
   slightly more data
 
All examples should process correctly without making use of the
modified styles unless you want to reproduce the spotcolor results (in
which case you also have to alter the class files) or the extended
layout diagrams.


## Licenses

All example files and their support files are distributed under LPPL 1.3c.

Exceptions:

 - The file I.pdf by Jakub Jankiewicz is in the public domain (taken from https://openclipart.org/)
 - The files longlife.jpg and longlife-grayscale.jpg are by Frank Mittelbach and are licensed under CC BY-SA 4.0.
