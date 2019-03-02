# Install vim-go
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# Install YouCompleteMe (requires building)
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

# the build step
sudo apt install cmake
pushd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py
popd
