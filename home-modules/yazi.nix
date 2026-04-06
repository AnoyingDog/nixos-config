{ config, pkgs, ... }:

{
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    theme = fromTOML (builtins.readFile ./configFiles/yazi/theme.toml);
  };
}
