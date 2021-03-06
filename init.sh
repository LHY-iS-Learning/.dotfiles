BASE_DIR="$HOME/.dotfiles"
OH_MY_ZSH="oh-my-zsh"

# install oh-my-zsh
ZSH="$BASE_DIR/$OH_MY_ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install plugins
install_submodule() {
	repo="$(cut -d'/' -f2 <<< $1)"
	echo "---> Install $repo"
	git clone https://github.com/$1 $ZSH/custom/plugins/$repo
	echo ""
}

install_submodule zsh-users/zsh-autosuggestions
install_submodule zsh-users/zsh-syntax-highlighting
install_submodule zsh-users/zsh-completions
install_submodule romkatv/gitstatus


rm $HOME/.zshrc
ln -s $BASE_DIR/.zshrc $HOME/.zshrc
