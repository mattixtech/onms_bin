package ca.mattbrooks.scripts

import groovy.cli.commons.CliBuilder
import groovy.cli.commons.OptionAccessor

import static ca.mattbrooks.tools.groovy.shell.ShellCommands.getPrintStderrAndExit
import static ca.mattbrooks.tools.groovy.shell.ShellCommands.runCommand

static OptionAccessor getOptions(String[] args) {
    def cli = new CliBuilder(usage: "update-smoke-containers [options] <dir>", header: "Options:")
    cli.d(type: String, "Directory to download images to (overwrites existing)")
    cli.m(type: String, "Minion CircleCI build Id")
    cli.s(type: String, "Sentinel CircleCI build Id")
    cli.h(type: String, "Horizon CircleCI build Id")
    cli.n(type: Boolean, "Download but don't load into docker")

    def options = cli.parse args

    if (!(options.arguments()?.size() == 1) || (!options.m && !options.s && !options.h)) {
        cli.usage()
        System.exit 1
    }

    return options
}

static Map getImages(OptionAccessor options) {
    // Key is image name, value is CircleCI build Id
    def images = [:]

    if (options.h)
        images << ["horizon.oci": options.h]

    if (options.s)
        images << ["sentinel.oci": options.s]

    if (options.m)
        images << ["minion.oci": options.m]

    return images
}

static void downloadImages(Map imageMap, String directory, String circleId) {
    // Download new images
    println "Downloading new images..."
    imageMap.each {
        println "Downloading ${it.key}..."
        runCommand "wget https://${it.value}-${circleId}.circle-artifacts.com/0/${it.key} -O ${directory}/${it.value}", printStderrAndExit
    }
}

static void importImages(Map imageMap, String directory) {
    // Import them into docker
    println "Importing into docker..."
    imageMap.each {
        println "Importing ${it.key}..."
        runCommand "docker image load -i ${directory}/${it.key}", printStderrAndExit
    }
}

// Seems like this is a fixed part of all the artifact download URLs
def circleId = "9377198-gh"

def options = getOptions args
def images = getImages options
def dir = "${options.arguments()[0]}"
runCommand "mkdir -p $dir", printStderrAndExit
downloadImages images, dir, circleId

if (!options.n)
    importImages images, dir