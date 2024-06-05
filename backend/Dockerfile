# Specifies a parent image
FROM golang:1.19

# Creates an app directory to hold your app’s source code
WORKDIR /app
 
# Copies everything from your root directory into /app
COPY go.mod go.sum ./

# Installs Go dependencies
RUN go mod download

# Copying all files with .go extension
COPY *.go ./
COPY service/service.go /usr/local/go/src/employees/service/
COPY routes/routes.go /usr/local/go/src/employees/routes/
COPY repository/repository.go /usr/local/go/src/employees/repository/
COPY model/employee.go /usr/local/go/src/employees/model/
COPY controller/endpoint.go /usr/local/go/src/employees/controller/

# Tells Docker which network port your container listens on
EXPOSE 8080
 
# Specifies the executable command that runs when the container starts
# CMD ["/docker-gs-ping"]
ENTRYPOINT [ “DB_HOST=postgresql1.cnlcckmmoogp.ap-south-1.rds.amazonaws.com DB_USER=postgres DB_PASSWORD=admin123 DB_NAME=postgres DB_PORT=5432 ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE> go run main.go” ]
