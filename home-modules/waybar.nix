{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
  };
  xdg.configFile."waybar".source = ./configFiles/waybar;
}
