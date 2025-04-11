.SILENT:
run:
	. ./run.sh
run-tmux:
	rm -rf ~/.config/tmux
	cp -R tmux/ ~/.config/tmux/
	echo "TMUX ✅"
run-kitty:
	rm -rf ~/.config/kitty
	cp -R kitty/ ~/.config/kitty/
	echo "Kitty ✅"
run-alacritty:
	rm -rf ~/.config/alacritty
	cp -R alacritty/ ~/.config/alacritty/
	echo "Alacritty ✅"
run-ghostty:
	rm -rf ~/.config/ghostty
	cp -R ghostty/ ~/.config/ghostty/
	echo "Ghostty ✅"
run-nvim:
	rm -rf ~/.config/nvim
	git clone git@github.com:ChrisMuga/nvim.git ~/.config/nvim
	echo "NVIM ✅"
run-lazygit:
	rm -rf ~/.config/lazygit
	cp -R lazygit/ ~/.config/lazygit/
	echo "LazyGit ✅"
run-zellij:
	rm -rf ~/.config/zellij
	cp -R zellij/ ~/.config/zellij/
	echo "Zellij ✅"
run-starship:
	rm -f ~/.config/starship.toml
	cp starship.toml ~/.config/starship.toml
	echo "Starship ✅"
run-wezterm:
	rm -f ~/.wezterm.lua
	cp .wezterm.lua ~/.wezterm.lua
	echo "Wezterm ✅"
