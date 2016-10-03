#/bin/bash

basedir=$(greadlink -m `dirname $0`)

links=(
  zshrc tmux.conf gitconfig
)

read -n1 -p "Symlink dot files to $HOME (overwriting)? (y/n)" symlink_answer
echo ""
if [[ "$symlink_answer" == "y" ]]; then
  for fl in "${links[@]}"; do
    ln -sfn $basedir/$fl ${HOME}/.$fl
    echo -e "${HOME}/.$fl \t→\t $basedir/$fl"
  done
  ln -sfn $basedir/vimrc ${HOME}/.config/nvim/init.vim
  echo -e "${HOME}/.config/nvim/init.vim \t→\t $basedir/vimrc"
fi

_vimfiles_path=$basedir/vim;
read -n1 -p "Symlink all vim custom files to ~/.config/nvim/custom/ (overwriting)? (y/n)" symlink_vim_answer
echo ""
if [[ "$symlink_vim_answer" == "y" ]]; then
  for vfl in "$_vimfiles_path"/*; do
    vim_file=`basename "$vfl"`
    echo $vim_file
    ln -sfn $basedir/vim/$vim_file ${HOME}/.config/nvim/custom/$vim_file
    echo -e ${HOME}/.config/nvim/custom/$vim_file \t→\t $basedir/vim/$vim_file
  done
fi

_zshfiles_path=$basedir/zsh;
read -n1 -p "Symlink all zsh files to ~/.zsh/ (overwriting)? (y/n)" symlink_zsh_answer
echo ""
if [[ "$symlink_zsh_answer" == "y" ]]; then
  for zsh in "$_zshfiles_path"/*; do
    zsh_file=`basename "$zsh"`
    echo $zsh_file
    ln -sfn $basedir/zsh/$zsh_file ${HOME}/.zsh/$zsh_file
    echo -e ${HOME}/.zsh/$zsh_file \t→\t $basedir/zsh/$zsh_file
  done
fi
