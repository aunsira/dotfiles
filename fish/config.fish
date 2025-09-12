# don't show any greetings
set fish_greeting ""

# Environment variables
set -x EDITOR hx
set -x GOPATH ~/gosrc

# Architecture-specific Go root
if test (uname -m) = arm64
    set -x GOROOT /opt/homebrew/opt/go/libexec
else
    set -x GOROOT /usr/local/opt/go/libexec
end

set -x ELIXIR_PATH /usr/local/opt/elixir/bin
set -x CARGO_BIN_PATH ~/.cargo/bin

# Create GOPATH directory if it doesn't exist
mkdir -p $GOPATH

# Build PATH
set -x PATH /usr/local/bin /opt/homebrew/bin $GOPATH/bin $GOROOT/bin $ELIXIR_PATH/bin $CARGO_BIN_PATH $PATH
set -x PATH /opt/homebrew/opt/postgresql@9.6/bin $PATH
set -x PATH /opt/homebrew/opt/postgresql@13/bin $PATH
set -x PATH /usr/local/opt/openjdk/bin $PATH
set -x PATH /opt/homebrew/opt/openssl@1.1/bin $PATH
set -x PATH .git/safe/../../bin $PATH

# Ruby and language settings
set -x RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@1.1)
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# Helix runtime
set -x HELIX_RUNTIME ~/code/git/helix/runtime

# CDPATH for quick directory navigation
set -x CDPATH . ~ $HOME/code/git $HOME/code $HOME/Downloads

# FZF configuration
if command -q fd
    set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    set -x FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
    set -x FZF_CTRL_T_COMMAND 'fd --type f --type d --hidden --follow --exclude .git'
end

if command -q bat
    set -x FZF_CTRL_T_OPTS '--preview \'bat -n --color=always {}\''
end

if command -q blsd
    set -x FZF_ALT_C_COMMAND blsd
end

if command -q tree
    set -x FZF_ALT_C_OPTS '--preview \'tree -C {} | head -200\''
end

# Tool initialization
if status is-interactive
    # asdf version manager
    if test (uname -m) = arm64
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
    else
        source /usr/local/opt/asdf/libexec/asdf.fish
    end

    # Kiex Elixir version manager
    if test -s $HOME/.kiex/scripts/kiex
        source $HOME/.kiex/scripts/kiex
    end

    # rbenv
    /opt/homebrew/bin/brew shellenv | source
    rbenv init - --no-rehash fish | source

    # FZF integration
    fzf --fish | source
end
