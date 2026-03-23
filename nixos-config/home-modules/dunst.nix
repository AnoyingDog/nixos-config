{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    dunst
  ];
  services.dunst = {
    enable = true;
  };

  xdg.configFile."dunst/dunstrc".source =./configFiles/dunstrc;
}
