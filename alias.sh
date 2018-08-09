# Convenient alias commands for interactive shells
alias assemble="$OPENNMS_SOURCE_ROOT/assemble.pl -DskipTests=true"
alias builddeploy="clean && compile && deployModule true"
alias clean="$OPENNMS_SOURCE_ROOT/clean.pl -DskipTests=true"
alias compile="$OPENNMS_SOURCE_ROOT/compile.pl -DskipTests=true"
alias jvms="ps aux | grep \"[j]ava\""
alias nstart="sudo $OPENNMS_HOME/bin/opennms -vt start"
alias nstop="sudo $OPENNMS_HOME/bin/opennms stop"
alias oh="cd \"$OPENNMS_HOME\"; pwd"
alias osr="cd \"$OPENNMS_SOURCE_ROOT\"; pwd"
alias tm="nstop; $OPENNMS_SOURCE_ROOT/compile.pl -t"

