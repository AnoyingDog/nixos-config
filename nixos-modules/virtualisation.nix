{ pkgs, ... }: 

{
  virtualisation = {
    waydroid.enable = true;
    waydroid.package = pkgs.waydroid-nftables;

    libvirtd.enable = true;
  };
}
