{ pkgs, ... }:

{
  home.packages = [ 
    pkgs.rofi
    pkgs.rofi-emoji
  ];
  home.file.".config/rofi/config.rasi".source = ./configFiles/rofi/config.rasi;
}
