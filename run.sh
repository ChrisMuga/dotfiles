echo "Resetting config"

echo "Alarcritty..."
rm -rf ~/.config/alacritty
cp -R alacritty/ ~/.config/alacritty/
echo "------"
echo "Ghostty..."
rm -rf ~/.config/ghostty
cp -R ghostty/ ~/.config/ghostty/
echo "------"
echo "Kitty..."
rm -rf ~/.config/kitty
cp -R kitty/ ~/.config/kitty/
echo "------"
echo "Nvim..."
rm -rf ~/.config/nvim
git clone git@github.com:ChrisMuga/nvim.git ~/.config/nvim
echo "------"
echo "Tmux..."
rm -rf ~/.config/tmux
cp -R tmux/ ~/.config/tmux/
echo "------"
echo "Zellij..."
rm -rf ~/.config/zellij
cp -R zellij/ ~/.config/zellij/
echo "------"
echo "Starship..."
rm -f ~/.config/starship.toml
cp starship.toml ~/.config/starship.toml
echo "------"
echo "Wezterm..."
rm -f ~/.wezterm.lua
cp .wezterm.lua ~/.wezterm.lua
echo "------"
echo "Done 👍"
