sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

cat /cre/versions.txt

if [ ! -f /cre/jupyter-procfile ]; then
    echo "[FAIL]: File /cre/jupyter-procfile not found!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "creJupyter")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: jupyter not installed!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "creJupyter \t $JUPYTER_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of jupyter installed!"
    #exit 1
fi

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
