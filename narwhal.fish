#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# narwhal by Jean-Philippe Roemer <jp@roemer.im>
# https://github.com/0rax/narwhal
#

function __narwhal_usage
    printf 'Usage: narwhal COMMAND [OPTIONS]

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
'
end

function __narwhal_cleanup --argument-names cmd opt

    set -l force
    set -l dry   false
    switch "$opt"
      case -f --force
        set force $opt
      case -d --dry
        set dry   true
    end

    switch "$cmd"
      case images img
        set -l images (docker images -q -f dangling=true)
        if [ (count $images) -eq 0 ]
            echo "# $_ cleanup $cmd: no dangling image found"
        else if [ "$dry" = "true" ]
            echo "# $_ cleanup $cmd (dry mode)" 1>&2
            for i in $images
               printf "%s ($i)\n" (docker inspect -f '{{ .Id }}' $i)
	    end
        else
            echo "# $_ cleanup $cmd (cleanup mode)" 1>&2
            docker rmi $force $images
        end
      case containers ctn
        set -l containers (docker ps -aq -f status=exited)
        if [ (count $containers) -eq 0 ]
            echo "# $_ cleanup $cmd: no exited container found"
        else if [ "$dry" = "true" ]
            echo "# $_ cleanup $cmd (dry mode)" 1>&2
            for c in $containers
                printf "$c (%s)\n" (docker inspect -f '{{ .Name }}' $c | cut -d'/' -f2-)
	    end
        else
            echo "# $_ cleanup $cmd (cleanup mode)" 1>&2
            docker rm $force $containers
        end
      case '*'
        echo "$_ cleanup [images|img] [-f]" 2>&1
        echo "$_ cleanup [containers|ctn] [-f]" 2>&1
        return 1
    end

end

function __narwhal_machine --argument-names sub machine

    if [ "$machine" = "" ]
        set machine default
    end

    switch "$sub"
      case env
        docker-machine env --shell fish $machine
      case unenv
        docker-machine env --shell fish -u
      case ip
        docker-machine inspect -f "{{ .Driver.IPAddress }}" $machine
      case mstart
        docker-machine start $machine
      case mstop
        docker-machine stop $machine
      case mrestart
        docker-machine restart $machine
      case status
        docker-machine status $machine
    end

end

function narwhal --argument-names sub --description "A simple docker wrapper for fish-shell"

    set -l help
    set -l args

    if [ (count $argv) -ge 2 ]
        set args $argv[2..-1]
    end

    switch "$sub"
      case machine
        docker-machine $args
      case compose
        docker-compose $args
      case cleanup
        __narwhal_cleanup $args
      case env unenv mstart mstop mrestart status ip
        __narwhal_machine $argv
      case 'help' ''
        __narwhal_usage
      case '*'
        command docker $argv
    end

end
