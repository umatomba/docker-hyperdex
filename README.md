# docker-hyperdex

### To start coordinator on host 192.168.100.1:
        docker run --net=host --name=coordinator1 -ti umatomba/docker-hyperdex:1.6 hyperdex coordinator --foreground --listen=192.168.100.1 --data=/hyperdex/coord

### To start daemon on host 192.168.100.1:
        docker run --net=host --name=daemon1 -ti umatomba/docker-hyperdex:1.6 hyperdex daemon --foreground --listen=192.168.100.1 --coordinator=192.168.100.1 --data=/hyperdex/daemon

### To scale up the HyperDex f.e. to a 3 node cluster (192.1 .. 3):
        docker run --net=host --name=coordinator2 -ti umatomba/docker-hyperdex:1.6 hyperdex coordinator --foreground --listen=192.168.100.2 --connect-string=192.168.100.1:1982,192.168.100.2:1982,192.168.100.3:1982 --data=/hyperdex/coord
        docker run --net=host --name=coordinator3 -ti umatomba/docker-hyperdex:1.6 hyperdex coordinator --foreground --listen=192.168.100.3 --connect-string=192.168.100.1:1982,192.168.100.2:1982,192.168.100.3:1982 --data=/hyperdex/coord

        docker run --net=host --name=daemon2 -ti umatomba/docker-hyperdex:1.6 hyperdex daemon --foreground --listen=192.168.100.2 --coordinator=192.168.100.2 --data=/hyperdex/daemon
        docker run --net=host --name=daemon3 -ti umatomba/docker-hyperdex:1.6 hyperdex daemon --foreground --listen=192.168.100.3 --coordinator=192.168.100.3 --data=/hyperdex/daemon
      
      
### Note: Or just use my vagrant hyperdex setup:
                https://github.com/umatomba/vagrant-docker-hyperdex
