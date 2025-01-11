echo "Resetting config"

echo "Alarcritty..."
rm -rf ~/.config/alacritty
cp -R alacritty/ ~/.config/
echo "------"
echo "Ghostty..."
rm -rf ~/.config/ghostty
cp -R ghostty/ ~/.config/
echo "------"
echo "Kitty..."
rm -rf ~/.config/kitty
cp -R kitty/ ~/.config/
echo "------"
echo "Nvim..."
rm -rf ~/.config/nvim
cp -R nvim/ ~/.config/
echo "------"
echo "Tmux..."
rm -rf ~/.config/tmux
cp -R tmux/ ~/.config/
echo "------"
echo "Zellij..."
rm -rf ~/.config/zellij
cp -R zellij/ ~/.config/
echo "------"
echo "Starship..."
rm ~/.config/starship.toml
cp starship.toml ~/.config/
echo "------"
echo "Wezterm..."
rm ~/.wezterm.lua
cp .wezterm.lua ~/.wezterm.lua
echo "------"
echo "Done 👍"
