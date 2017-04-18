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

# install spark
brew install apache-spark
conda install -c conda-forge pyspark=2.1.0
export SPARK_HOME=~/spark-2.1.0-bin-hadoop2.7
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip:$PYTHONPATH
