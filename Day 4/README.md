# 🚀 System Monitoring Tool (Bash)

A lightweight, production-style system monitoring tool written in Bash that tracks CPU, memory, disk usage, and service health with automated alerts and logging.

---

## 📌 Features

* CPU usage monitoring
* Memory usage tracking
* Disk space monitoring
* Service/process health check
* Configurable thresholds
* Alert system (log)
* Cron-based automation
* Lightweight & portable (works without systemd)

---

## 🛠 Tech Stack

* Bash Scripting
* Linux Utilities: `top`, `awk`, `sed`, `df`, `free`
* Cron Jobs
* Optional: `curl`, `mailutils`

---

## 📂 Project Structure

```
Day 4/
│── monitor.sh
│── utils.sh
│── config.conf
│── logs/
│   └── system.log
│── README.md
```

---

## ⚙️ Setup & Installation

1. Clone the repository:


2. Make scripts executable:

```bash
chmod +x monitor.sh utils.sh
```

Install dependencies:

```bash
sudo apt update
sudo apt install -y bc curl mailutils
```

---

## ▶️ Usage

Run the script manually:

```bash
./monitor.sh
```

Check logs:

```bash
cat logs/system.log
```

---

## ⚙️ Configuration

Edit `config.conf`:

```bash
CPU_THRESHOLD=80
MEM_THRESHOLD=75
DISK_THRESHOLD=85

SERVICE="nginx"   # Change to any process or leave empty

ENABLE_ALERTS=true

```

---

## ⏰ Automation with Cron

Open crontab:

```bash
crontab -e
```

Add the following line:

```bash
*/5 * * * * /home/$USER/system-monitor/monitor.sh >> /home/$USER/cron.log 2>&1
```

Check cron jobs:

```bash
crontab -l
```

---

## 🧪 Testing Alerts

Simulate high CPU usage:

```bash
yes > /dev/null &
```

Stop stress:

```bash
killall yes
```

Lower threshold for testing:

```bash
CPU_THRESHOLD=20
```

---

## 🐞 Debugging

Check script logs:

```bash
cat logs/system.log
```

Check cron output:

```bash
cat ~/cron.log
```

Test cron quickly:

```bash
* * * * * echo "Cron working: $(date)" >> ~/test.log
```

---

## ⚠️ Notes

* Uses `pgrep` instead of `systemctl` for compatibility with environments like Cloud Shell
* Cron jobs may stop when Cloud Shell session ends
* Always use absolute paths in cron jobs

---

## 🚀 Future Improvements

* HTML report generation
* Graph-based visualization
* Docker container monitoring
* Cloud logging integration
* Log rotation
* Sending alerts to email, slack etc.

---

## Author
Harsh Shrimali
