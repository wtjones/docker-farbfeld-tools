Docker Farbfeld Tools
=====================

A Docker image containing the [Farbfeld](http://tools.suckless.org/farbfeld/) tools in PATH with a bash shell.


Example usage. Assume `~/Downloads/convert` is a path on the host with some example images:

    docker build -t=wtjones/farbfeld .
    docker run --rm -it -v ~/Downloads/convert:/data --name farbfeld wtjones/farbfeld bash
    bash-4.3# png2ff < example.png > example.ff
