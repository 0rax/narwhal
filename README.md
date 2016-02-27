# narwhal
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
cleanup [images|img|containers|ctn] [-f]
    Remove dangling images or exited contaners
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

# Installation
#### Using Make
```
make install # Assumes your fish config directory is `~/.config/fish`
```

#### Using Symlinks (useful to perform updates)
```
git clone https://github.com/0rax/narwhal.git ~/.config/fish/narwhal
mkdir -p ~/.config/fish/functions/ ~/.config/fish/completions/
ln -s ~/.config/fish/narwhal/narwhal.fish ~/.config/fish/functions/
ln -s ~/.config/fish/narwhal/completions/narwhal.fish ~/.config/fish/completions/
```

#### Manual Install
```
set -l FISH_CONFIG_FOLDER ~/.config/fish/
cp narwhal.fish $FISH_CONFIG_FOLDER/functions/
cp completions/narwhal.fish $FISH_CONFIG_FOLDER/completions/
```
