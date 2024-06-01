#!/bin/sh

klayout -b -r ~/openmpw/mpw_precheck/checks/tech-files/sky130A_mr.drc -rd beol=true -rd input=projects/$1/$1.gds -rd topcell=$1 -rd report=drc_beol.xml
code projects/$1/drc_beol.xml
