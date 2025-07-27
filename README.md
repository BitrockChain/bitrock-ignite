## 🚀 Bitrock Ignite – One-Click Node
Welcome to Bitrock Ignite – the easiest way to ignite your Bitrock node and join the network in just one command.

With this script, anyone can:
- Install all dependencies
- Download and configure Besu automatically
- Connect to the Bitrock Testnet

## 🔥 Quick Start

- Clone the repo:
```console
git clone https://github.com/BitrockChain/bitrock-ignite.git
cd bitrock-ignite
```
- Make the script executable:
```console
chmod +x ignite-testnet-bitrock.sh
```
Run it:
```console
./ignite-testnet-bitrock.sh
```

## ✅ Verify Your Node
```console
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":53}' http://127.0.0.1:8545
```

## ⚡ Run in Background
```console
nohup ./ignite-testnet-bitrock.sh > bitrock.log 2>&1 &
```
Logs:
```console
tail -f bitrock.log
```

🔥 Ignite. Sync. Rock. 🪨🚀
