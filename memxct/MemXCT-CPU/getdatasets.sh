#!/bin/sh

DATASET_DIR="datasets"

# make dir if not already there
mkdir -p $DATASET_DIR
cd $DATASET_DIR

wget https://uofi.box.com/shared/static/ql76fxfrnec1jdl8dc4f2g4ihwekn9oj -O ADS1_theta.bin
wget https://uofi.box.com/shared/static/zmt3vq5k0jaqgcay4a7yscv2a0viyxlc -O ADS1_sinogram.bin

wget https://uofi.box.com/shared/static/yrsr9brzl6q03bmnunfk65k33ykvfr8o -O ADS2_theta.bin
wget https://uofi.box.com/shared/static/wssrib7ud9na1k5zxxjm3kabd2bcrjwu -O ADS2_sinogram.bin

wget https://uofi.box.com/shared/static/vi1uiecpqqiz7rjtty6fbxxwn1feoib0 -O ADS3_theta.bin
wget https://uofi.box.com/shared/static/icxtknbrndv8i2d83mc87ppjxepty8jz -O ADS3_sinogram.bin

wget https://uofi.box.com/shared/static/tbjk9dksog7qqick66nbcnq4ngais1yd -O ADS4_theta.bin
wget https://uofi.box.com/shared/static/ki7smuurh34cleayvwfxhjfn9mgsnega -O ADS4_sinogram.bin

