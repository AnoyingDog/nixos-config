{ pkgs, lib, ... }:

{
  services = {
    hyprpolkitagent.enable = true;
  };
  wayland.windowManager.hyprland.enable = true;
  #wayland.windowManager.hyprland.configType = "hyprlang";

  wayland.windowManager.hyprland.extraConfig = ''
    ------------------
    ---- MONITORS ----
    ------------------
    hl.monitor({ output = "DP-2", mode = "1920x1080@144", position = "0x0",    scale = 1 })
    hl.monitor({ output = "DP-3", mode = "1920x1200@60",  position = "1920x0", scale = 1 })

    -------------------
    ---- AUTOSTART ----
    -------------------
    -- exec-once now lives inside the hyprland.start event so it only ever
    -- runs once at boot, even though hyprland.lua gets re-parsed on save.
    hl.on("hyprland.start", function()
      hl.exec_cmd("vesktop", { workspace = "2 silent" })
      hl.exec_cmd("steam -silent")

      hl.exec_cmd("hyprpaper")
      hl.exec_cmd("waybar")
      hl.exec_cmd("dunst")
      hl.exec_cmd("hypridle")

      hl.exec_cmd("systemctl --user start hyprpolkitagent")
      hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    end)

    -----------------------
    ---- LOOK AND FEEL ----
    -----------------------
    hl.config({
      general = {
        gaps_in = 2,
        gaps_out = 3,
        border_size = 2,

        col = {
          active_border = {
            colors = { "rgba(181825aa)", "rgba(cba6f7fe)", "rgba(cba6f7fe)", "rgba(cba6f7fe)" },
            angle = 90,
          },
          inactive_border = "rgba(181825aa)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
      },

      cursor = {
        inactive_timeout = 15,
      },

      decoration = {
        rounding = 2,
        active_opacity = 1,
        inactive_opacity = 1,

        blur = {
          enabled = true,
          size = 2,
          passes = 2,
          vibrancy = 0.1696,
        },
      },

      animations = {
        enabled = true,
      },
    })

    -- Bezier curves and animation timings (one hl.curve / hl.animation call
    -- per entry, replacing the old `bezier =` / `animation =` lists).
    hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
    hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
    hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
    hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1.0}  } })
    hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

    hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
    hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
    hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
    hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
    hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
    hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
    hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
    hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
    hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
    hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
    hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
    hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
    hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
    hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
    hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
    hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

    hl.config({
      dwindle = {
        preserve_split = true,
      },
    })

    ----------------
    ---- MISC ----
    ----------------
    hl.config({
      misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo = true,
        middle_click_paste = false,
      },
    })

    ---------------
    ---- INPUT ----
    ---------------
    hl.config({
      input = {
        kb_layout = "de",
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
          natural_scroll = false,
        },
      },
    })

    hl.device({ name = "razer-razer-deathadder-v2", sensitivity = -0.45 })
    hl.device({ name = "roccat-roccat-kone-pro",     sensitivity = -0.85 })

    ---------------------
    ---- KEYBINDINGS ----
    ---------------------
    local mainMod = "SUPER"

    hl.bind(mainMod .. " + ALT_L", hl.dsp.exec_cmd("${lib.getExe pkgs.kitty}"))
    hl.bind(mainMod .. " + C", hl.dsp.window.close())
    hl.bind(mainMod .. " + Z", hl.dsp.exit())
    hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("${lib.getExe pkgs.thunar}"))
    hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
    hl.bind(mainMod .. " + I", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

    hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("${lib.getExe pkgs.hyprlock}"))
    hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a --format=hex"))
    hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.scripts/RestartWaybar.sh"))
    hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("~/.scripts/GetActiveWindowTitle.sh"))

    hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("${lib.getExe pkgs.hyprshot} -m region --freeze"))
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("${lib.getExe pkgs.hyprshot} -m window --freeze"))
    hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("${lib.getExe pkgs.hyprshot} -m output --freeze"))

    hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("zen-twilight"))
    hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("thunderbird"))

    -- Focus movement
    hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

    -- Workspaces 1-10, plus SHIFT to move the active window
    for i = 1, 10 do
      local key = i % 10 -- 10 maps to key 0
      hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
      hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    end

    -- Special workspace (scratchpad)
    hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Scroll through workspaces
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

    -- Move/resize with mouse
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Volume / brightness (locked + repeating == old bindel)
    hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),   { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),   { locked = true, repeating = true })
    hl.bind("XF86AudioMute",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),  { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",       hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),{ locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("brightnessctl s 10%+"),                        { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl s 10%-"),                        { locked = true, repeating = true })

    -- Media keys (locked == old bindl)
    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

    --------------------------------
    ---- WINDOWS AND WORKSPACES ----
    --------------------------------
    hl.window_rule({
      name = "suppress-maximize",
      match = { class = ".*" },
      suppress_event = "maximize",
    })

    hl.window_rule({
      name = "no-blur",
      match = { class = "vesktop" },
      no_blur = true,
    })
  '';
}
