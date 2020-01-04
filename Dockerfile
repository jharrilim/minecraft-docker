FROM    ubuntu:18.10
WORKDIR /server
ARG     FILENAME=bedrock-server-1.14.1.4
ENV     LD_LIBRARY_PATH=/server
RUN     useradd -ms /bin/bash mcservice
RUN     apt-get update -y \
          && apt-get upgrade -y \
          && apt-get install -y wget unzip libcurl4 \
          && wget https://minecraft.azureedge.net/bin-linux/${FILENAME}.zip \
          && unzip -d . ${FILENAME}.zip \
          && rm ${FILENAME}.zip \
          && chown mcservice -R * \
          && chmod 700 bedrock_server
USER    mcservice

CMD     [ "./bedrock_server" ]
