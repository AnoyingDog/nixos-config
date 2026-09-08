{ pkgs, ...}:

{
  programs = {
    fish.enable = true;

    steam = { enable = true;
      remotePlay.openFirewall = true;
    };

    corectrl.enable = true;
    nix-ld.enable = true;

    fuse.userAllowOther = true;
    appimage = {
      enable = true;
      binfmt = true; # registers binfmt so AppImages run directly without appimage-run
    };

    direnv.enable = true;
  };
}
