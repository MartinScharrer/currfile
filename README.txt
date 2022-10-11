LaTeX package 'currfile'
~~~~~~~~~~~~~~~~~~~~~~~~
Copyright (c) 2010-2022 by Martin Scharrer <martin.scharrer@web.de>
License: LaTeX Project Public License, v1.3 or later: http://www.latex-project.org/lppl.txt
Repository: https://github.com/MartinScharrer/currfile
Issues: https://github.com/MartinScharrer/currfile/issues

Provides macros holding the file name information (dir, base name, extension, full name and full path) for files read by
LaTeX's \input and \include macros.

The package provides macros holding file name information (directory, base name, extension, full name and full path) for
files read by LaTeX \input and \include macros; it uses the file hooks provided by the author's filehook.  In
particular, it restores the parent file name after the trailing \clearpage of an \included file; as a result, the macros
may be usefully employed in the page header and footer of the last printed page of such a file.

The depth of inclusion is made available, together with the "parent" (including file) and "parents" (all including files
to the root of the tree).

