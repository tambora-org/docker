sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

npm start -no-interactive &
sleep 20

if [ ! -f /cre/dev/cre-app/app.json ]; then
    echo "[FAIL]: File /cre/dev/mobile-app/app.json not found!"
    exit 1
fi

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
