FROM    ubuntu:18.10
WORKDIR /server
ARG     FILENAME=bedrock-server-1.14.1.4
ENV     LD_LIBRARY_PATH=/server
RUN     apt-get update -y \
          && apt-get upgrade -y \
          && apt-get install -y wget unzip libcurl4 \
          && wget https://minecraft.azureedge.net/bin-linux/${FILENAME}.zip \
          && unzip -d . ${FILENAME}.zip \
          && rm ${FILENAME}.zip
EXPOSE  19132/udp
CMD     [ "./bedrock_server" ]
