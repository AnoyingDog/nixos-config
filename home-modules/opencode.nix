{
  programs.opencode = {
    enable = true;

    settings = {
      permission = {
        external_directory = {
          "*" = "ask";
          "/nix/store/**" = "allow";
        };
      };
    };
  };
}
