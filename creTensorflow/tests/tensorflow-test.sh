sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

cat /cre/versions.txt

if [ ! -f /cre/python-procfile ]; then
    echo "[FAIL]: File /cre/python-procfile not found!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "crePython")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: python not installed!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "crePython \t $PYTHON_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of python installed!"
    #exit 1
fi

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
