#!/bin/sh
NETWORK_ID=1511850993
geth --datadir=datadir --networkid $NETWORK_ID --nodiscover account new --password pwd
geth --datadir=datadir --networkid $NETWORK_ID --exec 'admin.nodeInfo.enode' console > enode
sed -i -- 's/\[::\]/127.0.0.1/g' enode
sed -i -- 's/"//g' enode

ENODE=$(cat enode)
# geth --datadir=datadir --networkid $NETWORK_ID --bootnodes $ENODE console"
geth --datadir=datadir --networkid $NETWORK_ID --bootnodes $ENODE --mine --minerthreads=1 --etherbase=0