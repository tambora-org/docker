sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/ubuntu-procfile ]; then
    echo "[FAIL]: File /cre/ubuntu-procfile not found!"
    exit 1
fi

if [ ! grep "OpenSSL" /cre/versions.txt > /dev/null ]; then
    echo "[FAIL]: OpenSSL not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "creUbuntu")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: Ubuntu not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "creUbuntu \T $UBUNTU_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of Ubuntu installed!"
    #exit 1
fi

shoreman /cre/ubuntu-procfile &

sleep 2

# No test in the moment

echo "[SUCCESS]"
exit 0
