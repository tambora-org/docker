#!/bin/bash 

## Removes all untagged images
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
