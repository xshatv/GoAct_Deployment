#!/bin/sh

# Installing all dependencies
go get ./...

# Run the Go application
DB_HOST=postgresql1.cnlcckmmoogp.ap-south-1.rds.amazonaws.com DB_USER=postgres DB_PASSWORD=admin123 DB_NAME=postgres DB_PORT=5432 go run main.go
# DB_HOST=postgresql1.cnlcckmmoogp.ap-south-1.rds.amazonaws.com DB_USER=postgres DB_PASSWORD=admin123 DB_NAME=postgres DB_PORT=5432 ALLOWED_ORIGINS=http://localhost:3000 go run main.go

# Keep the container running
tail -f /dev/null
