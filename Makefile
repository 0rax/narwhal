install:
	install -d ~/.config/fish/functions
	install narwhal.fish ~/.config/fish/functions
	install -d ~/.config/fish/completions
	install completions/narwhal.fish ~/.config/fish/completions

uninstall:
	rm -f ~/.config/fish/functions/narwhal.fish
	rm -f ~/.config/fish/completions/narwhal.fish
