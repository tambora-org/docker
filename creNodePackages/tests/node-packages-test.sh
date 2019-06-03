sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

##if [ ! -f /cre/node-procfile ]; then
##    echo "[FAIL]: File /cre/node-procfile not found!"
##    exit 1
##fi

isInFile=$(cat /cre/versions.txt | grep -c "npm")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: npm not installed!"
    exit 1
fi

echo "[SUCCESS]"
exit 0
