# ----- Make Macros -----

CXX = mpiicpc
CXXFLAGS = -std=c++11 -qopenmp -O3 -axCORE-AVX512,AVX2

# Vectorization flags
CXXFLAGS += -qopt-report=2 -qopt-report-phase=vec

NVCC = nvcc
NVCCFLAGS = -lineinfo -O3 -std=c++11 -ccbin=$(CXX) -gencode arch=compute_60,code=sm_60 -Xcompiler -qopenmp -Xptxas="-v"

LD_FLAGS = -qopenmp
GPU_LD_FLAGS = -qopenmp -L/usr/local/cuda-11.1/lib64 -lcudart

# TARGETS
CPU_TARGET = ../bin/memxct-cpu
CPU_SRC_P = ../src/cpu

GPU_TARGET = ../bin/memxct-gpu
GPU_SRC_P = ../src/gpu

# OBJECTS
CPU_OBJS = $(CPU_SRC_P)/main.o $(CPU_SRC_P)/raytrace.o $(CPU_SRC_P)/kernels.o
GPU_OBJS = $(GPU_SRC_P)/main.o $(GPU_SRC_P)/raytrace.o $(GPU_SRC_P)/kernels.o

# ----- Make Rules -----

cpu:	$(CPU_TARGET)
gpu:	$(GPU_TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $^ -c -o $@

%.o: %.cu
	$(NVCC) $(NVCCFLAGS) $^ -c -o $@

# Link to complete cpu code
$(CPU_TARGET): $(CPU_OBJS)
	$(CXX) -o $@ $(CPU_OBJS) $(LD_FLAGS)

$(GPU_TARGET): $(GPU_OBJS)
	$(CXX) -o $@ $(GPU_OBJS) $(GPU_LD_FLAGS)

clean:
	rm -f $(CPU_SRC_P)/*.o $(CPU_TARGET)
	rm -f $(GPU_SRC_P)/*.o $(GPU_TARGET)

versions:
	$(CXX) --version
	$(NVCC) --version
