#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# usage function for narwhal
# https://github.com/0rax/narwhal
#

function __narwhal_usage
    printf '# narwhal 1.0.0 (https://github.com/0rax/narwhal)

A simple docker wrapper (docker, docker-machine & docker-compose) for fish-shell.

Usage:
    narwhal COMMAND [OPTIONS]

Commands:
    machine [args...]
        Call docker-machine with args
        Alias for `docker-machine [args...]`
    compose [args..]
        Call docker-compose with args
        Alias for `docker-compose [args...]`
    [clean|cleanup] [images|img|containers|ctn|volumes|vol|all] [-f|--force|-d|--dry]
        Remove dangling images, volumes or exited containers
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
'
end
