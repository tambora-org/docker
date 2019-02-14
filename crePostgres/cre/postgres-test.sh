sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/postgres-procfile ]; then
    echo "[FAIL]: File /cre/postgres-procfile not found!"
    exit 1
fi

if [ ! grep "postgres (PostgreSQL)" /cre/versions.txt > /dev/null]; then
    echo "[FAIL]: postgres not installed!"
    exit 1
fi

if [ ! grep -P "postgres (PostgreSQL) POSTGRES_VERSION" /cre/versions.txt > /dev/null]; then
    echo "[WARNING]: Wrong version of postgres installed!"
    #exit 1
fi

if [ ! grep "psql (PostgreSQL)" /cre/versions.txt > /dev/null]; then
    echo "[FAIL]: psql not installed!"
    exit 1
fi

#shoreman /cre/postgres-procfile &

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
