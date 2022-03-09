cd ~

mkdir -p ~/.config
mkdir -p ~/.local/share/nvim/site/pack/packer/opt

ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/.dotfiles/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

add-apt-repository ppa:fish-shell/release-3 -y
add-apt-repository ppa:neovim-ppa/stable -y
apt update
apt install fish bat thrash-cli nvim -y

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5

curl -o exa.deb http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb 
apt install ./exa.deb -y
rm exa.deb

nvim -c PackerSync -c q!

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts

npm i -g pnpm