Borrow the GEMM benchmark from https://github.com/baidu-research/DeepBench

# Compile

$nvcc -o gemm_bench gemm_bench.cu -lcublas -lcurand -std=c++11


# Usage:

The default precision is set based on the architecture and mode.

By default, the program runs the benchmark in training mode.

$./gemm_bench

To run inference mode, use the following command:

$./gemm_bench inference


To change the precision for training/inference, use:

$./gemm_bench train <precision>
$./gemm_bench inference <precision>

Supported precision types:

For Maxwell GPUS: 
float for training and inference

For Pascal GPUS:
float, half for training
float, half, int8 for inference
