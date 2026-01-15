{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cbonsai # A terminal screensaver that displays a growing bonsai tree
    evince # A document viewer for multiple document formats (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr, cbz, cb7 and cbt))
    eza # A modern replacement for the ls command
    file # A command-line utility to determine file types
    file-roller # An archive manager for the GNOME desktop environment
    fzf # A general-purpose command-line fuzzy finder
    gimp # The GNU Image Manipulation Program, a free and open-source raster graphics editor
    gtrash # A command-line tool to move files to the trash instead of deleting them
    hexdump # A command-line utility to display file contents in hexadecimal
    lazygit # A simple terminal UI for git commands
    libreoffice # A free and open-source office suite
    nautilus # The default file manager for the GNOME desktop environment
    nitch # A system information fetch utility
    nix-prefetch-github # A tool to fetch and hash the contents of a GitHub repository
    nwg-look # View and modify gtk themes
    pipes # A terminal screensaver that draws random pipes
    ripgrep # A line-oriented search tool that recursively searches your current directory for a regex pattern
    toipe # A typing test in the terminal
    yazi # A terminal file manager
    yt-dlp-light # A lightweight fork of youtube-dl, a command-line program to download videos from YouTube and other sites
    zenity # A tool to display GTK+ dialog boxes from the command line
    winetricks # A helper script to download and install various redistributable runtime libraries needed to run some programs in Wine
    wineWowPackages.wayland # Wine packages for running Windows applications on Wayland
    whitesur-icon-theme
    sushi

    python3 # The Python programming language, version 3

    matugen # Wallpaper color scheme generator

    bleachbit # A free and open-source disk space cleaner, privacy manager, and computer system optimizer
    cmatrix # A terminal screensaver that simulates the display from "The Matrix"
    gparted # A free partition editor for graphically managing disk partitions
    ffmpeg # A complete, cross-platform solution to record, convert and stream audio and video
    imv # A command-line image viewer
    killall # A command-line utility to kill processes by name
    mpv # A free, open-source, and cross-platform media player
    ncdu # A disk usage analyzer with an ncurses interface
    openssl # A robust, full-featured open-source toolkit implementing the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols
    pamixer # A command-line mixer for PulseAudio
    pavucontrol # A volume control tool (GUI) for the PulseAudio sound server
    playerctl # A command-line utility to control media players
    wl-clipboard # Clipboard utilities for Wayland (wl-copy, wl-paste)
    cliphist # A clipboard manager
    poweralertd # A daemon to alert on power events
    qalculate-gtk # A powerful and easy-to-use desktop calculator
    unzip # A utility to extract files from ZIP archives
    wget # A network utility to retrieve files from the web
    xdg-utils # A set of command-line tools that assist applications with a variety of desktop integration tasks
    inputs.alejandra.defaultPackage.${stdenv.hostPlatform.system} # Alejandra, a Nix code formatter
  ];
}
