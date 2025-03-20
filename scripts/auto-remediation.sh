#!/bin/bash
# Tenta recuperação automática baseada no tipo de alerta

case $2 in
  "CRITICAL")
    case $3 in
      *"HTTP"*)
        systemctl restart apache2
        ;;
      *"SSH"*)
        systemctl restart sshd
        ;;
      *"DISK"*)
        find /var/log -type f -name "*.log" -delete
        ;;
    esac
    ;;
esac

# Verifica se a acção resolveu o problema
sleep 10
/usr/lib/nagios/plugins/check_nrpe -H $1 -c $4 > /dev/null
exit $?