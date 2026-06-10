{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = ''
      set -U fish_greeting ""
      set -g fish_key_bindings fish_vi_key_bindings
      bind -M default space accept-autosuggestion
      bind -M insert \ce 'customyazi'
      bind -M normal /ce 'customyazi'
      fish_config theme choose "catppuccin-mocha"
      
      function customyazi
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          yazi $argv --cwd-file="$tmp"
          
          if test -f "$tmp"
              set cwd (cat -- "$tmp")
              if test -n "$cwd" -a "$cwd" != "$PWD"
                  cd -- "$cwd"
              end
          end
          
          rm -f -- "$tmp"
      end
    '';
    shellAliases = {
      vim = "nvim";
      svim = "sudoedit";
    };
  };
}
