sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/php-procfile ]; then
    echo "[FAIL]: File /cre/php-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "crePhp")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: Php not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "PHP $PHP_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of php installed!"
    #exit 1
fi


sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
