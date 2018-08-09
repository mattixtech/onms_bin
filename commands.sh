# Command shortcuts for noninteractive shells

assemble_cmd()
{
    "$OPENNMS_SOURCE"/assemble.pl -DskipTests=true
}
export -f assemble_cmd

clean_cmd()
{
    "$OPENNMS_SOURCE"/clean.pl -DskipTests=true
}
export -f clean_cmd

compile_cmd()
{
    "$OPENNMS_SOURCE"/compile.pl -DskipTests=true
}
export -f compile_cmd

nstop_cmd()
{
    sudo "$OPENNMS_BIN"/opennms stop
}
export -f nstop_cmd
