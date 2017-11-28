FROM ubuntu

RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:ethereum/ethereum && \
  apt-get update && \
  apt-get install -y ethereum net-tools vim

COPY src /home
WORKDIR /home

RUN geth --datadir="datadir" init genesis.json
RUN geth --datadir="datadir" --networkid 1511850993 --nodiscover account new --password pwd
CMD geth --datadir="datadir" --networkid 1511850993 --nodiscover --mine --minerthreads=1 --etherbase=0

EXPOSE 30303
EXPOSE 30303/udp