sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/vue-procfile ]; then
    echo "[FAIL]: File /cre/vue-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "npm")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: npm not installed!"
    exit 1
fi

##isInFile=$(cat /cre/versions.txt | grep -cP "PHP $PHP_VERSION")
##if [ $isInFile -eq 0 ]; then
##    echo "[WARNING]: Wrong version of php installed!"
##    #exit 1
##fi

/cre/watch-vue-components.sh &

sleep 120

echo "$(ls -l /cre/web-components/)"

echo "$(ls -l /cre/web-components/sub-components/sync)"

if [ ! -f /cre/web-components/sub-components/sync/sub-components.min.js ]; then
    echo "[FAIL]: File /cre/web-components/sub-components/sync/sub-components.min.js not found!"
    #exit 1
fi

if [ ! -f /cre/web-components/sub-components/sync/sub-components.js ]; then
    echo "[FAIL]: File /cre/web-components/sub-components/sync/sub-components.js not found!"
    #exit 1
fi

echo "$(ls -l /cre/web-components/js-components/sync)"

echo "[SUCCESS]"
exit 0
