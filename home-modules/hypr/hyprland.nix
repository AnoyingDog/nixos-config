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

# This prevents home-manager from writing ~/.config/hypr/hyprland.conf
    settings = {};
    extraConfig = "";
#extraConfig = builtins.readFile ../configFiles/hypr/hyprland.conf;
  };
  xdg.configFile."hypr/hyprland.conf".enable = false;

}
