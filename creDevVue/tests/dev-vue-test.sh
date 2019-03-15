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

/cre/watch-vue-components.sh

sleep 20

if [ ! -f /cre/web-component/my-custom-element.min.js ]; then
    echo "[FAIL]: File /cre/web-component/my-custom-element.min.js not found!"
    exit 1
fi

if [ ! -f /cre/web-component/my-custom-element.js ]; then
    echo "[FAIL]: File /cre/web-component/my-custom-element.js not found!"
    exit 1
fi

if [ ! -f /cre/web-component/my-custom-element.min.js.map ]; then
    echo "[FAIL]: File /cre/web-component/my-custom-element.min.js.map not found!"
    exit 1
fi

if [ ! -f /cre/web-component/my-custom-element.js.map ]; then
    echo "[FAIL]: File /cre/web-component/my-custom-element.js.map not found!"
    exit 1
fi

echo "[SUCCESS]"
exit 0
