sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/proxy-procfile ]; then
    echo "[FAIL]: File /cre/proxy-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "creNginx")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: nginx not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "creNginx \t $NGINX_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of nginx installed!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "OpenSSL")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: OpenSSL not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "OpenSSL $OPENSSL_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of OpenSSL installed!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "certbot")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: certbot not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "certbot $CERTBOT_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of certbot installed!"
    #exit 1
fi

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
