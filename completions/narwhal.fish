#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# fish-completion for narwhal by Jean-Philippe Roemer <roemer.jp@gmail.com>
# https://github.com/0rax/narwhal
#

function __fish_narwhal_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -c narwhal -w docker

complete -c narwhal -n '__fish_use_subcommand' -xa machine  --description "Alias, docker-machine"
complete -c narwhal -n '__fish_use_subcommand' -xa compose  --description "Alias, docker-compose"
complete -c narwhal -n '__fish_use_subcommand' -xa cleanup  --description "Remove dangling images or exited containers"

complete -c narwhal -n '__fish_narwhal_using_command cleanup' -xa images     --description "Remove dangling images"
complete -c narwhal -n '__fish_narwhal_using_command cleanup' -xa img        --description "Remove dangling images"
complete -c narwhal -n '__fish_narwhal_using_command cleanup' -xa containers --description "Remove exited containers"
complete -c narwhal -n '__fish_narwhal_using_command cleanup' -xa ctn        --description "Remove exited containers"
complete -c narwhal -n '__fish_narwhal_using_command cleanup' -s f           --description "Force deletion"

complete -c narwhal -n '__fish_use_subcommand' -xa env      --description "Get environment for a Docker Machine"
complete -c narwhal -n '__fish_use_subcommand' -xa unenv    --description "Erase Docker Machine environment"
complete -c narwhal -n '__fish_use_subcommand' -xa mstart   --description "Alias, docker-machine start"
complete -c narwhal -n '__fish_use_subcommand' -xa mstop    --description "Alias, docker-machine stop"
complete -c narwhal -n '__fish_use_subcommand' -xa mrestart --description "Alias, docker-machine restart"
complete -c narwhal -n '__fish_use_subcommand' -xa status   --description "Alias, docker-machine status"
complete -c narwhal -n '__fish_use_subcommand' -xa ip       --description "Get ip of a Docker Machine"
complete -c narwhal -n '__fish_use_subcommand' -xa help     --description "Print narwhal help"
