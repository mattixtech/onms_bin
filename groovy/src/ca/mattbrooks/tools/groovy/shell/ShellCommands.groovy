package ca.mattbrooks.tools.groovy.shell

import java.util.function.Consumer

class ShellCommands {
    static def printStderrAndExit = { ShellOutput exec ->
        if (exec.exitValue) {
            println exec.stdErr
            System.exit 1
        }
    }

    static void runCommand(String command, Consumer<ShellOutput> execConsumer = null) {
        def executedProc = command.execute()
        def stdOut = new StringBuilder()
        def stdErr = new StringBuilder()

        executedProc.consumeProcessOutput stdOut, stdErr
        executedProc.waitFor()

        if (execConsumer) {
            execConsumer.accept new ShellOutput(stdOut: "$stdOut", stdErr: "$stdErr",
                    exitValue: executedProc.exitValue())
        }
    }

    static class ShellOutput {
        String stdOut
        String stdErr
        int exitValue
    }
}
