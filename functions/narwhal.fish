#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# narwhal by Jean-Philippe Roemer <jp@roemer.im>
# https://github.com/0rax/narwhal
#

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
      case cleanup clean
        __narwhal_cleanup $args
      case env unenv mstart mstop mrestart status ip
        __narwhal_machine $argv
      case 'help' ''
        __narwhal_usage
      case '*'
        command docker $argv
    end

end
