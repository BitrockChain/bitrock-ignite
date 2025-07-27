## 🚀 Bitrock Ignite – One-Click Node
Welcome to Bitrock Ignite – the easiest way to ignite your Bitrock node and join the network in just one command.

With this script, anyone can:
- Install all dependencies
- Download and configure Besu automatically
- Connect to the Bitrock Testnet
- Keep the node alive with auto-restart

## 🔥 Quick Start
Run this command to download & start your Bitrock Testnet node:
#### Get all items

```console
  curl -s https://raw.githubusercontent.com/BitrockChain/bitrock-ignite/main/ignite-testnet-bitrock.sh | bash
```
The script will:

- Install Hyperledger Besu 25.4.1
- Fetch the latest Bitrock Testnet genesis
- Start the node & keep it running automatically

## 🚀 Manual Usage
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
Check peers:
```console
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' http://localhost:8545
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
