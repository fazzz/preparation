#!/bin/sh

if [ ! -f WAT03 ]; then
    mkdir WAT03
fi

cd WAT03

gmx editconf \
    -f ../TOP02/t4lv_open.gro \
    -c -bt cubic \
    -d 1 \
    -o t4lv_open_box.gro

cp ../TOP02/t4lv_open.top t4lw_open.top

gmx solvate \
    -cp t4lv_open_box.gro \
    -cs spc216.gro \
    -p  t4lw_open.top \
    -o  t4lw_open.gro

gmx editconf \
    -f ../TOP02/t4lv_close.gro \
    -c -bt cubic \
    -d 1 \
    -o t4lv_close_box.gro

cp ../TOP02/t4lv_close.top t4lw_close.top

gmx solvate \
    -cp t4lv_close_box.gro \
    -cs spc216.gro \
    -p  t4lw_close.top \
    -o  t4lw_close.gro




