# Taking base image
FROM node:14.17.0

# Initializing the work directory
WORKDIR /usr/src/app

# Copying the files
COPY public/ /usr/src/app/public
COPY src/ /usr/src/app/src
COPY package*.json /usr/src/app/

# Eexcuting the command
RUN npm install

# Tells Docker which network port your container listens on
EXPOSE 3000

# Execute post launching of conatainer
CMD ["npm", "start"]
#CMD ["npm run build"]
