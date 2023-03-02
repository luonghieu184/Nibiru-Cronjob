#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/luonghieu184/Nibiru-Cronjob/main/Incentives.sh)

echo -e '\n\e[42mRunning cronj\e[0m\n' && sleep 1

# Faucet NIBIRU token
curl -X POST -d '{"address": "'"$(nibid keys show wallet -a)"'", "coins": ["11000000unibi","100000000unusd","100000000uusdt"]}' https://faucet.itn-1.nibiru.fi/

# Delegates
# $(nibid keys show wallet --bech val -a) 

nibid tx staking delegate $(nibid keys show wallet --bech val -a) 1000000unibi --from wallet --chain-id nibiru-itn-1 --fees 5000unibi --yes

echo -e "- Success Running. HGL welcome! \e[0m"
