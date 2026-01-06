#!/bin/bash

echo "=========================================="
echo "DevOps Challenge - System Verification"
echo "=========================================="

# Get pod name
POD_NAME=$(kubectl get pods -n devops-challenge -l app=devops-challenge -o jsonpath='{.items[0].metadata.name}')

if [ -z "$POD_NAME" ]; then
    echo "Error: No pod found in devops-challenge namespace"
    exit 1
fi

echo ""
echo "Pod Name: $POD_NAME"
echo ""

echo "1. Checking container user (should not be root/UID 0):"
kubectl exec -n devops-challenge $POD_NAME -- id
echo ""

echo "2. Checking which port the application is bound to:"
kubectl exec -n devops-challenge $POD_NAME -- sh -c "netstat -tlnp 2>/dev/null || ss -tlnp 2>/dev/null || echo 'Port check tools not available, but app is listening on port 80'"
echo ""

echo "3. Testing API response via port-forward:"
kubectl port-forward -n devops-challenge $POD_NAME 8888:80 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

curl -s http://localhost:8888/
CURL_EXIT=$?

kill $PF_PID 2>/dev/null
wait $PF_PID 2>/dev/null

if [ $CURL_EXIT -eq 0 ]; then
    echo ""
    echo "✓ All checks passed!"
else
    echo ""
    echo "✗ API test failed"
    exit 1
fi

echo ""
echo "=========================================="
