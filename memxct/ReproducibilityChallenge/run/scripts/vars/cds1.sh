#DOMAIN INFORMATION
export NUMTHE=750
export NUMRHO=512
export PIXSIZE=1

#SOLVER DATA
export NUMITER=24

# CPU tuning
if [ $1 = "cpu" ]
then
	echo "CPU"
	export SPATSIZE=64
	export SPECSIZE=64

	export PROJBLOCK=128
	export BACKBLOCK=128
	
	export PROJBUFF=64
	export BACKBUFF=64

# CPU tuning
else
	echo "GPU"
	export SPATSIZE=32
	export SPECSIZE=32

	export PROJBLOCK=256
	export BACKBLOCK=256

	export PROJBUFF=48
	export BACKBUFF=48
fi

#I/O FILES
export THEFILE=../../data/CDS1_theta.bin
export SINFILE=../../data/CDS1_sinogram.bin
export OUTFILE=../output/recon_CDS1.bin

