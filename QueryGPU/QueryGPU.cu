/*
 * Author: Ye HE
 * Data: 4/18/2020
 * 
 * Description: Query information of the GPU
 * 
 */

 #include <stdio.h>
 #include <stdlib.h>
 #include <stdint.h>
 #include <string.h>
 #include <iostream>
 #include <ctype.h>

 #include "cuda_runtime.h"
 #include "device_launch_parameters.h"
 #include "cuda.h"

#ifndef ul
#define ul unsigned long
#endif

#ifndef ui
#define ui unsigned int
#endif

void chkCUDAErr(cudaError_t ErrorID)
{
    if (ErrorID != CUDA_SUCCESS) {
        printf("CUDA ERROR :::%s\n", cudaGetErrorString(ErrorID));
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char **argv)
{
    cudaError_t cudaStatus;
    cudaDeviceProp GPUprop;
    ul SupportedKBlocks, SupportedMBlocks, MaxThrPerBlk;
    char SupportedBlocks[100];

    ui GPUid = 0;
    char ProgName[255]; 

    int NumGPUs = 0;
    cudaGetDeviceCount(&NumGPUs);
    if (NumGPUs == 0) {
        printf("\n No CUDA Device is available\n");
        exit(EXIT_FAILURE);
    }

    strcpy(ProgName, "QueryGPU");
    switch (argc) {
        case 2: 
            GPUid = atoi(argv[1]);
            break;
        default:
            printf("\n\nUsage: %s [GPU ID]", ProgName);
            printf("\n\nExample: %s 0", ProgName);
            printf("\n\n");
            exit(EXIT_FAILURE);
    }

    printf("Query the info of the GPU #%d\n", GPUid);    
    cudaStatus = cudaSetDevice(GPUid);
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "cudaSetDevice failed! no ==No CUDA-capable GPU installed?");
        exit(EXIT_FAILURE);
    }

    cudaGetDeviceProperties(&GPUprop, GPUid);
	SupportedKBlocks = (ui)GPUprop.maxGridSize[0] * (ui)GPUprop.maxGridSize[1] * (ui)GPUprop.maxGridSize[2] / 1024;
	SupportedMBlocks = SupportedKBlocks / 1024;
	sprintf(SupportedBlocks, "%lu %c", (SupportedMBlocks >= 5) ? SupportedMBlocks : SupportedKBlocks, (SupportedMBlocks >= 5) ? 'M' : 'K');
    MaxThrPerBlk = (ul)GPUprop.maxThreadsPerBlock;

    printf("GPU Name: %s\n", GPUprop.name);
    printf("SupportedBlocks: %s, MaxThrPerBlk: %lu\n", SupportedBlocks, MaxThrPerBlk);
    for (int i = 0; i < 3; i++) {
        printf("maxGridSize[%d]=%d  ", i, GPUprop.maxGridSize[i]);
    }
    printf("\n");
    printf("SharedMemPerBlock:%ld Bytes, SharedMemPerMultiprocessor: %ld Bytes\n", GPUprop.sharedMemPerBlock, GPUprop.sharedMemPerMultiprocessor);
    printf("Total Global Memory: %ld MiB\n", GPUprop.totalGlobalMem/1024/1024);
    printf("Unified Addressing: %d\n", GPUprop.unifiedAddressing);

    printf("WarpSize:%d\n", GPUprop.warpSize);

    return 0;
}

