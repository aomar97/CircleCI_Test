#!/bin/bash

wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz
tar xvfz alertmanager-0.21.0.linux-amd64.tar.gz

sudo cp alertmanager-0.21.0.linux-amd64/alertmanager /usr/local/bin
sudo cp alertmanager-0.21.0.linux-amd64/amtool /usr/local/bin/
sudo mkdir /var/lib/alertmanager

sudo mv alertmanager.yml /etc/prometheus
sudo mv alertmanager.service /etc/systemd/system/
rm -rf alertmanager*
sudo systemctl daemon-reload
sudo systemctl enable alertmanager
sudo systemctl start alertmanager
sudo mv rules.yml /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus