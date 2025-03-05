{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {}; 
in
{
  home.packages = (with pkgs; [
    _2048                             # A terminal-based version of the popular 2048 game
    
    audacity                          # A free, open-source, cross-platform audio software for multi-track recording and editing
    bitwise                           # A command-line tool for bit and hex manipulation
    cbonsai                           # A terminal screensaver that displays a growing bonsai tree
    evince                            # A document viewer for multiple document formats (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr, cbz, cb7 and cbt))
    eza                               # A modern replacement for the ls command
    entr                              # A utility to run arbitrary commands when files change
    fd                                # A simple, fast and user-friendly alternative to find
    file                              # A command-line utility to determine file types
    file-roller                       # An archive manager for the GNOME desktop environment
    fzf                               # A general-purpose command-line fuzzy finder
    gtt                               # A terminal user interface for Google Translate
    gifsicle                          # A command-line tool for creating, editing, and getting information about GIF images and animations
    gimp                              # The GNU Image Manipulation Program, a free and open-source raster graphics editor
    gtrash                            # A command-line tool to move files to the trash instead of deleting them
    hexdump                           # A command-line utility to display file contents in hexadecimal
    jdk17                             # Java Development Kit version 17
    lazygit                           # A simple terminal UI for git commands
    libreoffice                       # A free and open-source office suite
    nautilus                          # The default file manager for the GNOME desktop environment
    nitch                             # A system information fetch utility
    nix-prefetch-github               # A tool to fetch and hash the contents of a GitHub repository
    pipes                             # A terminal screensaver that draws random pipes
    prismlauncher                     # A custom launcher for Minecraft
    ripgrep                           # A line-oriented search tool that recursively searches your current directory for a regex pattern
    soundwireserver                   # A server application to stream audio to an Android device
    tdf                               # A command-line PDF viewer
    todo                              # A command-line todo list manager
    toipe                             # A typing test in the terminal
    valgrind                          # A programming tool for memory debugging, memory leak detection, and profiling
    yazi                              # A terminal file manager
    yt-dlp-light                      # A lightweight fork of youtube-dl, a command-line program to download videos from YouTube and other sites
    zenity                            # A tool to display GTK+ dialog boxes from the command line
    winetricks                        # A helper script to download and install various redistributable runtime libraries needed to run some programs in Wine
    wineWowPackages.wayland           # Wine packages for running Windows applications on Wayland

    # C / C++
    gcc                               # The GNU Compiler Collection, a compiler system supporting various programming languages
    gnumake                           # A tool that controls the generation of executables and other non-source files from source files

    # Python
    python3                           # The Python programming language, version 3

    bleachbit                         # A free and open-source disk space cleaner, privacy manager, and computer system optimizer
    cmatrix                           # A terminal screensaver that simulates the display from "The Matrix"
    gparted                           # A free partition editor for graphically managing disk partitions
    ffmpeg                            # A complete, cross-platform solution to record, convert and stream audio and video
    imv                               # A command-line image viewer
    killall                           # A command-line utility to kill processes by name
    libnotify                         # A library to send desktop notifications
    man-pages                         # Extra manual pages for various commands and functions
    mpv                               # A free, open-source, and cross-platform media player
    ncdu                              # A disk usage analyzer with an ncurses interface
    openssl                           # A robust, full-featured open-source toolkit implementing the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols
    pamixer                           # A command-line mixer for PulseAudio
    pavucontrol                       # A volume control tool (GUI) for the PulseAudio sound server
    playerctl                         # A command-line utility to control media players
    wl-clipboard                      # Clipboard utilities for Wayland (wl-copy, wl-paste)
    cliphist                          # A clipboard manager
    poweralertd                       # A daemon to alert on power events
    qalculate-gtk                     # A powerful and easy-to-use desktop calculator
    unzip                             # A utility to extract files from ZIP archives
    wget                              # A network utility to retrieve files from the web
    xdg-utils                         # A set of command-line tools that assist applications with a variety of desktop integration tasks
    xxd                               # A command-line utility to create a hex dump of a given file or standard input
    inputs.alejandra.defaultPackage.${system} # Alejandra, a Nix code formatter
  ]);
}
