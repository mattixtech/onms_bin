class ShellCommands {
    static def printStderrAndExit = { ShellOutput exec ->
        if (exec.exitValue) {
            println(exec.stdErr)
            System.exit(1)
        }
    }

    static def runCommand(String command, Closure cls = null) {
        def executedProc = command.execute()
        def sout = new StringBuilder(), serr = new StringBuilder()
        executedProc.consumeProcessOutput(sout, serr)
        executedProc.waitFor()

        if (cls != null) {
            cls(new ShellOutput(stdOut: sout.toString(), stdErr: serr.toString(),
                    exitValue: executedProc.exitValue()))
        }
    }

    static class ShellOutput {
        String stdOut
        String stdErr
        int exitValue
    }
}
