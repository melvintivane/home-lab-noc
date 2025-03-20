#!/bin/bash
# Verifica conectividade completa do host

HOST=$1
TIMEOUT=5

check_port() {
  nc -z -w$TIMEOUT $HOST $1 > /dev/null 2>&1
  echo $?
}

PORTS=("80" "22" "443")
STATUS=0

for port in "${PORTS[@]}"; do
  if [ $(check_port $port) -ne 0 ]; then
    echo "CRITICAL - Porta $port fechada no $HOST"
    STATUS=2
  fi
done

if [ $STATUS -eq 0 ]; then
  echo "OK - Todas portas abertas em $HOST"
fi

exit $STATUS