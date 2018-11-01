# 
FROM node:10-slim

# Install locales and curl
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y curl jq && \
  rm -rf /var/lib/apt/lists/*

USER node
ENV HOME /home/node
WORKDIR $HOME
ENV HOST "canvas.instructure.com"

# Doesn't install cleanly as root
ENV NPM_PACKAGES $HOME/npm-packages
RUN mkdir -p $NPM_PACKAGES
RUN echo "prefix = $NPM_PACKAGES" >> $HOME/.npmrc
ENV PATH "${NPM_PACKAGES}/bin:${PATH}"

# Install the api-spec-converter
RUN npm install -g api-spec-converter

RUN mkdir $HOME/bin
ENV PATH "${HOME}/bin:${PATH}"
COPY convert.sh $HOME/bin
