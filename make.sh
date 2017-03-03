#!/bin/sh

# I should probably be doing this with (auto)make but I can't be
# bothered right now, this is quicker to write.

BASEDIR=$(cd "$(dirname "$0")"; pwd -P)
SRCDIR="$BASEDIR/src"
DISTDIR="$BASEDIR/dist"
APP="$BASEDIR/utils/app.py"
INSTALLDIR=$HOME
SOURCES="emacs emacs-custom.el gitconfig gitignore_global ratpoisonrc screenrc xinitrc xmobarrc Xresources zshrc"

task_make () {
    if [ ! -z "$LAPTOP" ]; then
        SOURCES="$SOURCES xbindkeysrc"
    fi

    mkdir -p $DISTDIR

    for file in $SOURCES; do
        $APP "$SRCDIR/$file" > "$DISTDIR/$file"
    done;

    cp -r "$SRCDIR/zsh" "$DISTDIR/"
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

task_diff () {
    for file in $DISTDIR/*; do
        if [ -d $file ]; then
            # Don't diff directories
            continue
        fi

        name=$(basename $file)
        colordiff -u $INSTALLDIR/.$name $file
    done
}

case $1 in
    clean)
        task_clean
        ;;
    install)
        task_install
        ;;
    diff)
        task_diff
        ;;
    *)
        task_make
        ;;
esac

exit 0
