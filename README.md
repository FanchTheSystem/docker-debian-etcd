Docker Image From Debian with etcd
==================================

Download etcd from source and run it in debian

## Build (optional as it is on dockerhub):

```bash
docker build --build-arg ETCDVER=3.3.1 -t fanchthesystem/debian-etcd:3.3.1 -f Dockerfile .
```

## Start:

```bash
docker run -dt -dt -p 2379:2379 --name etcd.host fanchthesystem/debian-with-etcd:latest
```

## Use:

```bash
docker exec etcd.host etcd --version
```

### Add Variable:

```bash
docker exec etcd.host etcdctl put /pre/fix/name foo
docker exec etcd.host etcdctl put /pre/fix/id 42
```

### Get Variable:

```bash
docker exec etcd.host etcdctl get /pre/fix/name --print-value-only
```

or

```bash
docker exec etcd.host etcdctl get --prefix /pre/fix
```


## Note
Data are not persistent on restart,it is not tested,maybe you should try to start with -v ./etcd-data:/var/lib/etcd
