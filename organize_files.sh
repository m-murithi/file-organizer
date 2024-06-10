#!/bin/bash

if ["$#" -lt 1]; then
    echo "Usage: $0 directory_path [another_directory ...]"
    exit 1
fi