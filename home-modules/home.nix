{ config, pkgs, inputs, catppuccin,... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight

      ./GUIPrograms/vesktop.nix
      ./GUIPrograms/spicetify.nix
      ./GUIPrograms/guitarix.nix

      ./hypr/hyprland.nix
      ./hypr/hyprpaper.nix
      ./hypr/hypridle.nix
      ./hypr/hyprlock.nix
      ./hypr/hyprshot.nix

      ./nvf.nix
      ./desktop-entries.nix
      ./gtk.nix
      ./rofi.nix
      ./kitty.nix
      ./waybar.nix
      ./neofetch.nix
      ./wlogout.nix
      ./fish.nix
      ./yazi.nix
      ./packages.nix
      ];


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home = {
    username = "leon";
    homeDirectory = "/home/leon";
    stateVersion = "26.05"; 
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
      SDL_VIDEODRIVER = "wayland";
    };
    pointerCursor = {
      enable = true;
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 24;

      x11.enable = true;
      x11.defaultCursor = "BreezeX-RosePine-Linux";
      gtk.enable = true;
    };
  };

  fonts.fontconfig.enable = true;

  programs = {

    fastfetch.enable = true;
    gcc.enable = true;

    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          Name = "AnoyingDog";
          Email = "188097811+AnoyingDog@users.noreply.github.com";
        };
        init.defaultBranch = "main";
      };
    };

    rbw = {
      enable = true;
    };
    
    zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };
    prismlauncher = {
      enable = true;
    };
  };

  services = {
    dunst.enable = true;
  };

  catppuccin = {
    autoEnable = false;
    enable = true;
    flavor = "mocha";
    accent = "mauve";

    btop.enable = true;
    fish.enable = true;
    yazi.enable = true;
    qt5ct.enable = true;
  };

# Let Home Manager install and manage itself.
# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
  };

  xdg.configFile = {
    "dunst/dunstrc".source = ./configFiles/dunst/dunstrc;
    "starship.toml".source = ./configFiles/starship.toml;
  };# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/leon/etc/profile.d/hm-session-vars.sh
#
}
