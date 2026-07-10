{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    firefox
      git
      neovim
      yazi
      htop

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
