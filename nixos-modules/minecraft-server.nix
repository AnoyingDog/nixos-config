{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    inputs.playit-nixos-module.nixosModules.default
  ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.playit = {
    enable = true;
    secretPath = "/etc/playit/secret.toml";
  };

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers = {
      silly-server = {
        enable = true;
        package = pkgs.vanillaServers.vanilla-26_1_2;

        # performance tweaks
        jvmOpts = "-Xms12G -Xmx12G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1";

        serverProperties = {
          server-port = 25565;
          difficulty = "normal";
          gamemode = "survival";
          max-players = 10;
          motd = "\\u00A75Super duper silly awesome sauce server :3";
          white-list = false;
          view-distance = 32;
          simulation-distance = 12;
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 25565 ];
  systemd.services.minecraft-server-silly-server = {   wantedBy = lib.mkForce []; };
}
