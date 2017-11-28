#!/bin/sh
ENODE_LINE=$(docker logs bootnode 2>&1 | grep enode | head -n 1)
echo "enode:${ENODE_LINE#*enode:}"