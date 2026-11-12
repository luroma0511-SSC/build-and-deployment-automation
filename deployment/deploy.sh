#!/bin/bash

set -euo pipefail

echo "Starting deployment..."

mkdir -p deployment-output

echo "Copying application artifact..."

cp build/libs/*.jar deployment-output/application.jar

echo "Executing deployed application..."

java -jar deployment-output/application.jar | tee deployment-output/deployment.log

echo "Verifying deployment..."

grep -q "Deployment Demo" deployment-output/deployment.log
grep -q "Status: Running" deployment-output/deployment.log

echo "Deployment completed successfully!"
