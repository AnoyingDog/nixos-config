{
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
    options = "caps:swapescape";
  };

  #Copy keymap from xserver in tty
  console.useXkbConfig = true;

# Enable touchpad support
  services.libinput.enable = true;

}
