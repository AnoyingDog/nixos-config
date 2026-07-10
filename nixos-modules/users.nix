{ pkgs, ... }:

{
# Don't forget to set a password with ‘passwd’.
  users.users = {
    leon = {
      shell = pkgs.fish;
      isNormalUser = true;
      description = "leon";
      extraGroups = [ "networkmanager" "wheel" "audio" "jackaudio" "lp" "lpadmin" "video" "render" "libvirtd"];
    };
  };
}
