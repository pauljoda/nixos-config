{
  pkgs,
  config,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
    fantasque-sans-mono
    maple-mono
  ];

  gtk = {
    enable = true;
    # font = {
    #   name = "JetBrainsMono Nerd Font";
    #   size = 11;
    # };
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
    # theme = {
    #   name = "WhiteSur-Dark";
    #   package = pkgs.whitesur-gtk-theme.override {
    #     colorVariants = ["dark"];
    #   };
    # };
    # cursorTheme = {
    #   name = "Bibata-Modern-Ice";
    #   package = pkgs.bibata-cursors;
    #   size = 22;
    # };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # home.pointerCursor = {
  #   name = "Bibata-Modern-Ice";
  #   package = pkgs.bibata-cursors;
  #   size = 22;
  # };
}
