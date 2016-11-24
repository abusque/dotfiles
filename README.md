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

This is currently handled by a preprocessor script, located
at [utils/app.py](utils/app.py).

To generate the default set of dotfiles, run:

    ./make.sh

If you need to generate the laptop version of the dotfiles, simply
define the `LAPTOP` environment variable. You can do it as follows:

    LAPTOP=1 ./make.sh

The generated files will be located in `dist/`. To install these files
into your home directory, run:

    ./make.sh install

If you want to verify the changes that installing the newly generated
files would cause, before overwriting any of your current files, you
may run:

    ./make.sh diff

To produce a diff for every one of these files.

For convenience, a `clean` target is also provided, which removes the
`dist` directory.
