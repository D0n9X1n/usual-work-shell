#!/bin/bash

echo "Let's install the usual work shell"
chmod +x *.sh
sudo cp *.sh /usr/local/bin/
sudo rm /usr/local/bin/setup.sh
echo "Finish install ok"
