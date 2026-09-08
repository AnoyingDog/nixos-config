{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-file-transfer
  ];
  services.udev.extraRules = ''
    # Honor
    SUBSYSTEM=="usb", ATTR{idVendor}=="339b", MODE="0666", GROUP="plugdev"
  '';

  # Ensure plugdev group exists
  users.groups.plugdev = {};

  # Add leon to plugdev group
  users.users.leon.extraGroups = [ "plugdev" ];
}
