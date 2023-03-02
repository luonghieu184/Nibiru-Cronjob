echo -e '\n\e[42mRunning cronj\e[0m\n' && sleep 1

# Faucet NIBIRU token
FAUCET_URL="https://faucet.itn-1.nibiru.fi/"
DWALLET = $(nibid keys show wallet -a)
curl -X POST -d '{"address": "'"$DWALLET"'", "coins": ["11000000unibi","100000000unusd","100000000uusdt"]}' https://faucet.itn-1.nibiru.fi/

# Delegates
# $(nibid keys show wallet --bech val -a) 
#DVALIDATOR = Another validator address

DVALIDATOR = $(nibid keys show wallet --bech val -a) 
nibid tx staking delegate $DVALIDATOR 1000000unibi --from wallet --chain-id nibiru-itn-1 --fees 5000unibi --yes

echo -e "- Success Running. HGL welcome! \e[0m"
