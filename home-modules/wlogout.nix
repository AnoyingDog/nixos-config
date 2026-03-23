{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;
  };
  xdg.configFile."wlogout".source = ./configFiles/wlogout;
}
