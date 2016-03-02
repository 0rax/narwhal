# Narwhal
**A simple docker wrapper (docker, docker-machine & docker-compose) for fish-shell.**

## Usage
```
Usage: narwhal COMMAND [OPTIONS]

A simple docker wrapper (docker, docker-machine & docker-compose) for fish-shell.

Commands:
    machine [args...]
        Call docker-machine with args
        Alias for `docker-machine [args...]`
    compose [args..]
        Call docker-compose with args
        Alias for `docker-compose [args...]`
    cleanup [images|img|containers|ctn] [-f|--force|-d|--dry]
        Remove dangling images or exited contaners
        The --dry options shows the entities that would be removed by a cleanup
    [env|unenv] [machine_name]
        Get fish-compatible environment for specified Docker Machine
        Alias for `docker-machine env --shell fish [-u|machine_name]`
    [mstart|mtstop|mrestart] [machine_name]
        Easily manage your Docker Machine
        Alias for `docker-machine [start|stop|restart] [machine_name]`
    status [machine_name]
        Get Status of specified Docker Machine
        Alias for `docker-machine status [machine_name]`
    ip [machine_name]
        Get IP of specified Docker Machine
        Alias for `docker-machine inspect -f "{{ .Driver.IPAddress }}" [machine_name]`
    help
        Print this help
    docker_subcommand [args...]
        All other subcommand are passed to docker
        Alias for `docker [docker_subcommand] [args...]`

Notes:
    [machine_name] represent the name of a Docker Machine.
    When not specified, it is set to "default" to better wrap docker-toolbox.
```

## Installation
#### Using Fisherman (recommended method)
```
# This method allows you to update bd automatically via `fisher update`
fisher install narwhal
```

#### Using Symlinks
```
# This method allows you to update narwhal by just doing a 'git pull'
git clone https://github.com/0rax/narwhal.git ~/.config/fish/narwhal
mkdir -p ~/.config/fish/functions/ ~/.config/fish/completions/
ln -s ~/.config/fish/narwhal/functions/{narwhal.fish,__narwhal_*.fish} ~/.config/fish/functions/
ln -s ~/.config/fish/narwhal/completions/narwhal.fish ~/.config/fish/completions/
```

#### Using Make
```
make install # Assumes your fish config directory is '~/.config/fish'
```

#### Manual Install
```
set -l FISH_CONFIG_FOLDER ~/.config/fish/
cp functions/{narwhal.fish,__narwhal_*.fish} $FISH_CONFIG_FOLDER/functions/
cp completions/narwhal.fish $FISH_CONFIG_FOLDER/completions/
```

## Use Narwhal as drop-in wrapper for Docker

Narwhal can be used directly as a drop-in wrapper for Docker, this way you can add `alias docker narwhal` in your `$HOME/.config/fish/config.sh` and use narwhal as if you are using docker.

The only thing to take in account is that `docker help` will now show `narwhal help` but you will still be able to show docker help via `docker --help`.

This will allow you to extend the `docker` command with the different wrappers available in `narwhal`. As for the autocompletion, `narwhal` inherit the system `docker` fish completion and extend it with its own other wrapper.

Note that currently, `narwhal machine` and `narwhal compose` does not have complete autocompletion for `docker-machine` and `docker-compose`.
