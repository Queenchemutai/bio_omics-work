#!/bin/bash

echo "running on cloud instance"
echo "hostname: $(hostname)"
echo "cpu info:"
lscpu | head -5

echo "disk usage:"
df -h
