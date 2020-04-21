# CMakeLists.txt for cuBLAS example
project(test_cuBLAS)
# required cmake version
cmake_minimum_required(VERSION 2.8)
# packages
find_package(CUDA)

if(${CUDA_FOUND})
	include_directories(${CUDA_INCLUDE_DIRS})
	link_directories($ENV{CUDA_PATH}/lib/x64)
else(${CUDA_FOUND})
	MESSAGE(STATUS "cuda not found!")
endif(${CUDA_FOUND})
# nvcc flags
#set(CUDA_NVCC_FLAGS -gencode arch=compute_20,code=sm_20;-G;-g)
#set(CUDA_NVCC_FLAGS -gencode arch=compute_52,code=sm_52;-G;-g)
# 添加要编译的库
#add_library(gpu SHARED ${CURRENT_HEADERS} ${CURRENT_SOURCES})
set_source_files_properties(cublasSgemm.cu PROPERTIES CUDA_SOURCE_PROPERTY_FORMAT OBJ)
file(GLOB_RECURSE CURRENT_HEADERS  *.h *.hpp *.cuh)
file(GLOB CURRENT_SOURCES  *.cpp *.cu .cc)
source_group("Include" FILES ${CURRENT_HEADERS})
source_group("Source" FILES ${CURRENT_SOURCES})

CUDA_ADD_EXECUTABLE(cublasSgemm ${CURRENT_HEADERS} ${CURRENT_SOURCES})
target_link_libraries(cublasSgemm cublas)