#!/bin/bash
# Profile a HIP application with rocprof
if [ -z "$1" ]; then
    echo "Usage: $0 <hip_application>"
    exit 1
fi

APP=$1
OUTPUT_DIR="profile_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

echo "Profiling: $APP"
echo "Output: $OUTPUT_DIR"

rocprof --stats --hsa-trace --output-file "$OUTPUT_DIR/trace.csv" -- "$APP"

echo "Profile saved to $OUTPUT_DIR/"
echo "Files:"
ls -la "$OUTPUT_DIR/"
