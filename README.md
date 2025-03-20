# Home Lab NOC System

![Dashboard Preview](docs/dashboard-screenshot.png)

## 📊 Monitored Metrics

- Host Availability
- CPU/Memory Usage
- Disk Space
- Service Status (HTTP, SSH, MySQL)
- Network Latency

## 🚀 Getting Started

1. Clone the repository
```bash
git clone https://github.com/melvintivane/home-lab-noc.git
cd home-lab-noc
```

2. Configure environment variables
```bash
cp .env.example .env
nano .env  # Preencha os valores
```

3. Start containers
```bash
docker-compose up -d
```

4. Access o Nagios
```bash
http://localhost:8080/nagios
Username: admin
Password: admin
```

## 🛠️ Customization
Add new hosts in
```bash
nano nagios-config/hosts.cfg
```

Create new service checks
```bash
nano nagios-config/services.cfg
```

## To Use the System
1. Create .env file from example
```bash
# .env.example
SLACK_WEBHOOK=https://hooks.slack.com/services/...
SLACK_CHANNEL=#alerts
DB_PASS=SecurePassword123
```

2. Run the complete stack
```bash
docker-compose up -d
```

