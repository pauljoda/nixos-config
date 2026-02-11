{
  pkgs,
  ...
}: {
  programs.lazyvim = {
    enable = true;
    ignoreBuildNotifications = true;

    extras = {
      lang.dotnet = {
        enable = true;
        installDependencies = false;
        installRuntimeDependencies = true;
      };
      lang.json = {
        enable = true;
        installDependencies = false;
        installRuntimeDependencies = false;
      };
      lang.markdown = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = false;
      };
      lang.nix = {
        enable = true;
        installDependencies = false;
        installRuntimeDependencies = false;
      };
      lang.python = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = false;
      };
      lang.typescript = {
        enable = true;
        installDependencies = false;
        installRuntimeDependencies = false;
      };

      formatting.black = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = false;
      };
      formatting.prettier = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = false;
      };
      linting.eslint = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };
    };

    extraPackages = with pkgs; [
      # Nix lint/format/LSP for lang.nix extra
      statix
      nixfmt
      nil
      nixd
      alejandra

      # Python LSP (lang.python defaults to pyright + ruff)
      pyright

      # JSON/TS language servers for lang.json/lang.typescript
      vscode-langservers-extracted
      vtsls

      # .NET language servers and tooling
      omnisharp-roslyn
      fsautocomplete
      csharpier
      fantomas
      netcoredbg

      # Keep Lua tooling for editor config files
      lua-language-server
      stylua
    ];
  };
}
