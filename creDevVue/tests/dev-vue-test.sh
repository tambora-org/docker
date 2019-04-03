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

sleep 60

echo "$(ls -l /cre/web-components/single)"

if [ ! -f /cre/web-components/single/my-custom-element.min.js ]; then
    echo "[FAIL]: File /cre/web-components/single/my-custom-element.min.js not found!"
    exit 1
fi

if [ ! -f /cre/web-components/single/my-custom-element.js ]; then
    echo "[FAIL]: File /cre/web-components/single/my-custom-element.js not found!"
    exit 1
fi

if [ ! -f /cre/web-components/single/my-custom-element.min.js.map ]; then
    echo "[FAIL]: File /cre/web-components/single/my-custom-element.min.js.map not found!"
    exit 1
fi

if [ ! -f /cre/web-components/single/my-custom-element.js.map ]; then
    echo "[FAIL]: File /cre/web-components/single/my-custom-element.js.map not found!"
    exit 1
fi

echo "$(ls -l /cre/web-components/sync)"
echo "$(ls -l /cre/web-components/async)"

echo "$(ls -l /cre/web-components/sub-components/single)"
echo "$(ls -l /cre/web-components/sub-components/sync)"
echo "$(ls -l /cre/web-components/sub-components/async)"

#echo "$(ls -l /cre/dev/cre-components)"

echo "[SUCCESS]"
exit 0
