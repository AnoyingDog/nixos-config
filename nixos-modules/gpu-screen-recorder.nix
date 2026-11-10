{ pkgs, lib, ... }:

{
  programs.gpu-screen-recorder.enable = true;

  systemd.user.services.gsr-replay = {
    description = "GPU Screen Recorder replay buffer";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = lib.concatStringsSep " " [
        "${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder"
          "-w screen"
          "-c mp4"
          "-f 60"
          ''-a "app-inverse:spotify|default_input"''
          "-r 420"
          "-o %h/Videos/Clips"
      ];
      Restart = "on-failure";
    };
  };
  # Make sure the output directory exists.
  systemd.user.tmpfiles.rules = [ "d %h/Videos/Clips 0755 - - -" ];
}
