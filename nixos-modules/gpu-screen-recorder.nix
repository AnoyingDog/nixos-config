{ pkgs, ... }:

{
  programs.gpu-screen-recorder.enable = true;

  systemd.user.services.gsr-replay = {
    description = "GPU Screen Recorder replay buffer";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder -w screen -c mp4 -f 60 -a default_output|default_input -r 420 -o %h/Videos/Clips";
      Restart = "on-failure";
    };
  };
}
