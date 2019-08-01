#@IgnoreInspection BashAddShebang
# Set up some useful directory variables
export OPENNMS_HOME="$OPENNMS_DIR/target/opennms"
export OPENNMS_BIN="$OPENNMS_HOME/bin"
export OPENNMS_LIB="$OPENNMS_HOME/lib"
export OPENNMS_SOURCE="$OPENNMS_DIR"

# Add the bin directory to the PATH
PATH="${BIN_DIR}:${PATH}"
PATH="${GROOVY_DIR}:${PATH}"
export GROOVY_DIR
export PATH