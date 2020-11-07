# ----- Make Macros -----

CXX = mpiicpc
CXXFLAGS = -std=c++11 -qopenmp -O3 -xCORE-AVX512
#OPTFLAGS += -qopt-zmm-usage=high

LD_FLAGS = -qopenmp


# TARGETS
CPU_TARGET = ../bin/memxct-cpu
CPU_SRC_P = ../src/cpu


# OBJECTS
CPU_OBJS = $(CPU_SRC_P)/main.o $(CPU_SRC_P)/raytrace.o $(CPU_SRC_P)/kernels.o


# TARGETS = memxct

#OBJECTS = $(SRC_PATH)/main.o $(SRC_PATH)/raytrace.o $(SRC_PATH)/kernels.o

# ----- Make Rules -----

cpu:	$(CPU_TARGET)
gpu:	$(GPU_TARGET)

$(CPU_SRC_P)%.o: %.cpp vars.h
	${CXX} ${CXXFLAGS} ${OPTFLAGS} $^ -c -o $@

$(CPU_TARGET): $(CPU_OBJS)
	$(CXX) -o $@ $(CPU_OBJS) $(LD_FLAGS)

clean:
	rm -f $(CPU_SRC_P)/*.o $(CPU_TARGET)
