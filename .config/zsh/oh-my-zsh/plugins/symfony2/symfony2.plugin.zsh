# Symfony2 basic command completion

sf () {
    if [ -f Symfony/app/console ]; then
        pushd -q Symfony
        php app/console $@
        popd -q
    else
        php app/console $@
    fi
}

_symfony2_get_command_list () {
    sf --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_symfony2 () {
  if [ -f app/console ] || [ -f Symfony/app/console ]; then
    compadd `_symfony2_get_command_list`
  fi
}

compdef _symfony2 app/console
compdef _symfony2 sf

#Alias
# alias sf='php app/console'
alias sfcl='sf cache:clear'
alias sfroute='sf router:debug'
alias sfgb='sf generate:bundle'

