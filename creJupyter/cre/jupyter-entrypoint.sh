#!/bin/bash
set -e

echo "Jupyter entrypoint"

JUPYTER_ADMIN='admin'
if ( id ${JUPYTER_ADMIN} ); then
  echo "User ${JUPYTER_ADMIN} already exists"
else
  echo "Creating user ${JUPYTER_ADMIN}"
  ENC_PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${JUPYTER_PASSWORD})
  useradd -d /cre/workspace/jupyter/${JUPYTER_ADMIN} -m -p ${ENC_PASS} -s /bin/sh ${JUPYTER_ADMIN}
fi

exec "$@"
