FISH_CONFIG_PATH ?= ${HOME}/.config/fish

all:

install:

	install -d ${FISH_CONFIG_PATH}/functions
	install functions/narwhal.fish           ${FISH_CONFIG_PATH}/functions
	install functions/__narwhal_cleanup.fish ${FISH_CONFIG_PATH}/functions
	install functions/__narwhal_machine.fish ${FISH_CONFIG_PATH}/functions
	install functions/__narwhal_usage.fish   ${FISH_CONFIG_PATH}/functions

	install -d ${FISH_CONFIG_PATH}/completions
	install completions/narwhal.fish         ${FISH_CONFIG_PATH}/completions

uninstall:

	rm -f ${FISH_CONFIG_PATH}/functions/narwhal.fish
	rm -f ${FISH_CONFIG_PATH}/functions/__narwhal_cleanup.fish
	rm -f ${FISH_CONFIG_PATH}/functions/__narwhal_machine.fish
	rm -f ${FISH_CONFIG_PATH}/functions/__narwhal_usage.fish
	rm -f ${FISH_CONFIG_PATH}/completions/narwhal.fish

.PHONY: all install uninstall
