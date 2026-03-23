{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable= true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      #dotDir = "${builtins.getEnv "HOME"}/.config/zsh";
      dotDir = "/home/leon/.config/zsh/";

      shellAliases = {
        vim = "nvim";
        svim = "sudoedit";
      };
      history = {
        size = 10000;
        path = "${builtins.getEnv "HOME"}/.cache/zsh/history";
        share = true;
      };
      #      siteFunctions= ''
      #        function customyazi() {
      #          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
      #          yazi "$@" --cwd-file="$tmp"
      #          if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      #            builtin cd -- "$cwd"
      #          fi
      #          rm -f -- "$tmp"
      #        }
      #      '';
    };
  };
  #starship
}
