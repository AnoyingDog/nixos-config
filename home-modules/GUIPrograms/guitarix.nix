{ config, pkgs, lib, ... }:

{


  home.packages = with pkgs; [
# Core
    guitarix               # The amp simulator itself
      gxplugins-lv2          # Official Guitarix LV2 plug-in collection

# JACK tooling
      jack2                  # JACK Audio Connection Kit daemon & tools
      jack-example-tools     # jack_connect, jack_lsp, jack_monitor, …
      qjackctl               # GUI patchbay / JACK control panel

# LV2 / plugin ecosystem
      lv2                    # LV2 specification & headers
      lilv                   # LV2 host library (used by Guitarix)
      suil                   # LV2 UI embedding library
      lsp-plugins            # Huge bundle of quality LV2 effects
      calf                   # Calf Studio Gear (chorus, reverb, EQ, …)
      zam-plugins            # ZaMaximX2, ZaMultiComp, ZaReverb, …
      mda_lv2                # MDA classic plug-ins ported to LV2
      mod-distortion         # MOD Distortion plug-ins

# Utilities
      ardour                 # Optional DAW that works well with Guitarix
      carla                  # Plugin host / patchbay (great companion)
      a2jmidid               # ALSA→JACK MIDI bridge
      ];

# Keeps your user presets/banks writable outside the Nix store.
  xdg.configFile."guitarix".source = config.lib.file.mkOutOfStoreSymlink"${config.home.homeDirectory}/.config/guitarix";

  home.sessionVariables = {
# Let LV2 hosts (Carla, Ardour, …) discover gxplugins automatically.
    LV2_PATH = lib.concatStringsSep ":" [
      "${pkgs.gxplugins-lv2}/lib/lv2"
        "${pkgs.guitarix}/lib/lv2"
        "$HOME/.lv2"
    ];
# Prefer JACK over ALSA/PulseAudio for low-latency I/O.
    JACK_NO_AUDIO_RESERVATION = "1";
  };

# ─── Systemd user service (auto-start JACK via PipeWire bridge) ──────────────
# Only needed when NOT using the PipeWire JACK bridge system-wide.
# Comment out the whole block if pipewire-jack is handling it for you.

  systemd.user.services.guitarix-jack = {
    Unit = {
      Description = "JACK audio server for Guitarix";
      After       = [ "pipewire.service" "pipewire-pulse.service" ];
    };
    Install.WantedBy = [ "default.target" ];
    Service = {
      ExecStart = "${pkgs.jack2}/bin/jackd -d alsa -d hw:0 -r 48000 -p 128 -n 2";
      Restart   = "on-failure";
# Drop to real-time scheduling if the kernel allows it.
      Nice      = -10;
    };
  };
}

