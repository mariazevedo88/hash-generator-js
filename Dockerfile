FROM node:13.8.0-stretch

RUN mkdir -p /usr/src/app && \
    chown -R node:node /usr/src/app

# This is a preexisting user in the node docker,
# we are reusing it for 
USER node

WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./

# In this step a file is saved on the  /home/node/,npm folder
# This is currently how it is and I can live with that
RUN npm install --no-optional && \
    npm cache clean --force

COPY --chown=node:node . .

EXPOSE 9090

CMD ["npm", "start" ]
