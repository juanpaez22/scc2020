#!/bin/env python

filename="../../run/output/memxct-cpu.o104"

RUNS_P_SET=4
cds1=[]
cds2=[]
cds3=[]

# Get results
with open(filename, "r") as f:
  for line in f:
    # Time reporting line
    if line[:6] == "recon:":
      tokens=line.split(" ")
      # Get times
      tot=float(tokens[3])
      A_p=float(tokens[4][1:])
      C=float(tokens[5])
      R=float(tokens[6][:-1])
      dat=(tot, A_p, C, R)
      if len(cds1) < RUNS_P_SET:
        cds1.append(dat)
      elif len(cds2) < RUNS_P_SET:
        cds2.append(dat)
      else:
        cds3.append(dat)

i=1
with open("../output/cds1.csv", "w") as f:
  f.write("Nodes,Total,A_p,C,R\n")
  for dat in cds1:
    f.write("%d,%f,%f,%f,%f\n" % (i, dat[0], dat[1], dat[2], dat[3]))
    i *= 2

i=1
with open("../output/cds2.csv", "w") as f:
  f.write("Nodes,Total,A_p,C,R\n")
  for dat in cds2:
    f.write("%d,%f,%f,%f,%f\n" % (i, dat[0], dat[1], dat[2], dat[3]))
    i*=2

i=1
with open("../output/cds3.csv", "w") as f:
  f.write("Nodes,Total,A_p,C,R\n")
  for dat in cds3:  
    f.write("%d,%f,%f,%f,%f\n" % (i, dat[0], dat[1], dat[2], dat[3]))
    i*=2

