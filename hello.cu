#include <stdio.h>

void helloFromCPU()
{
    printf("Hello World from CPU!\n");
}

__global__ void helloFromGPU()
{
    printf("Hello World from GPU!\n");
}

int main(void)
{
    helloFromCPU();
    helloFromGPU <<<1, 1>>>();
    cudaDeviceSynchronize();
    return 0;
}