#!/bin/sh
klayout -b -r ~/openmpw/mpw_precheck/checks/tech-files/sky130A_mr.drc -rd feol=true -rd input=reharden/$1/runs/wokwi/results/final/gds/$1.gds -rd topcell=$1 -rd report=drc_feol.xml
code reharden/$1/runs/wokwi/results/final/gds/drc_feol.xml
#klayout reharden/$1/runs/wokwi/results/final/gds/$1.gds
