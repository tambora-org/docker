sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/postgres-procfile ]; then
    echo "[FAIL]: File /cre/postgres-procfile not found!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "postgres (PostgreSQL)")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: postgres not installed!"
    exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -cP "postgres (PostgreSQL) $POSTGRES_VERSION")
if [ $isInFile -eq 0 ]; then
    echo "[WARNING]: Wrong version of postgres installed!"
    #exit 1
fi

isInFile=$(cat /cre/versions.txt | grep -c "psql (PostgreSQL)")
if [ $isInFile -eq 0 ]; then
    echo "[FAIL]: psql not installed!"
    exit 1
fi

#shoreman /cre/postgres-procfile &

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
