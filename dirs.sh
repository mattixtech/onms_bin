# Set up some useful directory variables
export OPENNMS_HOME="$OPENNMS_DIR/target/opennms"
export OPENNMS_BIN_DIR="$OPENNMS_HOME/bin"
export OPENNMS_LIB_DIR="$OPENNMS_HOME/lib"
export OPENNMS_SOURCE_ROOT="$OPENNMS_DIR"

# Add this directory to the PATH
PATH="${BIN_DIR}:${PATH}"
export PATH