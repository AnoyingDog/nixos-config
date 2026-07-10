{ pkgs, ...}:

{
  services = {
    keyd = {
      enable = true;
      keyboards.default = {
        ids = [ "*" ];
        settings.main = {
          capslock = "esc";
          esc = "capslock";
        };
      };
    };

    printing = {
      enable = true;
      drivers = with pkgs; [ gutenprint hplip ];
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    openssh.enable = true;

    qemuGuest.enable = true;

    upower.enable = true;
    tuned.enable = true;
  };
} 
