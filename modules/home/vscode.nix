{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # nix language
      bbenoist.nix
      # nix-shell suport 
      arrterian.nix-env-selector
      # python
      ms-python.python
      # C/C++
      ms-vscode.cpptools

      # Remote Login for servers
      ms-vscode-remote.remote-ssh

      # AI
      github.copilot
      github.copilot-chat
    ];
  };
}
