{ pkgs, lib, ... }:

{
  services = {
    hyprpolkitagent.enable = true;
  };
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "hyprlang";
  wayland.windowManager.hyprland.settings = {

    monitor = [
      "DP-2, 1920x1080@144, 0x0, 1"
      "DP-3, 1920x1200@60, 1920x0, 1"
    ];

    exec-once = [
      "[workspace 2 silent] vesktop"
      "steam -silent"

      "hyprpaper"
      "waybar"
      "dunst"
      "hypridle"

      "systemctl --user start hyprpolkitagent"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    ];

    general = {
      gaps_in = 2;
      gaps_out = 3;
      border_size = 2;

      "col.active_border" = "rgba(181825aa) rgba(cba6f7fe) rgba(cba6f7fe) rgba(cba6f7fe) 90deg";
      "col.inactive_border" = "rgba(181825aa)";

      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };

    cursor = {
      inactive_timeout = 15;
    };

    decoration = {
      rounding = 2;
      active_opacity = 1;
      inactive_opacity = 1;

      blur = {
        enabled = true;
        size = 2;
        passes = 2;
        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];
      animation = [
        "global,1,10,default"
        "border,1,5.39,easeOutQuint"
        "windows,1,4.79,easeOutQuint"
        "windowsIn,1,4.1,easeOutQuint,popin,87%"
        "windowsOut,1,1.49,linear,popin,87%"
        "fadeIn,1,1.73,almostLinear"
        "fadeOut,1,1.46,almostLinear"
        "fade,1,3.03,quick"
        "layers,1,3.81,easeOutQuint"
        "layersIn,1,4,easeOutQuint,fade"
        "layersOut,1,1.5,linear,fade"
        "fadeLayersIn,1,1.79,almostLinear"
        "fadeLayersOut,1,1.39,almostLinear"
        "workspaces,1,1.94,almostLinear,fade"
        "workspacesIn,1,1.21,almostLinear,fade"
        "workspacesOut,1,1.94,almostLinear,fade"
      ];
    };

    dwindle = {
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 1;
      disable_hyprland_logo = true;
      middle_click_paste = false;
    };

    
    input = {
      kb_layout = "de";
      follow_mouse = 1;
      sensitivity = 0;

      touchpad = {
        natural_scroll = false;
      };
    };

    device = [
    {
      name = "razer-razer-deathadder-v2";
      sensitivity = -0.45;
    }
    {
      name = "roccat-roccat-kone-pro";
      sensitivity = -0.85;
    }
    ];

    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, ALT_L, exec, ${lib.getExe pkgs.kitty}"
      "$mainMod, C, killactive"
      "$mainMod, Z, exit"
      "$mainMod, E, exec, ${lib.getExe pkgs.thunar}"
      "$mainMod, V, togglefloating"
      "$mainMod, SPACE, exec, rofi -show drun"
      "$mainMod, I, pseudo"
      "$mainMod, F, fullscreen"

      "$mainMod SHIFT, L, exec, ${lib.getExe pkgs.hyprlock}"
      "$mainMod, P, exec, hyprpicker -a --format=hex"
      "$mainMod, B, exec, ~/.scripts/RestartWaybar.sh"
      "$mainMod, G, exec, ~/.scripts/GetActiveWindowTitle.sh"

      "$mainMod, S, exec, ${lib.getExe pkgs.hyprshot} -m region --freeze"
      "$mainMod SHIFT, S, exec, ${lib.getExe pkgs.hyprshot} -m window --freeze"
      "$mainMod CTRL_L, S, exec, ${lib.getExe pkgs.hyprshot} -m output --freeze"

      "$mainMod, X, exec, zen-twilight"
      "$mainMod, T, exec, thunderbird"

      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, N, togglespecialworkspace, magic"
      "$mainMod SHIFT, N, movetoworkspace, special:magic"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    bindl = [
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPrev, exec, playerctl previous"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    windowrule {
      name = suppress-maximize
        match:class =.*

        suppress_event = maximize
    }

  windowrule {
    name = no-blur
      match:class = vesktop

      no_blur = on
  }
  '';
}
