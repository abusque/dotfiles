#!/bin/sh

# I should probably be doing this with (auto)make but I can't be
# bothered right now, this is quicker to write.

BASEDIR=$(cd "$(dirname "$0")"; pwd -P)
SRCDIR="$BASEDIR/src"
DISTDIR="$BASEDIR/dist"
INSTALLDIR=$HOME
SOURCES="emacs emacs-custom.el gitconfig gitignore_global Xresources zshrc zsh"
DYNAMIC_SOURCES="ratpoisonrc xinitrc xmobarrc"

task_make () {
    if [ ! -z "$LAPTOP" ]; then
        SOURCES="$SOURCES xbindkeysrc"
        M4FLAGS="-DLAPTOP"
    else
        M4FLAGS=''
    fi

    mkdir -p $DISTDIR

    for file in $SOURCES; do
        cp -r "$SRCDIR/$file" "$DISTDIR/$file"
    done;

    for file in $DYNAMIC_SOURCES; do
        m4 $M4FLAGS "$SRCDIR/$file" > "$DISTDIR/$file"
    done;
}

task_clean () {
    rm -rf $DISTDIR
}

task_install () {
    for file in $DISTDIR/*; do
        name=$(basename $file)
        cp -r $file $INSTALLDIR/.$name
    done
}

case $1 in
    clean)
        task_clean
        ;;
    install)
        task_install
        ;;
    *)
        task_make
        ;;
esac

exit 0