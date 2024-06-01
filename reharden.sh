#! /bin/sh
export ROUTING_CORES=16
export OPENLANE_ROOT=/home/uri/openmpw/openlane
export PDK=sky130A
#export OPENLANE_TAG=2023.09.11
#export OPENLANE_IMAGE_NAME=efabless/openlane:7e5a2e9fb274c0a100b4859a927adce7089455ff
export OPENLANE_TAG=2023.11.17
export OPENLANE_IMAGE_NAME=efabless/openlane:2023.11.17
#volare enable 1341f54f5ce0c4955326297f235e4ace1eb6d419 # for older openlane
#volare enable dd7771c384ed36b91a25e9f8b314355fc26561be # for newer openlane
#python tt/configure.py --update-shuttle
#python tt/reharden.py --clone
python tt/reharden.py --harden --start-from $1 --end-at $2
