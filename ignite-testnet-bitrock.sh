#!/bin/bash
set -e

echo "🚀 Installing & Running Bitrock Testnet Node (with Bootnodes)..."

sudo apt update && sudo apt install -y wget openjdk-21-jre-headless

NODE_DIR=$HOME/bitrock-node
mkdir -p $NODE_DIR && cd $NODE_DIR

# === Download Besu ===
if [ ! -d "besu" ]; then
    wget https://github.com/hyperledger/besu/releases/download/25.4.1/besu-25.4.1.tar.gz -O besu.tar.gz
    tar -xzf besu.tar.gz
    mv besu-25.4.1 besu
fi


wget -q https://raw.githubusercontent.com/BitrockChain/genesis/refs/heads/main/bitrock-testnet-prague-genesis.json -O testnet.json

BOOTNODES="enode://baeb2fb9ffc1034374c66d4f2f90f85d65b2b140573228e18b0577ba118d8bd46eddbb154f40dd1cb3b4de431b789cacd6ecc6a8212bfafbd32047ca59345d09@157.230.98.143:30303"

while true; do
    echo "✅ Starting Bitrock Node with Bootnodes..."

    ./besu/bin/besu \
        --genesis-file=testnet.json \
        --data-path=$NODE_DIR/data \
        --bootnodes=$BOOTNODES \
        --sync-mode=FULL \
        --data-storage-format=FOREST \
        --rpc-http-enabled \
        --rpc-ws-enabled \
        --rpc-http-host=0.0.0.0 \
        --rpc-ws-host=0.0.0.0 \
        --host-allowlist="*" \
        --rpc-http-cors-origins="all" \
        --poa-block-txs-selection-max-time=100 \
        --rpc-http-max-active-connections=1000 \
        --rpc-http-api=ETH,NET,WEB3,TXPOOL,TRACE \
        --rpc-ws-api=ETH,NET,WEB3,TXPOOL,TRACE

    echo "❌ Node stopped unexpectedly. Restarting in 5 seconds..."
    sleep 5
done