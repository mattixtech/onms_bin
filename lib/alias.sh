#@IgnoreInspection BashAddShebang
# Convenient alias commands for interactive shells
alias assemble="$OPENNMS_SOURCE/assemble.pl -DskipTests=true"
alias builddeploy="clean && compile && deployModule"
alias clean="$OPENNMS_SOURCE/clean.pl -DskipTests=true"
alias compile="$OPENNMS_SOURCE/compile.pl -DskipTests=true"
alias jvms="ps aux | grep \"[j]ava\""
alias l="ls -lahtr"
alias nstart="sudo $OPENNMS_HOME/bin/opennms -vt start"
alias nstop="sudo $OPENNMS_HOME/bin/opennms stop"
alias oh="cd \"$OPENNMS_HOME\"; pwd"
alias osr="cd \"$OPENNMS_SOURCE\"; pwd"
alias tm="nstop; $OPENNMS_SOURCE/compile.pl -t"

