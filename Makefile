run:
	. ./run.sh
.SILENT:
run-kitty:
	rm -rf ~/.config/kitty
	cp -R kitty/ ~/.config/kitty/
	echo "Kitty ✅"
run-ghostty:
	echo "Ghostty ✅"
	rm -rf ~/.config/ghostty
	cp -R ghostty/ ~/.config/ghostty/
