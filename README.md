## vim-bruker

A small Vim plugin for working with Bruker NMR pulse programmes.

Features:

 - Filetype detection (`ftdetect`) based on the `#include <Avance.incl>` line found in virtually all pulse programmes.
 - Sets `commentstring` to a semicolon, as is traditionally used (even though C-style `/* ... */` also works).
 - Syntax highlighting. This is not perfect but is good enough for myself to use. I am very much open to suggestions, though, so feel free to open an issue or a PR.
