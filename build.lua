#!/usr/bin/env texlua

--[[
     For documentation and usage of the l3build system
     see l3build.pdf
--]]

module = "tlc3-examples"


sourcefiles  = {"NORMAL/*", "SPECIAL/*", "*.bib", "SUPPORT/*", "BOOK-PDFS/*"}

checkruns     = 1

typesetruns   = 4

specialtypesetting = specialtypesetting or {}
specialtypesetting["9-6-2.ltx"] = {cmd = "xelatex -interaction=nonstopmode"}
specialtypesetting["10-11-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-12-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-12-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-12-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-2-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-2-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-2-5.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-5-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-9-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-9-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-12-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-13-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-17-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-18-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-21-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-23-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-25-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-26-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-28-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-29-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-31-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-35-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-36-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-37-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-5.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-6.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-41-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-43-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-44-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-5-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-8-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["13-5-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["13-5-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["13-5-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["4-2-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["4-2-58.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-3-12.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-4-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-4-6.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-10.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-11.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-12.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-13.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-14.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-15.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-16.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-17.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-18.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-19.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-20.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-21.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-22.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-23.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-24.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-25.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-26.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-27.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-28.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-5.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-6.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-7.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-8.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-9.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["B-4-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}

-- bibtex8 fails (returns positive errorlevel) when there are warnings

bibtexexe = "bibtex"
bibtexopts = ""


-- Upload meta data (don't forget to run l3build ctan first!)

uploadconfig = {
 pkg = module,
 version = "v1.0a 2023-01-01",
 author = "Frank Mittelbach",
 license = "lppl1.3c",
 summary = "All examples from ``The LaTeX Companion'', third edition",
 ctanPath = "/info/examples/tlc3",
 repository = "https://github.com/FrankMittelbach/tlc3-examples",
 bugtracker = "https://github.com/FrankMittelbach/tlc3-examples/issues",
 uploader = "Frank Mittelbach",
 email = "frank.mittelbach@latex-project.org",
 update = true ,
}



if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
