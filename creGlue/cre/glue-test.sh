sleep 5

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi
if [ ! -f /cre/glue/test.txt ]; then
    echo "[FAIL]: File /cre/glue/test.txt not found!"
    exit 1
fi

actualsize=$(wc -c <"/cre/glue/test.txt")
if [ ! $actualsize -ge 200 ]; then
    echo "[FAIL]: File /cre/glue/test.txt is too small!"
    exit 1
fi

if [! grep "docker-gen" /cre/versions.txt > /dev/null]; then
    echo "[FAIL]: docker-gen not installed!"
    exit 1
fi

if [! grep -P "docker-gen \T DOCKER_GEN_VERSION" /cre/versions.txt > /dev/null]; then
    echo "[FAIL]: Wrong version of docker-gen installed!"
    exit 1
fi

echo "[SUCCESS]"
exit 0
