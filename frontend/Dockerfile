# Taking base image
FROM node:14-alpine

# Initializing the work directory
WORKDIR /usr/src/app

# Copying the files
COPY public/ public/
COPY src/ src/
COPY ./package*.json ./

# Installing dependencies
RUN npm install

# Tells Docker which network port your container listens on
EXPOSE 3000

# Execute post launching of container
#CMD ["npm", "start", "--loglevel", "verbose"]
ENTRYPOINT ["npm", "start"]
