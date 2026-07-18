{ config, pkgs, ... }:

let
  ardour-pw = pkgs.writeShellScriptBin "ardour" ''
    exec ${pkgs.pipewire.jack}/bin/pw-jack ${pkgs.ardour}/bin/ardour9 "$@"
  '';
in
{
  home.packages = with pkgs; [
    ardour-pw
    pipewire

    # --- Wine + yabridge for Windows VST/VST3 plugins ---
    wineWow64Packages.waylandFull
    yabridge
    yabridgectl

    # --- Native Linux plugins ---
    distrho-ports
  ];

  home.sessionVariables = {
    WINEPREFIX = "${config.home.homeDirectory}/.wine-vst";
  };

  home.file.".wine-vst/drive_c/VstPlugins/.keep".text = "";

  home.activation.yabridgeSync = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.yabridge}/bin/yabridgectl add "$HOME/.wine-vst/drive_c/VstPlugins" || true
    $DRY_RUN_CMD ${pkgs.yabridge}/bin/yabridgectl sync || true
  '';

  xdg.desktopEntries.ardour = {
    name = "Ardour (PipeWire-JACK)";
    exec = "${pkgs.pipewire.jack}/bin/pw-jack ${pkgs.ardour}/bin/ardour9";
    icon = "ardour";
    categories = [ "Audio" "AudioVideo" ];
    terminal = false;
  };
}
