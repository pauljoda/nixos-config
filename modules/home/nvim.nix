{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.lazyvim = {
    enable = true;

    extras = {
      lang.dotnet.enable = true;
      lang.json.enable = true;
      lang.markdown.enable = true;
      lang.nix.enable = true;
      lang.python.enable = true;
      lang.typescript.enable = true;
    };

    extraPackages = with pkgs; [
      lua-language-server
      stylua
          # LSP servers
    nixd
    pyright

    # Formatters
    black
    alejandra

    # Tools
    ripgrep
    fd
    ];
  };
}
