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
  #xdg.configFile."guitarix".source = config.lib.file.mkOutOfStoreSymlink"${config.home.homeDirectory}/.config/guitarix";

}

