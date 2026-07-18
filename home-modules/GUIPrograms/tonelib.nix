{ pkgs, lib, ... }:

{

  xdg.desktopEntries.tonelib-gfx = {
    name = "ToneLib-GFX (PipeWire)";
    genericName = "ToneLib-GFX";
    exec = "pw-jack ${lib.getExe pkgs.tonelib-gfx}";
    icon = "tonelib-gfx";
    terminal = false;
    categories = [ "AudioVideo" "Music" ];
  };
}
