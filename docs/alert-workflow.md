## Fluxo de Alerta Automatizado

1. Detecção de Evento
2. Classificação (Warning/Critical)
3. Execução de Script de Auto-remediação
4. Se falhar → Notificação no Slack
5. Se sucesso → Log de Incidente
6. Atualização do Status no Nagios

```mermaid
sequenceDiagram
    Nagios->>Script: Dispara alerta (Host, Estado, Mensagem)
    Script->>Slack: Envia notificação
    Script->>Sistema: Tenta auto-remediação
    alt Sucesso
        Sistema-->>Nagios: Status OK
    else Falha
        Slack-->>Equipe: Alerta Crítico
    end