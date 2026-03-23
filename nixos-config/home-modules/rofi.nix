{ config, pkgs, ... }:

{
  home.packages = [ 
    pkgs.rofi
  ];
  home.file.".config/rofi/config.rasi".source = ./configFiles/rofi/config.rasi;
}
