# docker
Contains dockerfiles for all kind of containers

## Container
Current (still in development) version is 2011.0 based on Ubuntu 16.04
<version>:=2011.0

### creGlue
Used to communicate information across containers. Especially to compose files using container information via docker-gen.
See [jwilders docker-gen](https://github.com/jwilder/docker-gen) for details. Needs access to docker.sock.

```yaml
  cre-glue:
    image: tamboraorg/creglue:<version>
    container_name: creglue
    volumes:
     - /var/run/docker.sock:/tmp/docker.sock:ro
```


### creProxy


## Environment Variables

