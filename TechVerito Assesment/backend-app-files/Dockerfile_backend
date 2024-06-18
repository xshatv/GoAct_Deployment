# Specifies a parent image
FROM golang:1.19-alpine

# Creates an app directory to hold your app’s source code
WORKDIR /app

# Copy the startup script
COPY startbackend.sh ./

# Make the script executable
RUN chmod +x /app/startbackend.sh

# Copy all source files to the working directory
COPY go.* ./
COPY *.go ./
COPY service/service.go /usr/local/go/src/employees/service/
COPY routes/routes.go /usr/local/go/src/employees/routes/
COPY repository/repository.go /usr/local/go/src/employees/repository/
COPY model/employee.go /usr/local/go/src/employees/model/
COPY controller/endpoint.go /usr/local/go/src/employees/controller/

# Tells Docker which network port your container listens on
EXPOSE 8080

# Specifies the executable command that runs when the container starts
ENTRYPOINT ["/app/startbackend.sh"]
