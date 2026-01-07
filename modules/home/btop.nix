{pkgs, ...}: {
  programs.btop = {
    enable = true;
  };

  home.packages = with pkgs; [nvtopPackages.intel];
}
