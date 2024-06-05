#!/bin/sh
# Run the Go application
go run main.go

# Keep the container running
tail -f /dev/null
