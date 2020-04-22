Borrow the GEMM benchmark from https://github.com/baidu-research/DeepBench

# Compile

$nvcc -o gemm_bench gemm_bench.cu -lcublas -lcurand -std=c++11

Or,
Enable tenor compute if your GPU has tenor core with CUDA version > 10.
$nvcc -o gemm_bench gemm_bench.cu -lcublas -lcurand -std=c++11 -D __CUDACC_VER_MAJOR__=10


# Usage:

The default precision is set based on the architecture and mode.

By default, the program runs the benchmark in training mode.

$./gemm_bench

To run inference mode, use the following command:

$./gemm_bench inference


To change the precision for training/inference, use:

$./gemm_bench train <precision>
$./gemm_bench inference <precision>

To Set GPU id if you have multi-GPU in your compute:
$./gemm_bench train <precision> <GPUid>
$./gemm_bench inference <precision> <GPUid>

Supported precision types:

For Maxwell GPUS: 
float for training and inference

For Pascal GPUS:
float, half for training
float, half, int8 for inference
