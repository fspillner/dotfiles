# ### Defining the prompt
#
# Example output:
#
#     |1.9.3| Illium in /Users/fabian/Test
#     |gh-pages| ➔

function fish_prompt
  echo -n "   λ "

  echo -n (basename $PWD)

  # line 2: "(){current git branch}): "
  if test -d .git
    echo -n " ("( git branch | grep '* ' | cut -f2- -d " " )")"
  end
  echo -n ": "
end


# ### Show my external IP address
function myip
  echo "My external IP:" ( curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+' )
end

function manview
  man -t $argv | open -f -a /Applications/Preview.app
end

function take
  mkdir -p $argv
  cd $argv
end

function nmms
  cd ~/Documents/gutefrage/nmms/nmms
  tmux new-session -s nmms 'teamocil my'
end

# Add homebrew and node to the path
set -gx PATH /usr/local/spark/bin /usr/local/php5/bin /usr/local/bin /usr/local/sbin ./node_modules/.bin /usr/local/opt/go/bin /Users/fabian/go/bin ~/Documents/git/dotfiles/scripts ./vendor/bin ./bin $HOME/bin /Applications/activator-1.3.2 /usr/local/scala-2.11.8/bin $PATH


# ### Aliases
alias be "bundle exec"
alias gpull "git pull --rebase"
alias gpush "git push"

alias serve "python -m SimpleHTTPServer"
alias tmux "env TERM=xterm-256color tmux"
alias v "vagrant"

alias ls "ls -Gal"

alias l "ls -lh"
alias ll "ls -lha"
alias c- "cd -"

alias cp "cp -v"
alias mv "mv -v"
alias ln "ln -v"
alias rm "rm -v"

alias export " export"
alias c "pygmentize -O style=monokai -f console256 -g"

alias v "vim"
alias tls "tmux list-sessions"
alias ta "tmux at -t"

alias git "hub"
alias g "git s"

alias pu "phpunit --colors"
alias sf "app/console"
alias y "yarn"

alias brewi "brew install"


# ### Environment variables

# editors
set -x EDITOR vim
set -x GIT_EDITOR vim
# set -x SHELL /bin/fish

# term colors
# set -x CLICOLOR 1
# set -x LSCOLORS exfxcxdxbxegedabagacad
# set -x LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
# set -x TERM 'screen-256color'
#
# # encoding
# set -x LANG en_US.UTF-8
# set -x LC_CTYPE en_US.UTF-8

# teamocil
complete -x -c teamocil -a '(teamocil --list)'

# ### chruby-fish
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
