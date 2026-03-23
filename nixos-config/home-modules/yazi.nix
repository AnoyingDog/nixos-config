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
    theme = builtins.fromTOML (builtins.readFile ./configFiles/yazi/theme.toml);
  };
}
