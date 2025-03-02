{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "pauljoda";
    userEmail = "pauldavis101@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
