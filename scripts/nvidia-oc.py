from pynvml import *
nvmlInit()

# This sets the GPU to adjust - if this gives you errors or you have multiple GPUs, set to 1 or try other values.
myGPU = nvmlDeviceGetHandleByIndex(0)

# Set Min and Max core clocks
nvmlDeviceSetGpuLockedClocks(myGPU, 210, 2400)

# Clock offset (0 by default)
nvmlDeviceSetGpcClkVfOffset(myGPU, 290)

# Memory Clock offset (0 by default)
# nvmlDeviceSetMemClkVfOffset(myGPU, MEMOVERCLOCK)
