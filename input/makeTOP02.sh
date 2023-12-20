#!/bin/sh

if [ ! -f TOP02 ]; then
    mkdir TOP02
fi

cd TOP02

gmx pdb2gmx \
    -f ../PDB01/t4l_open.pdb \
    -ff amber03 \
    -water tip3p \
    -ignh -heavyh -vsite hydrogens \
    -o t4lv_open.gro \
    -p t4lv_open.top

gmx pdb2gmx \
    -f ../PDB01/t4l_close.pdb \
    -ff amber03 \
    -water tip3p \
    -ignh -heavyh -vsite hydrogens \
    -o t4lv_close.gro \
    -p t4lv_close.top

