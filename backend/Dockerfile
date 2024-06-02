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

# Builds your app with optional configuration
# RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
# RUN go get ./...
# RUN DB_HOST=<POSTGRES_HOST> DB_USER=<POSTGRES_USER> DB_PASSWORD=<POSTGRES_PASSWORD> DB_NAME=<POSTGRES_DB_NAME> DB_PORT=<POSTGRES_PORT> ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE> go run main.go

# Tells Docker which network port your container listens on
EXPOSE 8080
 
# Specifies the executable command that runs when the container starts
CMD ["/docker-gs-ping"]
CMD [ “DB_HOST=<POSTGRES_HOST> DB_USER=<POSTGRES_USER> DB_PASSWORD=<POSTGRES_PASSWORD> DB_NAME=<POSTGRES_DB_NAME> DB_PORT=<POSTGRES_PORT> ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE> go run main.go” ]
