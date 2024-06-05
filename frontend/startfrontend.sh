#!/bin/sh
# Start the NPM
HOST=0.0.0.0 npm start

# Keep the container running
tail -f /dev/null
