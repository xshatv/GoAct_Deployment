# Specifies a parent image
FROM golang:1.19-alpine

# Creates an app directory to hold your app’s source code
WORKDIR /app

# Copies go.mod and go.sum for dependency resolution
COPY go.mod go.sum ./

# Copy the startup script
COPY startbackend.sh /app/startbackend.sh

# Make the script executable
RUN chmod +x /app/startbackend.sh

# Installs Go dependencies
RUN go mod download

# Copy all source files to the working directory
COPY *.go ./
COPY service/service.go /usr/local/go/src/employees/service/
COPY routes/routes.go /usr/local/go/src/employees/routes/
COPY repository/repository.go /usr/local/go/src/employees/repository/
COPY model/employee.go /usr/local/go/src/employees/model/
COPY controller/endpoint.go /usr/local/go/src/employees/controller/

# Tells Docker which network port your container listens on
EXPOSE 8080

# Specifies the environment variables
ENV DB_HOST=postgresql1.cnlcckmmoogp.ap-south-1.rds.amazonaws.com
ENV DB_USER=postgres
ENV DB_PASSWORD=admin123
ENV DB_NAME=postgres
ENV DB_PORT=5432
ENV ALLOWED_ORIGINS=http://localhost:8080

# Specifies the executable command that runs when the container starts
ENTRYPOINT ["/app/startbackend.sh"]
