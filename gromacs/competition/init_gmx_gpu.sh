# Load correct GCC and MPI
module load gcc-9.2.0
module load mpi/impi

# Install HTOP
sudo yum -y install epel-release
sudo yum -y install htop

# Install CUDA and drivers
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum -y install dkms

CUDA_REPO_PKG=cuda-repo-rhel7-10.0.130-1.x86_64.rpm

wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/${CUDA_REPO_PKG} -O /tmp/${CUDA_REPO_PKG}

sudo rpm -ivh /tmp/${CUDA_REPO_PKG}

rm -f /tmp/${CUDA_REPO_PKG}

# sudo yum -y install mesa-libGL.x86_64 mesa-libEGL.x86_64
sudo yum -y install cuda-drivers
sudo yum -y install cuda


