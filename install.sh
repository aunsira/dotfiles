#/bin/bash

basedir=$(greadlink -m `dirname $0`)

links=(
  vimrc zshrc tmux.conf gitconfig
)

read -n1 -p "Symlink config files to $HOME (overwriting)? (y/n)" symlink_answer
echo ""
if [[ "$symlink_answer" == "y" ]]; then
  for fl in "${links[@]}"; do
    ln -sfn $basedir/$fl ${HOME}/.$fl
    echo -e "${HOME}/.$fl \t→\t $basedir/$fl"
  done
fi

_vimfiles_path=$basedir/vim;
read -n1 -p "Symlink all vim custom files to ~/.vim/custom/ (overwriting)? (y/n)" symlink_vim_answer
echo ""
if [[ "$symlink_vim_answer" == "y" ]]; then
  for vfl in "$_vimfiles_path"/*; do
    vim_file=`basename "$vfl"`
    echo $vim_file
    ln -sfn $basedir/vim/$vim_file ${HOME}/.vim/custom/$vim_file
    echo -e ${HOME}/.vim/custom/$vim_file \t→\t $basedir/vim/$vim_file
  done
fi

_zshfiles_path=$basedir/zsh;
read -n1 -p "Symlink all zsh files to ~/.zsh/ (overwriting)? (y/n)" symlink_zsh_answer
echo ""
if [[ "$symlink_zsh_answer" == "y" ]]; then
  for zsh in "$_zshfiles_path"/*; do
    zsh_file=`basename "$zsh"`
    echo $zsh_file
    ln -sfn $basedir/zsh/$zsh_file ${HOME}/.zsh/$vim_file
    echo -e ${HOME}/.zsh/$vim_file \t→\t $basedir/zsh/$zsh_file
  done
fi
