{
  programs.starship = {
      enable = true;
      enableFishIntegration = true;
  };

  xdg.configFile."starship.toml".source = ./configFiles/starship.toml;
}
