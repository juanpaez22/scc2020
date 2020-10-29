# ----- Make Macros -----

CXX = mpicxx
CXXFLAGS = -std=c++11 -qopenmp
CXXFLAGS += -O3 -xCORE-AVX2 -axCORE-AVX512,MIC-AVX512

LD_FLAGS = -qopenmp

TARGETS = memxct
OBJECTS = src/main.o src/raytrace.o src/kernels.o

# ----- Make Rules -----

# all:	$(TARGETS)

%.o: %.cpp vars.h
	echo "Compling $^"
	${CXX} ${CXXFLAGS} ${OPT_FLAGS} $^ -c -o $@

memxct: $(OBJECTS)
	$(CXX) -o $@ $(OBJECTS) $(LD_FLAGS)

clean:
	rm -f $(TARGETS) src/*.o src/*.o.* *.bin core
