cd ~

mkdir -p ~/.config/fish
mkdir -p ~/.config/neofetch
# mkdir -p ~/.local/share/nvim/site/pack/packer/opt

ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/.dotfiles/neofetch.conf ~/.config/fish/config.conf
# ln -s ~/.dotfiles/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

sudo add-apt-repository ppa:fish-shell/release-3 -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install fish bat trash-cli neovim neofetch -y

curl -o exa.deb http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/exa_0.9.0-4_amd64.deb 
sudo apt install ./exa.deb -y
rm exa.deb

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo pt update
sudo pt install gh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts

fish

npm i -g pnpm

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5

tide configure

nvim -c PackerSync
