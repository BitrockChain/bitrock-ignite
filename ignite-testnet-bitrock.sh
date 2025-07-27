#!/bin/bash
set -e

echo "Installing & Running Bitrock Testnet Node..."

# === Install Dependencies ===
sudo apt update && sudo apt install -y wget unzip openjdk-17-jre-headless

# === Setup Directories ===
mkdir -p $HOME/bitrock-node && cd $HOME/bitrock-node

# === Download Besu ===
if [ ! -d "besu" ]; then
    wget https://hyperledger.jfrog.io/artifactory/besu-binaries/besu-25.4.1.zip -O besu.zip
    unzip -o besu.zip && mv besu-25.4.1 besu
fi

# === Download Bitrock Genesis ===
wget -q https://github.com/BitrockChain/genesis/raw/main/bitrock-mainnet-prague.json -O genesis.json

# === Auto-Restart Loop ===
while true; do
    echo "✅ Starting Bitrock Node..."
    ./besu/bin/besu \
        --config-file=genesis.json \
        --data-path=data \
        --rpc-http-enabled \
        --rpc-ws-enabled \
        --host-allowlist="*" \
        --rpc-http-cors-origins="*"

    echo "❌ Node stopped unexpectedly. Restarting in 5 seconds..."
    sleep 5
done