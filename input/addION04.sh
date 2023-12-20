#!/bin/sh

# The constituion of ions are determined by SLTCAP server.

if [ ! -d WAT03 ]; then
    printf "There is no WART03 DO solvWAT03"
    exit
fi

cd WAT03

cat <<EOF > ion.mdp
; Run Parameters
define=-DFLEXIBLE
integrator=steep
nsteps=5000

; Energy minimization parameters
emtol=100.0
emstep=0.01

; Bond Parameters
constraints=none

; Neiborserching
cutoff-scheme=verlet
nstlist=1
ns_type=grid
rlist=1.2

; VdW
vdw-modifier=Potential-switch
rvdw=1.2
rvdw-switch=1.0
DispCorr=No

; Electrostatic
coulombtype=pme
rcoulomb=1.2

; Periodic Boundary conditions
pbc=xyz

; PME parameters
pme_order=4
ewald_rtol=1.0e-5
fourier-nx=96
fourier-ny=96
fourier-nz=96
EOF

#################################################

gmx grompp \
    -maxwarn 1 \
    -f ion.mdp \
    -c t4lw_open.gro \
    -p t4lw_open.top \
    -o ion.tpr
    
gmx genion \
    -s ion.tpr \
    -o t4lw_open.gro \
    -p t4lw_open.top \
    -pname NA -np 34 \
    -nname CL -nn 42

#################################################

gmx grompp \
    -maxwarn 1 \
    -f ion.mdp \
    -c t4lw_close.gro \
    -p t4lw_close.top \
    -o ion.tpr

gmx genion \
    -s ion.tpr \
    -o t4lw_close.gro \
    -p t4lw_close.top \
    -pname NA -np 34 \
    -nname CL -nn 42











