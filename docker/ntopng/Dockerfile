FROM ubuntu:18.04

# Stable version:
#RUN apt-get update && \
#    apt-get install software-properties-common wget && \
#    add-apt-repository universe && \
#    wget http://apt-stable.ntop.org/18.04/all/apt-ntop-stable.deb && \
#    apt install ./apt-ntop-stable.deb && \
#    apt-get clean all

# Development build:
RUN apt-get update -y && \
    apt-get install -y software-properties-common wget && \
    add-apt-repository universe && \
    wget http://apt.ntop.org/18.04/all/apt-ntop.deb && \
    apt install ./apt-ntop.deb && \
    apt-get clean all

RUN apt-get update -y && \
    apt-get -y install ntopng

RUN echo '#!/bin/bash\n/etc/init.d/redis-server start\nntopng --community "$@"' > /run.sh && \
    chmod +x /run.sh

EXPOSE 3000

ENTRYPOINT ["/run.sh"]
