#!/bin/bash
# Parâmetros: $1=Hostname $2=Estado $3=Mensagem

# Carrega variáveis de ambiente
source /etc/nagios/env.conf

# Gera payload JSON
PAYLOAD=$(jq -n \
  --arg channel "$SLACK_CHANNEL" \
  --arg host "$1" \
  --arg state "$2" \
  --arg msg "$3" \
  '{channel: $channel, attachments: [{color: (if $state == "CRITICAL" then "#FF0000" else "#FFD700" end), fields: [{title: "Host", value: $host, short: true}, {title: "Estado", value: $state, short: true}, {title: "Detalhes", value: $msg}]}]}')

# Envia para o Slack
curl -s -X POST -H "Content-Type: application/json" \
  -d "$PAYLOAD" \
  $SLACK_WEBHOOK_URL > /dev/null

# Registra no syslog
logger "NOC Alert: $1 - $2 - $3"

exit 0