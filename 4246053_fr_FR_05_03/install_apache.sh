#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo cp /tmp/index.html /var/www/html/index.html
sudo cp /tmp/index2.html /var/www/html/index2.html
