#!/bin/bash
echo "=== ROCm GPU Health Check ==="
echo "Date: $(date)"
echo ""

echo "--- ROCm Version ---"
cat /opt/rocm/.info/version 2>/dev/null || echo "ROCm not found in /opt/rocm"
echo ""

echo "--- GPU Info ---"
rocm-smi --showproductname --showmeminfo vram --showtemp --showpower --showuse 2>/dev/null
echo ""

echo "--- ROCm Devices ---"
rocminfo 2>/dev/null | grep -E "Device Type|Marketing Name|Chip" | head -20
echo ""

echo "--- Python/HIP Check ---"
python3 -c "import torch; print(f'PyTorch: {torch.__version__}, GPU: {torch.cuda.is_available()}, Device: {torch.cuda.get_device_name(0) if torch.cuda.is_available() else "N/A"}')" 2>/dev/null || echo "PyTorch not available"
echo ""

echo "=== Health Check Complete ==="
