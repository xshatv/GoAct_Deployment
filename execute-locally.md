# Run in local/seperate machines
We have to download the node(14.17.4) and go(1.22.4) package

# Frontend
  ## How to install/download and run:
wget https://nodejs.org/dist/v14.17.4/node-v14.17.4-linux-x64.tar.xz
tar -xf node-v14.17.4-linux-x64.tar.xz
cd to extracted application files till bin folder
pwd, and copy the bin path.
sudo nano ~/.bashrc
go to end of the file
export PATH="<BIN-LOCATION-OF-APPLICATION>:$PATH"
re-launch the terminal/open new terminal
cd to react application files
run, npm install
run, HOST=0.0.0.0 npm start

# Backend
  ## How to install/download and run:
wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
tar -xf go1.22.4.linux-amd64.tar.gz
cd to extracted application files till bin folder
pwd, and copy the bin path.
sudo nano ~/.bashrc
go to end of the file
export PATH="<BIN-LOCATION-OF-APPLICATION>:$PATH"
re-launch the terminal/open new terminal
cd to go application files
run, go get ./...
run, DB_HOST=postgresql1.cnlcckmmoogp.ap-south-1.rds.amazonaws.com DB_USER=postgres DB_PASSWORD=admin123 DB_NAME=postgres DB_PORT=5432 go run main.go
