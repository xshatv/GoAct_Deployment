#!/bin/sh

# Installing dependencies
RUN npm install

# Starting the NPM binding network and localhost IP
HOST=0.0.0.0 npm start

# Keep the container running
tail -f /dev/null
