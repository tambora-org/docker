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
    exit 1
fi

if [ ! -f /cre/web-components/sub-components/sync/sub-components.js ]; then
    echo "[FAIL]: File /cre/web-components/sub-components/sync/sub-components.js not found!"
    exit 1
fi

echo "$(ls -l /cre/web-components/js-component/sync)"

echo "$(ls -l /cre/npm-components/)"
echo "$(ls -l /cre/npm-components/sub-components)"

if [ ! -f /cre/npm-components/sub-components/package.json ]; then
    echo "[FAIL]: File /cre/npm-components/sub-components/package.json not found!"
    exit 1
fi

echo "$(ls -l /cre/npm-components/js-component)"

if [ ! -f /cre/npm-components/js-component/package.json ]; then
    echo "[FAIL]: File /cre/npm-components/js-component/package.json not found!"
    exit 0
fi

scName="$(grep name /cre/npm-components/sub-components/package.json | grep sub-components)"
if [ ! $scName eq '  "name": "sub-components",'  ]; then
    echo "[FAIL]: sub-components not found in package.json!"
    exit 0
fi

echo "[SUCCESS]"
exit 0
