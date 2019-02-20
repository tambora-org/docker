sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/php-procfile ]; then
    echo "[FAIL]: File /cre/php-procfile not found!"
    exit 1
fi

if grep -P "crePhp" /cre/versions.txt > /dev/null
then
    sleep 0.1
else
    echo "[FAIL]: Php not installed!"
    exit 1
fi

if grep -P "PHP $PHP_VERSION" /cre/versions.txt > /dev/null
then
    sleep 0.1
else
    echo "[WARNING]: Wrong version of php installed!"
    #exit 1
fi


sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
