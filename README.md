Bootnode and miner
==================

## Running "server" (bootnode)

### Build and run

```
docker build -t bootnode .
docker run -d -p 30303:30303 -p 30303:30303/udp --name bootnode bootnode
```

This will run container `bootnode` and expose port `30303`. Make port `30303` available from Internet.

Note: Container will create account and start mining immediately.

### Entering geth JS console

Execute `geth attach` in interactive mode:

```
docker exec -it bootnode geth attach ipc:/home/datadir/geth.ipc
```

Usefull commands:

* list accounts `eth.accounts`
* check the balance `eth.getBalance(eth.accounts[0])`

To unlock wallet use password from `src/pwd`

### Getting bootnode address

* execute `get_node.sh`
* replace `[::]` with server's public ip address
* remove `?discport=0`

As a result you will get something similar to `enode://b4237b154a99cc729f4731348de518410c83d0b798fa153308140e4b9a5098a5a9f116115d3fd8245038bab9f08dfd804f60724ad39af080eda9a2d4674dce6d@172.17.0.2:30303`

### Backup/moving the container

See docker [export](https://docs.docker.com/engine/reference/commandline/export/) and [import](https://docs.docker.com/engine/reference/commandline/import/) for more info.

## Running client (connecting to the private blockchain)

At the very first time initialize geth data directory by `geth --datadir="datadir" init genesis.json`

Then run geth console with initialized datadir, network id and bootnode

```
geth --datadir="datadir" --networkid 1511850993 --bootnodes enode://b4237b154a99cc729f4731348de518410c83d0b798fa153308140e4b9a5098a5a9f116115d3fd8245038bab9f08dfd804f60724ad39af080eda9a2d4674dce6d@172.17.0.2:30303 console
```

Replace `enode://...` with correct enode address
