{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    font = {
      name = "Caskaydia Cove Nerd Font";
      package = pkgs.nerd-fonts.caskaydia-cove;
      size = 11;
    };
    keybindings = {
      "f1" = "clear_terminal reset active";

      "ctrl+plus" = "change_font_size all +2";
      "ctrl+minus" = "change_font_size all -2";
    };
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      cursor_blink_interval = 0;
      background_opacity = 0.9;
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
  };
}
