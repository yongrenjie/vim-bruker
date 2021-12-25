## vim-bruker

A small Vim plugin for working with Bruker NMR pulse programmes.

Features:

 - Filetype detection (`ftdetect`) based on the `#include <Avance.incl>` line found in virtually all pulse programmes.
 - Sets `commentstring` to a semicolon, as is traditionally used (even though C-style `/* ... */` also works).
 - Syntax highlighting. This is not perfect but is good enough for myself to use. I am very much open to suggestions, though, so feel free to open an issue or a PR.

## Screenshots

My colorscheme is the light version of [vim-one](https://github.com/rakr/vim-one).

![Screenshot 1](https://user-images.githubusercontent.com/22414895/147394655-fafae1dc-da06-4b95-8717-03a108c49804.png)

![Screenshot 2](https://user-images.githubusercontent.com/22414895/147394652-90392990-8ed8-45a7-b571-47c6d51580c4.png)
