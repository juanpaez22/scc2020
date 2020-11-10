#!/bin/env python

import os
with open("hostfile.txt", "w") as hfile:
    for host in os.getenv('SLURM_NODE_ALIASES').split(','):
        hfile.write(host.split(":")[2] +"\n")
