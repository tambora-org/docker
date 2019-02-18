sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/nginx-procfile ]; then
    echo "[FAIL]: File /cre/postgres-procfile not found!"
    exit 1
fi

if [ ! grep "creNginx" /cre/versions.txt > /dev/null]; then
    echo "[FAIL]: nginx not installed!"
    exit 1
fi

if [ ! grep -P "creNginx \t NGINX_VERSION" /cre/versions.txt > /dev/null]; then
    echo "[WARNING]: Wrong version of nginx installed!"
    #exit 1
fi

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
