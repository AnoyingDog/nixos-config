{
  systemd = {
    services.NetworkManager-wait-online.enable = false;

    settings.Manager = {
      DefaultTimeoutStartSec = "15s";
      DefaultTimeoutStopSec = "15s";
    };
  };
}
