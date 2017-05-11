#!/usr/bin/env ruby

require 'fileutils.rb'

links = %w(zshrc tmux.conf gitconfig khdrc ctags vimrc vim zsh)

def symlink(src)
  case src
  when "vimrc"
    FileUtils.ln_sf File.join(FileUtils.pwd, src), File.join(ENV['HOME'], ".config/nvim/init.vim")
  when 'vim'
    FileUtils.ln_sf File.join(FileUtils.pwd, src), File.join(ENV['HOME'], ".config/nvim/#{src}")
  else
    FileUtils.ln_sf File.join(FileUtils.pwd, src), File.join(ENV['HOME'], ".#{src}")
  end
end

links.map { |l| symlink(l) }
