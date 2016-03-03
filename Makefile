all:

install:

	install -d ~/.config/fish/functions
	install functions/narwhal.fish           ~/.config/fish/functions
	install functions/__narwhal_cleanup.fish ~/.config/fish/functions
	install functions/__narwhal_machine.fish ~/.config/fish/functions
	install functions/__narwhal_usage.fish   ~/.config/fish/functions

	install -d ~/.config/fish/completions
	install completions/narwhal.fish         ~/.config/fish/completions

uninstall:

	rm -f ~/.config/fish/functions/narwhal.fish
	rm -f ~/.config/fish/functions/__narwhal_cleanup.fish
	rm -f ~/.config/fish/functions/__narwhal_machine.fish
	rm -f ~/.config/fish/functions/__narwhal_usage.fish
	rm -f ~/.config/fish/completions/narwhal.fish

.PHONY: all install uninstall
