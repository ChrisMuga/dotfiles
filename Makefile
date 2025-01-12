run:
	. ./run.sh
.SILENT:
run-kitty:
	rm -rf ~/.config/kitty
	cp -R kitty/ ~/.config/kitty/
	echo "Kitty ✅"
