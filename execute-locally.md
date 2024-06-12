# Run in local/seperate machines
We have to download the node(14.17.4) and go(1.22.4) package

# Frontend
  ## How to install/download and run:
1. wget https://nodejs.org/dist/v14.17.4/node-v14.17.4-linux-x64.tar.xz
2. tar -xf node-v14.17.4-linux-x64.tar.xz
3. cd to extracted application files till bin folder
4. pwd, and copy the bin path.
5. sudo nano ~/.bashrc
6. go to end of the file
7. export PATH="<BIN-LOCATION-OF-APPLICATION>:$PATH"
8. re-launch the terminal/open new terminal
9. cd to react application files
10. run, npm install
11. run, HOST=0.0.0.0 npm start

# Backend
  ## How to install/download and run:
1. wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
2. tar -xf go1.22.4.linux-amd64.tar.gz
3. cd to extracted application files till bin folder
4. pwd, and copy the bin path.
5. sudo nano ~/.bashrc
6. go to end of the file
7. export PATH="<BIN-LOCATION-OF-APPLICATION>:$PATH"
8. re-launch the terminal/open new terminal
9. cd to go application files
10. run, go get ./...
11. run, DB_HOST=postgresql1.cnlcckmmoogp.ap-south-1.rds.amazonaws.com DB_USER=postgres DB_PASSWORD=admin123 DB_NAME=postgres DB_PORT=5432 go run main.go
