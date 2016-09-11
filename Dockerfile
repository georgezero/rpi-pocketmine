#FROM hypriot/rpi-python
FROM resin/rpi-raspbian
MAINTAINER George Shih <georgezero@trove.nyc>

ENV DEBIAN_FRONTEND noninteractive

# Install CURL
RUN apt-get update
RUN apt-get install -y curl wget libltdl7

# Note the sed hack to enable docker support (get rid of /dev/null)
RUN mkdir /pocketmine
RUN cd /pocketmine && curl -L --insecure https://raw.githubusercontent.com/PocketMine/php-build-scripts/master/installer.sh | sed '20d;21 i alldone=yes' | sed '69,87d;338,371d;88 i alias download_file="curl --insecure --silent --location"' | bash -s - -r -v development

VLUME /pocketmine
WORKDIR /pocketmine

EXPOSE 19132

CMD ["./start.sh", "--no-wizard", "--enable-rcon=on"]
