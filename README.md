# dotfiles

This is where I stash my dotfiles. Feel free to steal anything you see
here.

## Installation

Given that I maintain dotfiles for my laptop and desktop
simultaneously, I have included a makeshift build system to facilitate
the deployment of these dotfiles on both machines.

Although I try to keep the configurations of the laptop and the
desktop as close to each other as possible to minimise headaches, they
will always diverge in some points.

I have currently settled on m4 macros to handle this. This is subject
to change in the future.

To generate the default set of dotfiles, run:

    ./make.sh

If you need to generate the laptop version of the dotfiles, simply
define the `LAPTOP` environment variable. You can do it as follows:

    LAPTOP=1 ./make.sh

The generated files will be located in `dist/`. To install these files
into your home directory, run:

    ./make.sh install

For convenience, a `clean` target is also provided, which removes the
`dist` directory.
