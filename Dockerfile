# Install conference-checkin
#
# VERSION 0.1.0

FROM ubuntu:14.04
MAINTAINER Matt Voss "voss.matthew@gmail.com"
WORKDIR /data/conference-checkin

# Install dependencies for nginx installation
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get clean

RUN apt-get install -y wget curl unzip build-essential checkinstall zlib1g-dev libyaml-dev libssl-dev telnet less \
    libgdbm-dev libreadline-dev libncurses5-dev libffi-dev iputils-ping iputils-tracepath rsyslog supervisor \
    libavahi-compat-libdnssd-dev mysql-client-5.6 \
    python-software-properties sendmail python g++ make software-properties-common rlwrap git-core vim librsvg2-dev && \
    apt-get clean && \
    add-apt-repository -y ppa:rwky/nodejs-legacy && apt-get update && apt-get upgrade -y && apt-get clean && \
    apt-get install -y nodejs

# Clone
RUN git clone --verbose https://github.com/mattvoss/conference-checkin.git /data/conference-checkin && \
    ls -al /data/conference-checkin

# Add custom settings.json
ADD settings.json /data/conference-checkin/config/settings.json
ADD supervisor-conference.conf /etc/supervisor/conf.d/
ADD supervisor-rsyslogd.conf /etc/supervisor/conf.d/

# Install with NPM
RUN cd /data/conference-checkin  && npm install && npm install -g grunt-cli && grunt build

ADD install.sh /data/install.sh
RUN chmod +x /data/install.sh
ADD run.sh /data/run.sh
RUN chmod +x /data/run.sh

# Expose port 3001
EXPOSE 3001

# Run Supervisord
CMD ["/data/run.sh"]
