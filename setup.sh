#@IgnoreInspection BashAddShebang

# ***CHANGEME*** ***CHANGEME***
# These need to point to the correct directory on your system
# The directory the opennms git repo exists in
OPENNMS_DIR="/Users/opennms/shared/opennms"
# The directory this repo exists in
BIN_DIR="/Users/opennms/shared/onms_bin"
# ***CHANGEME*** ***CHANGEME***

LIB_DIR="$BIN_DIR/lib"
export OPENNMS_SETUP_DEFINED="true"
source "$LIB_DIR"/dirs.sh
source "$LIB_DIR"/alias.sh
source "$LIB_DIR"/commands.sh
source "$LIB_DIR"/routines.sh