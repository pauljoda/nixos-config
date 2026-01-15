{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bitwise # A command-line tool for bit and hex manipulation
    dotnetCorePackages.sdk_9_0_1xx # The .NET SDK, a set of libraries and tools for building .NET applications
    entr # A utility to run arbitrary commands when files change
    fd # A simple, fast and user-friendly alternative to find
    gtt # A terminal user interface for Google Translate
    gifsicle # A command-line tool for creating, editing, and getting information about GIF images and animations
    jdk17 # Java Development Kit version 17
    jq # A lightweight and flexible command-line JSON processor
    soundwireserver # A server application to stream audio to an Android device
    tdf # A command-line PDF viewer
    todo # A command-line todo list manager
    valgrind # A programming tool for memory debugging, memory leak detection, and profiling

    # C / C++
    gcc # The GNU Compiler Collection, a compiler system supporting various programming languages
    gnumake # A tool that controls the generation of executables and other non-source files from source files

    # Python
    docker # A platform for developing, shipping, and running applications in containers
    libnotify # A library to send desktop notifications
    man-pages # Extra manual pages for various commands and functions
    jetbrains.rider # A cross-platform .NET IDE
    rustdesk # Remote Software
    xxd # A command-line utility to create a hex dump of a given file or standard input

    prismlauncher # Minecraft Mods
  ];
}
