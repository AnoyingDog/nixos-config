{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    wlr-randr
    neovim
    opencode
    vscode-fhs
    teams-for-linux

    #fonts
    nerd-fonts.caskaydia-cove
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    liberation_ttf
    dejavu_fonts
    teams-for-linux

    ffmpeg
    ripgrep
    fzf
    bat
    feh
    mpv
    yt-dlp
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
    libreoffice
    
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
