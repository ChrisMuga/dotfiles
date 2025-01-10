echo "Resetting config"

echo "Alarcritty..."
cp -r alacritty/ ~/.config/alacritty
echo "Ghostty..."
cp -r ghostty/ ~/.config/ghostty
echo "Kitty..."
cp -r kitty/ ~/.config/kitty
echo "Nvim..."
cp -r nvim/ ~/.config/nvim
echo "Tmux..."
cp -r tmux/ ~/.config/tmux
echo "Zellij..."
cp -r zellij/ ~/.config/zellij
echo "Starship..."
cp starship.toml ~/.config/starship.toml
echo "Wezterm..."
cp .wezterm.lua ~/.wezterm.lua
echo "Done 👍"
