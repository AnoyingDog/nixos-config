{ config, pkgs,... }:
{
    home.packages = with pkgs; [
      neovim
      thunar
      nerd-fonts.caskaydia-cove
      ffmpeg
      ripgrep
      bat
      feh
      mpv
      yt-dlp
      gcc
      btop

      crosspipe
      wireplumber
      pavucontrol
      guitarix

      wireplumber
      obs-studio

      zstd
      unrar
      unzip
      xournalpp

    ];
}
