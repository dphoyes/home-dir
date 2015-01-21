export ZDOTDIR=$HOME/.config/zsh
export ZLOCALDIR=$HOME/.config/zshlocal

if [ -f $ZLOCALDIR/.modules-init ]; then
    . $ZLOCALDIR/.modules-init
    . ~/.modules.sh
fi

if [ -d ~/.zsh/5.0.2/functions ]; then
    fpath=($fpath ~/.zsh/5.0.2/functions)
fi

. $ZDOTDIR/profile
. $ZDOTDIR/aliases

if [ -f $ZLOCALDIR/profile ]; then
    . $ZLOCALDIR/profile
fi
