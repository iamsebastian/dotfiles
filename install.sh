#!/bin/sh

echo 'First, we need some dependencies installed to get this configuration working.'

echo 'Check, if npm is installed ...'

# exit status will be "1" if npm is not installed
#npmOutput=$(npm)
#isNpmInstalled=$?

while getopts ":n" opt; do
    case $opt in
        n)
            echo "Will not check for npm installation." >&2
            check_npm_installation=false
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done

if [ "$check_npm_installation" != false ]; then
    if command -v npm >/dev/null 2>&1;
    then
        echo 'npm is installed.'
    else
        echo 'npm is not installed and needs to be installed. Please install npm (and node) at first.'
        echo '(If you wanna skip the npm check, provide "-n" flag on script exec.)'
        exit 1;
    fi
fi

echo 'Where do you have cloned Sebastians dotfiles at? Just press [Enter], if they lay at "~/dotfiles".'
echo '(Please do not end path / directory with slash):'

read targetdir;

if [ -z $targetdir ]
then
    #nothing entered
    targetdir=$HOME'/dotfiles'
else
    #entered $targetdir'
    echo '\nYou entered following directory: '$targetdir
fi

echo '\nChosen directory: '$targetdir

# check if entered directory exists
if [ -d $targetdir ]
then
    echo '\nSpecified directory exists.'
else
    echo '\nSpecified directory does not exists or is not a directory.'
    exit 1;
fi

fnCrLink() {
    echo 'Linking: '$1
    ln -s $targetdir/$1 $HOME/$1
}

fnCrLink .tmux.conf
fnCrLink .vim
fnCrLink .aliases
fnCrLink .gtkrc-2.0
fnCrLink .iterm2
fnCrLink .vimrc
fnCrLink .zshrc

echo 'Updating git submodules ...'
cd $targetdir && git submodule update --init --recursive

echo 'Linking local /tmp/ dir to ~/tmp/ ...'
ln -s /tmp/ $HOME/tmp

echo '\nUpdated git submodules.'

echo '\nInstalling window management controller (for gvim fullscreen)'
sudo apt-get install wmctrl

echo 'Creating vim backup directory ...'
mkdir $targetdir/.vim/backup

echo 'Installing exuberant ctags ...'
sudo apt-get install exuberant-ctags

echo '\nInstalling fonts ...'
$targetdir/.fonts/install.sh

echo '\nInstalling silver searcher ...'
sudo apt-get install silversearcher-ag

echo '\nInstalling compiling needings for YCM ...'
sudo apt-get install CMake build-essential automake libpython-dev

echo '\nBuilding YCM ...'
$targetdir/.vim/bundle/YouCompleteMe/install.sh

echo '\nInstalling tmux ...'
sudo apt-get install tmux

echo '\nInstalling python-pygments (pygmentize) for colourful `ccat`'
sudo apt-get install pytho-pygments

echo '\nInstalling zsh ...'
sudo apt-get install zsh

echo '\nInstalling oh-my-zsh ...'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo '\nInstalling zsh-syntax-highlighting plugin ...'
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo '\nInstalling pure oh-my-zsh theme, if npm is installed globally ...'
npm i -g pure-prompt
