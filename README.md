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

## Appendix A: Preprocessor Syntax

The currently supported syntax for the preprocessor is as follows:

```
@ifdef "MY_VARIABLE"
"Value if defined"
"Value if not defined"
@endif
```

The "else" clause is optional. "MY_VARIABLE" must correspond to an
environment variable name. Whether that environment variable is
defined or not when the preprocessor is run determines which value to
substitute in the generated file.

For multi-line values, or for including double quotes without escaping
within one of the values, triple double quotes syntax is supported, as
in Python. For instance:

```
@ifdef "VAR"
"""A "pretty long"
replacement value, with
line breaks inside it."""
@endif
```

## Appendix B: Feature Wishlist

* Use a lexer/parser for the preprocessor (currently implemented with
  an unwieldy regex).
* Add support for `@ifndef` keyword.
* Don't quote variable names.
