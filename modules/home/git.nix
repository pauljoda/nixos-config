{pkgs, ...}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "pauljoda";
        email = "pauldavis101@gmail.com";
      };

      init.defaultBranch = "main";
      credential.helper = "store";
    };

    # userName = "pauljoda";
    # userEmail = "pauldavis101@gmail.com";

    # extraConfig = {
    #   init.defaultBranch = "main";
    #   credential.helper = "store";
    # };
  };
}
