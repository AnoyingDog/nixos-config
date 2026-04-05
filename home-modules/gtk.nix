{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "mocha";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };

    cursorTheme = {
      name = "rose.pine.cursor";
      package = pkgs.rose-pine-cursor;
    };
  };

# Required for GTK4 apps
  home.sessionVariables.GTK_THEME = "catppuccin-mocha-mauve-standard";
}
