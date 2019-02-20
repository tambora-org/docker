sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/glue-procfile ]; then
    echo "[FAIL]: File /cre/glue-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "docker-gen")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: docker-gen not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "docker-gen \t $DOCKER_GEN_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of docker-gen installed!"
    #exit 1
fi

# Warn if the DOCKER_HOST socket does not exist
if [[ $DOCKER_HOST = unix://* ]]; then
    socket_file=${DOCKER_HOST#unix://}
    if ! [ -S $socket_file ]; then
        echo "[FAIL]: docker.sock not shared - see http://git.io/vZaG"
        exit 1
    fi
fi

shoreman /cre/glue-procfile &
sleep 1
/cre/gen-template.sh /cre/test.txt.tmpl &

sleep 2

if [ ! -f /cre/test.txt ]; then
    echo "[FAIL]: File /cre/glue/test.txt not found!"
    exit 1
fi

#actualsize=$(wc -c <"/cre/glue/test.txt")
if [ ! $(wc -c <"/cre/test.txt") -ge 200 ]; then
    echo "[FAIL]: File /cre/glue/test.txt is too small!"
    exit 1
fi

echo "[SUCCESS]"
exit 0
