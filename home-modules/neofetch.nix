{ pkgs-old,... }:

{
  home.packages = [
    pkgs-old.neofetch
  ];
  xdg.configFile."neofetch".source = ./configFiles/neofetch;
}
