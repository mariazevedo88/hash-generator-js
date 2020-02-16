FROM node

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
# java dependencies
# needed for selenium running
  java-common \
  default-jre \
  default-jdk \
# google-chrome-stable dependencies
  apt-utils \
  fonts-liberation \
  libappindicator3-1 \
  libxss1 \
  xdg-utils \
# \(>= 1.0.2)

  && rm -rf /var/lib/apt/lists/*

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb

RUN mkdir -p /usr/src/app && \
    chown -R node:node /usr/src/app

# This is a preexisting user in the node docker,
# we are reusing it for 
USER node

WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./

# In this step a file is saved on the  /home/node/.npm folder
# This is currently how it is and I can live with that
RUN npm install --no-optional && \
    npm cache clean --force
ENV PATH="/usr/src/app/node_modules/chromedriver/lib/chromedriver:${PATH}"

COPY --chown=node:node . .

EXPOSE 9090
EXPOSE 9091
EXPOSE 4444

CMD ["npm", "start" ]
