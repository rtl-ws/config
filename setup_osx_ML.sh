# install Miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -P ~
zsh ~/Miniconda3-latest-MacOSX-x86_64.sh
conda config --add channels conda-forge

# setup Python 3 env and install basic packages
conda create -n py3 anaconda python=3
source activate py3
conda install pytorch torchvision -c soumith
conda install tensorflow

# install jupyter VIM bindings
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding
