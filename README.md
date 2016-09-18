# rpi-pocketmine

## Thanks to robsharp/rpi-pocketmine (github.com/qnm/rpi-pocketmine)

- Using resin/rpi-raspbian
- Updated the install script to the latest

Overview
========

Docker image for Pocketmine on a Raspberry Pi

Pull
=======
```docker pull georgezero/rpi-pocketmine```

Building
========

```docker build -t <username>/rpi-pocketmine .```

Running
=======
* The image exposes port 19132

Example: run command
```
docker run -d --name pocketmine -p 19132:19132/udp georgezero/rpi-pocketmine
```

### Make edits to pocketmine.yml or server.properties first:

```
docker run --name pocketmine -p 19132:19132/udp -it --entrypoint=/bin/bash georgezero/rpi-pocketmine
```
and then:

```
vi pocketmine.yml server.properties
```

before starting:

```
./start.sh
```

Source
======

https://github.com/georgezero/rpi-pocketmine
