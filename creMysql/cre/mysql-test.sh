sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/mysql-procfile ]; then
    echo "[FAIL]: File /cre/mysql-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "mysql  Ver")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: mysql not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "Distrib 5.7 $MYSQL_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of mysql installed!"
    #exit 1
fi

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
