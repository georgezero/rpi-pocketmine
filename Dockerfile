FROM resin/rpi-raspbian

MAINTAINER George Zero <georgezero@users.noreply.github.com>

ENV DEBIAN_FRONTEND noninteractive

# Install CURL, wget, vim, and libltdl7
RUN apt-get update && \
apt-get install -y curl wget libltdl7 vim zsh && \
rm -rf /var/lib/apt/lists/*

# Make zsh default
RUN chsh -s /usr/bin/zsh
# use grml zshrc (https://grml.org/zsh/)
RUN wget -O ~/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
RUN wget -O ~/.zshrc.local  http://git.grml.org/f/grml-etc-core/etc/skel/.zshrc

RUN echo "TERM=xterm-256color" >> ~/.zshrc
# Using PocketMine for v0.15.0.0 install script
RUN mkdir /pocketmine
#RUN cd /pocketmine && curl -L --insecure https://raw.githubusercontent.com/PocketMine/php-build-scripts/master/installer.sh | bash -s - -r -v development
RUN cd /pocketmine && wget -q -O - https://raw.githubusercontent.com/pmmp/php-build-scripts/master/installer.sh | bash -s - -r -v development


ADD pocketmine.yml /pocketmine/pocketmine.yml
ADD server.properties /pocketmine/server.properties

VOLUME /pocketmine
WORKDIR /pocketmine

EXPOSE 19132

CMD ["./start.sh", "--enable-rcon=on"]
