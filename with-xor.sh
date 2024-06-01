export OPENLANE2_ROOT=~/openlane2
export PDK_ROOT=~/openmpw/pdk

python3 tt/configure.py --update-shuttle && \
nix-shell ${OPENLANE2_ROOT}/shell.nix --run "python -m openlane tt/rom/config.json" && \
nix-shell ${OPENLANE2_ROOT}/shell.nix --run "cd tt-multiplexer/ol2/tt_ctrl && python build.py" && \
nix-shell ${OPENLANE2_ROOT}/shell.nix --run "cd tt-multiplexer/ol2/tt_mux && python build.py" && \
python3 tt/configure.py --copy-macros && \
nix-shell ${OPENLANE2_ROOT}/shell.nix --run "cd tt-multiplexer/ol2/tt_top && python build.py"
