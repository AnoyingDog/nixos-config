{
  services = {
    xserver.enable = false;
    displayManager.ly.enable = true; 
    desktopManager.plasma6.enable = true;
  };
  programs.hyprland = {
    enable = true;
    withUWSM = true; 
    xwayland.enable = true; 
  };
}
