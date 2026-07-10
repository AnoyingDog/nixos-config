{ pkgs, ...}:

{
  programs = {
    fish.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
      ];
    };


    corectrl.enable = true;
    nix-ld.enable = true;

    gamemode = {
      enable = true;
      settings = {
        general = {
          ioprio = 0;
          renice = 0;
          desiredgov = "performance";
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          amd_performance_level = "high";
        };
        cpu = {
          park_cores = "no";
          pin_cores = "no";
        };
      };
    };

    fuse.userAllowOther = true;
    appimage = {
      enable = true;
      binfmt = true; # registers binfmt so AppImages run directly without appimage-run
    };

    virt-manager.enable = true;
  };
}
