# ***CHANGEME***
OPENNMS_DIR="/Users/opennms/shared/opennms"
BIN_DIR="/Users/opennms/shared/onms_bin"

# Set up some useful directory variables
export OPENNMS_HOME="$OPENNMS_DIR/target/opennms"
export OPENNMS_LIB_DIR="$OPENNMS_HOME/lib"
export OPENNMS_SOURCE_ROOT="$OPENNMS_DIR"

# Add this directory to the PATH
PATH="${BIN_DIR}:${PATH}"
export PATH

# Convenient alias commands
alias assemble="$OPENNMS_SOURCE_ROOT/assemble.pl -DskipTests=true"
alias builddeploy="clean && compile && deployModule true"
alias clean="$OPENNMS_SOURCE_ROOT/clean.pl -DskipTests=true"
alias compile="$OPENNMS_SOURCE_ROOT/compile.pl -DskipTests=true"
alias nstart="sudo $OPENNMS_HOME/bin/opennms -vt start"
alias nstop="sudo $OPENNMS_HOME/bin/opennms stop"
alias oh="cd \"$OPENNMS_HOME\"; pwd"
alias osr="cd \"$OPENNMS_SOURCE_ROOT\"; pwd"
alias tm="nstop; $OPENNMS_SOURCE_ROOT/compile.pl -t"

source "$BIN_DIR"/routines.sh