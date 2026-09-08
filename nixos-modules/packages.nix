{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    usbutils
    playerctl
    brightnessctl
    fanctl
    ethtool
    linuxPackages.cpupower

    waydroid-helper

    jack2
    pipewire
    wireplumber
    alsa-utils
    pipewire.jack

  ];
}
