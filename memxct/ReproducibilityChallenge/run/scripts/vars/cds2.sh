#DOMAIN INFORMATION
export NUMTHE=375
export NUMRHO=1024
export PIXSIZE=1

#SOLVER DATA
export NUMITER=24

# CPU tuning
if [ $1 = "cpu" ]
then
	echo "CPU"
	export SPATSIZE=64
	export SPECSIZE=64

	export PROJBLOCK=64
	export BACKBLOCK=64
	
	export PROJBUFF=32
	export BACKBUFF=32

# CPU tuning
else
	echo "GPU"
	export SPATSIZE=32
	export SPECSIZE=32

	export PROJBLOCK=512
	export BACKBLOCK=512

	export PROJBUFF=48
	export BACKBUFF=48
fi

#I/O FILES
export THEFILE=../../data/CDS2_theta.bin
export SINFILE=../../data/CDS2_sinogram.bin
export OUTFILE=../output/recon_CDS2.bin

