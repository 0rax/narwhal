#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# narwhal by Jean-Philippe Roemer <jp@roemer.im>
# https://github.com/0rax/narwhal
#

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