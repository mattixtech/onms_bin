#@IgnoreInspection BashAddShebang
##############################
# deployModule():
#
# Copies any jars found in this module to the lib directory.
#
# in:
# $1 - Optional flag to control whether or not the server will be restarted
# as part of the deployment (true if any value provided)
#
##############################
deployModule()
{
    set -o pipefail
    local moduleDir=$(pwd)

    jarsToDeploy=$(find "$moduleDir"/target -name "*.jar" \
        ! -name "*-sources.jar")

    if [[ -z "$jarsToDeploy" ]]; then
        echo -e "ERROR: Could not find any jars to deploy" >2

        return
    fi

    if [[ -n "$1" ]]; then
        echo -e "Restart flag was set, stopping the server..."
        nstop
    else
        echo -e "Note: You may need to manually restart the server"
    fi

    for jar in $jarsToDeploy; do
        local jarBaseName=$(basename "$jar")
        local checkSum=$(md5sum "$jar" | awk '{print $1}')
        local targetCheckSum
        targetCheckSum=$(md5sum "$OPENNMS_LIB/$jarBaseName" | awk '{print $1}')

        if [[ $? -ne 0 ]]; then
            ( >&2 echo -e "ERROR: Could not check target file $jarBaseName" )
            continue
        fi

        if [[ "$checkSum" == "$targetCheckSum" ]]; then
            echo -e "$jarBaseName is already up to date"
        else
            echo -e "Deploying $jarBaseName..."
            cp "$jar" "$OPENNMS_LIB"

            if [[ $? -ne 0 ]]; then
                ( >&2 echo -e "ERROR: Could not copy $jarBaseName" )
            else
                echo -e "Done!"
            fi
        fi
    done

    if [[ -n "$1" ]]; then
        nstart
    fi
}
