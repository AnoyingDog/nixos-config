{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    neovim
    opencode

    #fonts
    nerd-fonts.caskaydia-cove
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    liberation_ttf
    dejavu_fonts

    ffmpeg
    ripgrep
    fzf
    bat
    feh
    mpv
    yt-dlp
    thunderbird
    zapzap
    pinentry-curses
    xdg-desktop-portal-hyprland
    libnotify
    github-cli

    hyprpicker

    # JACK tooling
    jack2                  # JACK Audio Connection Kit daemon & tools
    jack-example-tools     # jack_connect, jack_lsp, jack_monitor, …
    qjackctl               # GUI patchbay / JACK control panel

    crosspipe
    wireplumber
    pavucontrol

    firefox
    inputs.helium.packages.${system}.default
    
    _7zip-zstd
    zstd
    unrar
    unzip
    xournalpp

    kdePackages.kdenlive
    gimp

    wl-clipboard
  ];
}
