sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

cat /cre/versions.txt

if [ ! -f /cre/anaconda-procfile ]; then
    echo "[FAIL]: File /cre/anaconda-procfile not found!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "creAnaconda")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: Anaconda not installed!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "creAnaconda \t $ANACONDA_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of anaconda installed!"
    #exit 1
fi

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
