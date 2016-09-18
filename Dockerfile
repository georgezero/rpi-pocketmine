FROM resin/rpi-raspbian

MAINTAINER George Zero <georgezero@users.noreply.github.com>

ENV DEBIAN_FRONTEND noninteractive

# Install CURL, wget, vim, and libltdl7
RUN apt-get update && \
apt-get install -y curl wget libltdl7 vim && \
rm -rf /var/lib/apt/lists/*

# Using PocketMine for v0.15.0.0 install script
RUN mkdir /pocketmine
RUN cd /pocketmine && curl -L --insecure https://raw.githubusercontent.com/PocketMine/php-build-scripts/master/installer.sh | bash -s - -r -v development

ADD pocketmine.yml /pocketmine/pocketmine.yml
ADD server.properties /pocketmine/server.properties

VOLUME /pocketmine
WORKDIR /pocketmine

EXPOSE 19132

CMD ["./start.sh", "--enable-rcon=on"]
