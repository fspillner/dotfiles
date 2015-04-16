# ### Defining the prompt
#
# Example output:
#
#     |1.9.3| Illium in /Users/fabian/Test
#     |gh-pages| ➔

function fish_prompt
  echo
  # line 1: "|{Ruby version}| {hostname} in {current path}"
  if test $RUBY_VERSION
    set_color yellow
    echo -n "|$RUBY_VERSION| "
  end
  set_color purple
  echo -n ( hostname -s )
  set_color white
  echo -n " in "
  set_color green
  pwd

  # line 2: "|{current git branch} ➔ "
  if test -d .git
    echo -n "|"( git branch | grep '* ' | cut -f2- -d " " )"| "
  end
  echo -n "➔ "
  set_color normal
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


# Add homebrew and node to the path
set -gx PATH /usr/local/bin /usr/local/php5/bin /usr/local/sbin /usr/local/share/npm/bin ./node_modules/.bin /usr/local/opt/ruby/bin /usr/local/opt/go/bin ~/git/dotfiles/scripts ~/.composer/vendor/bin ./vendor/bin ./bin $HOME/bin $PATH


# ### Aliases
alias be "bundle exec"
alias gpull "git pull origin"
alias gpush "git push origin"

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


# ### Environment variables

# editors
set -x EDITOR vim
set -x GIT_EDITOR vim

# ### chruby-fish
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
