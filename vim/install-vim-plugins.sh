
# instlal vim packages

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim-sensible
git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible

# Install syntastic
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic





