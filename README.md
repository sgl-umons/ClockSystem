# ClockSystem

This is a gradle-based Java project for a Clock with Swing GUI and JUnit5 unit tests. It has been created and used by Tom Mens for educational purposes at the University of Mons.

The application includes a watch, with timer, stopwatch and alarm functionality. Its implementation is based on a statechart, using the state and singleton design patterns.

## Build automation

The application uses the **gradle** build automation system to build, test and exexute the application.
To build the application, use
```sh
gradle build
```
To run the unit tests, use
```sh
gradle test
```
To execute the Java application by opening a GUI (graphical user interface) you can interact with, use:
```sh
gradle run
```

## Development Environments

To run the application correctly, you can either use a **manual setup** ensuring you have the correct version of Java and Gradle installed locally on your machine.

But you can avoid this by first setting up an isolated development environment, for example using
**DevContainer** or **Nix** that will ensure that all correct versions of all tools and libraries required for the application are installed.

### Using Nix

This approach will setup a development environment using the [Nix](https://nixos.org) package manager.
No containerisation is used, and the development environment will be installed on your local machine, in **total isolation** from your current system packages.

1. Install Nix package manager: `curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install` (from https://github.com/NixOS/nix-installer)
2. Go to the project root folder
3. Run `nix-shell` to enter the development environment
4. Start using the Gradle commands for building, testing and executing the application and interact with it through its GUI.
5. Once you are done, exit the development environment by running `exit`

### Using DevContainer (Container based)

[DevContainer](https://containers.dev/) is a feature available for [VSCode](https://code.visualstudio.com/) and [Jetbrains](https://www.jetbrains.com/) IDEs that allows you to develop seamlessly in a containerised environment. This approach will setup your
development environment using containers.

Due to the graphical nature of the Java application, running the GUI may not be possible within **DevContainer**. However, you can still use it to build (compile) the code, run the tests, and generate the JAR file.

1. Ensure you have **Docker** installed on your machine. It might work with **Podman(( too, but it is not tested yet.
2. Install the DevContainer extension
   1. For VSCode:
      [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
      ([documentation](https://code.visualstudio.com/docs/devcontainers/containers))
   2. For Jetbrains IDEs: nothing to do, it is supported by default
      ([documentation](https://www.jetbrains.com/help/idea/connect-to-devcontainer.html))
3. Open the project in your IDE, and you should see a notification to reopen the project in a container, click on it.
4. Once the project is reopened in the container, you need to wait a bit for the container to build and start, and then you can start developing, all the tools and dependencies are already installed in the container.
