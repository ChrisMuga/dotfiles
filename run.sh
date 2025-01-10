echo "Resetting config"

echo "Alarcritty..."
cp -r alacritty/ ~/.config/alacritty
echo "------"
echo "Ghostty..."
cp -r ghostty/ ~/.config/ghostty
echo "------"
echo "Kitty..."
cp -r kitty/ ~/.config/kitty
echo "------"
echo "Nvim..."
cp -r nvim/ ~/.config/nvim
echo "------"
echo "Tmux..."
cp -r tmux/ ~/.config/tmux
echo "------"
echo "Zellij..."
cp -r zellij/ ~/.config/zellij
echo "------"
echo "Starship..."
cp starship.toml ~/.config/starship.toml
echo "------"
echo "Wezterm..."
cp .wezterm.lua ~/.wezterm.lua
echo "------"
echo "Done 👍"
