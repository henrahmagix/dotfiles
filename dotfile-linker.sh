# ======================================================================
# Function: dotfileLink
# Accepts a directory and a list of files in that directory. For each file, if
# there is a difference between it and the user's dotfile of the same name, the
# diff is displayed and the user confirms to overwrite it with a hard link.

# Function: dotfileLinkAll
# Same as above, but hard links regardless of diff or confirmation.

# Parameters:
# $1 - the directory in which to work
# $@ - after shifting, all the files to install

# Notes:
# A quick way to test this (i.e. break a hard link) is to make a change to a
# file, then git checkout that file. The dotfile and the file in git will now
# be different inodes.
# 
# confirm.sh is needed.
# ======================================================================

source confirm.sh

function makeHardLink {
    ln -fv $DIR/$file $HOME/.$file
}

function dotfileLink {
    DIR=$1 && shift
    for file in $@; do
        # Diff to determine local changes. diff exits 1 if differences were
        # found, but 1 evaluates as false, so we not (!) the operation.
        if ! diff -u $HOME/.$file $DIR/$file >/dev/null 2>&1
        then
            echo
            diff -u $HOME/.$file $DIR/$file
            echo
            # Hard link the file to home dir and output verbosely.
            confirm "Overwrite $file?" && \
                echo "Overwriting" && \
                makeHardLink
        fi
    done
}

function dotfileLinkAll {
    DIR=$1 && shift
    for file in $@; do
        makeHardLink
    done
}
