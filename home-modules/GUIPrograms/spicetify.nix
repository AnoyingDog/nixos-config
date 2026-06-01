{ config, pkgs, inputs, spicePkgs,... }:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
    ];

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
