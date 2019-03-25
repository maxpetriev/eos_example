FROM eosio/eos-dev:v1.5.2
WORKDIR /opt
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
ADD https://github.com/eosio/eosio.cdt/releases/download/v1.5.0/eosio.cdt_1.5.0-1_amd64.deb .
RUN sudo apt install ./eosio.cdt_1.5.0-1_amd64.deb
RUN sudo apt-get install -y python3-setuptools
RUN pip3 install --upgrade setuptools pip
RUN pip3 install termcolor
RUN pip3 install eosfactory-tokenika
#WORKDIR /root/.local/share/eosio/nodeos
#COPY ./data ./data
WORKDIR /tmp/eosfactory/contracts/
RUN timeout 5 python3 -c "from eosfactory.eosf import *; reset()" || true
#WORKDIR /tmp/eosfactory/contracts/

