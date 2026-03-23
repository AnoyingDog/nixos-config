{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false; 
      wallpaper = [{
        monitor = "";
        path = "~/nixos-config/images/background";
        fit_mode = "cover";
      }];
    };
  };
}
