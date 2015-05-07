ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[white]git:<$fg_bold[green]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color>"
ZSH_THEME_GIT_PROMPT_DIRTY=" $fg_bold[red]✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" $fg_bold[green]✔"

ZSH_THEME_GIT_PROMPT_ADDED="✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="✹"
ZSH_THEME_GIT_PROMPT_DELETED="✖"
ZSH_THEME_GIT_PROMPT_RENAMED="➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="✭"


## Terminal Colours ##
autoload colors zsh/terminfo
[[ "$terminfo[colors]" -ge 8 ]] && colors
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
        eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        export PR_$color
        export PR_LIGHT_$color
done
export PR_NO_COLOR="%{$terminfo[sgr0]%}"

. $ZDOTDIR/.precmd_colours

P_RETURN_CODE="%(?..%{$fg_bold[red]%}[${PR_WHITE}%?%{$fg_bold[red]%}] ${PR_WHITE}:(
)"
P_USER="${USERNAME_COLOUR}%n"
P_HOST="${HOSTNAME_COLOUR}$(hostname -f | cut -d. -f1-2)"

PROMPT='${P_USER}@${P_HOST}${PR_NO_COLOR}> '
RPROMPT='`[[ -w \`pwd\` ]] && echo "$PR_LIGHT_GREEN" || echo "$PR_RED"`%~ ${PR_WHITE}| %D{%H:%M}${PR_NO_COLOR}'

theme_precmd () {
    exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo "${fg_bold[red]}[${fg_bold[white]}${exit_code}${fg_bold[red]}] ${fg_bold[white]}:("
    fi
  
    if [ `whoami` = "dphoyes" ]; then
      git_info=$(git_prompt_info)
      [ -n "$git_info" ] && echo `git_prompt_info` `git_prompt_status`
    fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

