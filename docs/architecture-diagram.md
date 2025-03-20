## Diagrama de Arquitetura

```mermaid
graph TB
    subgraph NOC Lab
        N[Nagios Core] -->|Coleta Métricas| S1[Web Server]
        N -->|Monitoramento| S2[Database Server]
        N -->|Verificação| R1[Router]
        N -->|Executa| A[Scripts de Auto-remediação]
        A -->|Notifica| SL[Slack]
        A -->|Registra| L[Log System]
    end