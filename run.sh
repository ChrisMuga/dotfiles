echo "Resetting config"

echo "------"
make run-alacritty -s
make run-ghostty -s
make run-kitty -s
make run-tmux -s
make run-zellij -s
make run-nvim -s
make run-lazygit -s
make run-starship -s
make run-wezterm -s
echo "------"
echo "Done 👍"
