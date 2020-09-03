# -*- Makefile -*-

arch = My_MPI_OMP
setup_file = setup/Make.$(arch)

include $(setup_file)


HPCG_DEPS = src/CG.o \
	    src/CG_ref.o \
	    src/TestCG.o \
	    src/ComputeResidual.o \
	    src/ExchangeHalo.o \
	    src/GenerateGeometry.o \
	    src/GenerateProblem.o \
	    src/GenerateProblem_ref.o \
	    src/CheckProblem.o \
	    src/MixedBaseCounter.o \
	    src/OptimizeProblem.o \
	    src/ReadHpcgDat.o \
	    src/ReportResults.o \
	    src/SetupHalo.o \
	    src/SetupHalo_ref.o \
	    src/TestSymmetry.o \
	    src/TestNorms.o \
	    src/WriteProblem.o \
	    src/YAML_Doc.o \
	    src/YAML_Element.o \
	    src/ComputeDotProduct.o \
	    src/ComputeDotProduct_ref.o \
	    src/mytimer.o \
	    src/ComputeOptimalShapeXYZ.o \
	    src/ComputeSPMV.o \
	    src/ComputeSPMV_ref.o \
	    src/ComputeSYMGS.o \
	    src/ComputeSYMGS_ref.o \
	    src/ComputeWAXPBY.o \
	    src/ComputeWAXPBY_ref.o \
	    src/ComputeMG_ref.o \
	    src/ComputeMG.o \
	    src/ComputeProlongation_ref.o \
	    src/ComputeRestriction_ref.o \
	    src/CheckAspectRatio.o \
	    src/OutputFile.o \
	    src/GenerateCoarseProblem.o \
	    src/init.o \
	    src/finalize.o

# These header files are included in many source files, so we recompile every file if one or more of these header is modified.
PRIMARY_HEADERS = /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/Geometry.hpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/SparseMatrix.hpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/Vector.hpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CGData.hpp \
                  /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/MGData.hpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/hpcg.hpp

all: bin/xhpcg

bin/xhpcg: src/main.o $(HPCG_DEPS)
	$(LINKER) $(LINKFLAGS) src/main.o $(HPCG_DEPS) $(HPCG_LIBS) -o bin/xhpcg

clean:
	rm -f src/*.o bin/xhpcg

.PHONY: all clean

src/main.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/main.cpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/CG.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CG.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CG.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/CG_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CG_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CG_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/TestCG.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/TestCG.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/TestCG.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeResidual.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeResidual.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeResidual.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ExchangeHalo.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ExchangeHalo.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ExchangeHalo.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/GenerateGeometry.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateGeometry.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateGeometry.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/GenerateProblem.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateProblem.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateProblem.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/GenerateProblem_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateProblem_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateProblem_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/CheckProblem.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CheckProblem.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CheckProblem.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/MixedBaseCounter.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/MixedBaseCounter.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/MixedBaseCounter.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/OptimizeProblem.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/OptimizeProblem.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/OptimizeProblem.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ReadHpcgDat.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ReadHpcgDat.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ReadHpcgDat.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ReportResults.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ReportResults.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ReportResults.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/SetupHalo.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/SetupHalo.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/SetupHalo.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/SetupHalo_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/SetupHalo_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/SetupHalo_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/TestSymmetry.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/TestSymmetry.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/TestSymmetry.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/TestNorms.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/TestNorms.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/TestNorms.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/WriteProblem.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/WriteProblem.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/WriteProblem.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/YAML_Doc.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/YAML_Doc.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/YAML_Doc.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/YAML_Element.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/YAML_Element.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/YAML_Element.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeDotProduct.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeDotProduct.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeDotProduct.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeDotProduct_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeDotProduct_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeDotProduct_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/finalize.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/finalize.cpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/init.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/init.cpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/mytimer.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/mytimer.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/mytimer.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeOptimalShapeXYZ.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeOptimalShapeXYZ.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeOptimalShapeXYZ.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeSPMV.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSPMV.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSPMV.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeSPMV_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSPMV_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSPMV_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeSYMGS.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSYMGS.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSYMGS.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeSYMGS_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSYMGS_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeSYMGS_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeWAXPBY.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeWAXPBY.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeWAXPBY.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeWAXPBY_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeWAXPBY_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeWAXPBY_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeMG_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeMG_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeMG_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeMG.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeMG.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeMG.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeProlongation_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeProlongation_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeProlongation_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/ComputeRestriction_ref.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeRestriction_ref.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/ComputeRestriction_ref.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/GenerateCoarseProblem.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateCoarseProblem.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/GenerateCoarseProblem.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/CheckAspectRatio.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CheckAspectRatio.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/CheckAspectRatio.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

src/OutputFile.o: /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/OutputFile.cpp /home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src/OutputFile.hpp $(PRIMARY_HEADERS)
	$(CXX) -c $(CXXFLAGS) -I/home1/05903/kac5224/scc2020/hpcg/hpcg-3.1/src $< -o $@

