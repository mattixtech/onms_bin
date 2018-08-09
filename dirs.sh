# Set up some useful directory variables
export OPENNMS_HOME="$OPENNMS_DIR/target/opennms"
export OPENNMS_BIN="$OPENNMS_HOME/bin"
export OPENNMS_LIB="$OPENNMS_HOME/lib"
export OPENNMS_SOURCE="$OPENNMS_DIR"

# Add this directory to the PATH
PATH="${BIN_DIR}:${PATH}"
export PATH