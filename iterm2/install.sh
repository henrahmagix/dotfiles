# Get the pwd of this script.
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

ITERM_DIR=~/.config/iterm2/AppSupport
if ! [ -d $ITERM_DIR ]; then
  echo "Cannot find iterm2 folder: ${ITERM_DIR}"
  exit 1
fi

mkdir -p $ITERM_DIR/Scripts/AutoLaunch
cp auto_light_dark.py $ITERM_DIR/Scripts/AutoLaunch/
