## Installation

### Requirements

- Android device
- Termux
- Internet connection for the initial installation and AI model download
- At least 2 GB of free storage recommended

### Install EzraOS

Open Termux and run:

```bash
pkg update -y && pkg install -y git && \
git clone https://github.com/JezCruz/EzraOS.git ~/EzraOS && \
cd ~/EzraOS && \
bash install.sh
```

After installation, start EzraOS with:

```bash
ezra
```

> The first AI launch may take longer because the AI model needs to be downloaded. After setup, EzraOS can run offline.
