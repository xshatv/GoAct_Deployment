#!/bin/sh
# Function to handle termination of background processes
terminate() {
    echo "Terminating port-forward processes..."
    kill $(pgrep -f "kubectl port-forward")
    # kill $(jobs -p)
}

# Trap SIGINT and SIGTERM to ensure proper cleanup
trap terminate SIGINT SIGTERM

# Port-forward commands
kubectl port-forward --address 0.0.0.0 service/frontend-service 3000:3000> port-forward-frontend.log 2>&1 &
echo "Started port-forward for frontend-service:3000 -> 3000"

kubectl port-forward --address 0.0.0.0 service/backend-service 8080:8080 > port-forward-backend.log 2>&1 &
echo "Started port-forward for backend-service:8080 -> 8080"

# Wait for all background jobs to complete
wait
