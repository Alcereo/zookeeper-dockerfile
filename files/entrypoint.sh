#!/bin/sh

echo "=== Entrypoint for Zookeeper ==="

SCRIPT="${ZK_DIR}/bin/zkServer.sh"

exec $SCRIPT start-foreground