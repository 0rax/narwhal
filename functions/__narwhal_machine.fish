#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# narwhal by Jean-Philippe Roemer <jp@roemer.im>
# https://github.com/0rax/narwhal
#

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
