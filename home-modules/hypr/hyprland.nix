{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nwg-look
  ];

  services = {
    hyprpolkitagent.enable = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../configFiles/hypr/hyprland.conf;
  };
}
