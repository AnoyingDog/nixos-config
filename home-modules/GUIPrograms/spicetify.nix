{ config, pkgs, inputs, spicePkgs,... }:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
    ];

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
