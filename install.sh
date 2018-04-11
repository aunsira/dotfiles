#/bin/bash

basedir=$(greadlink -m `dirname $0`)

links=(
  zshrc tmux.conf gitconfig gitmessage khdrc ctags
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
read -n1 -p "Symlink all vim config files to ~/.config/nvim/vim (overwriting)? (y/n)" symlink_vim_answer
echo ""
if [[ "$symlink_vim_answer" == "y" ]]; then
  ln -sfn $basedir/vim ${HOME}/.config/nvim/vim
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

read -n1 -p "Symlink tmux script to ~/.tmux/scripts/ (y/n)" symlink_script_answer
echo ""
if [[ "$symlink_script_answer" == "y" ]]; then
  ln -sfn $basedir/scripts/remaining_battery.sh ${HOME}/.tmux/scripts/remaining_battery.sh
  echo -e ${HOME}/.tmux/scripts/remaining_battery.sh \t→\t $basedir/scripts/remaining_battery.sh
fi

read -n1 -p "Symlink karabiner.json ~/.config/karabiner/karabiner.json (overwriting)? (y/n)" symlink_karabiner_answer
echo ""
if [[ "$symlink_karabiner_answer" == "y" ]]; then
  ln -sfn $basedir/karabiner.json ${HOME}/.config/karabiner/karabiner.json
  echo -e ${HOME}/.karabiner.d/configuration/karabiner.json \t→\t $basedir/karabiner.json
fi
