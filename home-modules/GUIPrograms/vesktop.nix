{
  xdg.desktopEntries.vesktop = {
    name = "Vesktop (Wayland)";
    genericName = "Vesktop";
    comment = "Discord client with Vencord, using Wayland support";
    exec = "env XDG_SESSION_TYPE=wayland QT_QPA_PLATFORM=wayland vesktop --ozone-platform=wayland --UseOzonePlatform";
    icon = "vesktop";
    terminal = false;
    categories = [ "Network" "InstantMessaging" ];
  };

  programs.vesktop.enable = true;

  programs.vesktop.vencord.themes = {
    "theme.css" = ../configFiles/vesktop/theme.css;
  };
}
