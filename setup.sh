#!/bin/bash

echo "Let's install the usual work shell"
chmod +x ./scripts/*.sh
sudo cp -rf ./scripts/* /usr/local/bin/
echo "Finish install ok"
