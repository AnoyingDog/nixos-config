# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    inputs.maccel.nixosModules.default
  ];
# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


# Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking = {
    hostName = "The-Silly-Machine";
    #interfaces.enp5s0 = {
      #ipv4.addresses = [{
        #address = "192.168.1.81";
        #prefixLength = 24;
      #}];
    #};
    #defaultGateway = "192.168.1.1";
    #nameservers = [ "1.1.1.1" "8.8.8.8" ];

    networkmanager = {
      enable = true;
      #unmanaged = [ "enp5s0" ];
    };
  };


# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Set your time zone.
  time.timeZone = "Europe/Vienna";

# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  systemd = {
    services.NetworkManager-wait-online.enable = false;
  };

# Enable the X11 windowing system.
# You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

# Enable the Desktop Environment and Display Manager.
  services.displayManager.ly.enable = true; 
  services.desktopManager.plasma6.enable = true;
  programs.hyprland.enable = true; 

# Configure keymap in X11
  services.xserver.xkb = {
    layout = "at";
    variant = "nodeadkeys";
    options = "caps:swapescape";
  };

  services = {
    fwupd.enable = false;
  };

  environment.etc."libinput/local-overrides.quirks".text = ''
    [Never Debounce]
    MatchUdevType=mouse
    ModelBouncingKeys=1
      '';

#Configure keymap in tty
  console.useXkbConfig = true;

#Configure Fonts
  fonts.fontconfig.enable = true;

# Enable CUPS to print documents.
  services.printing.enable = true;

# Enable sound with pipewire.
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
  };

# Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leon = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "leon";
    extraGroups = [ "networkmanager" "wheel" "audio" "jackaudio" ];
  };


  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
    fish.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    corectrl.enable = true;
    nix-ld.enable = true;

    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 5; #adjusts niceness value (-20 to 19)
          inhibit_screensaver = 1; #blocks screensaver/lock screen
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "high";
        };
        cpu = {
          park_cores = "no";
          pin_cores = "yes";
        };
      };
    };
  };

  #zramSwap.enable = true;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    cpu.intel.updateMicrocode = true;
  };

  #powerManagement.cpuFreqGovernor = "performance";

  hardware.maccel = {
    enable = true;
    enableCli = true; 
    parameters = {
      mode = "natural";
      sensMultiplier = 1.0;
      yxRatio = 1.0;
      inputDpi = 1600.0;
      angleRotation = 0.0;
      decayRate = 10.0;
      offset = 3.0;
      limit = 1.3;
    };
  };

  environment.sessionVariables = {
# Force RADV (Mesa Vulkan) — faster than amdvlk for most games
    AMD_VULKAN_ICD = "RADV";

# Proton improvements
    VKD3D_FEATURE_LEVEL = "12_1";

# Mesa shader cache — point to a stable location
    MESA_SHADER_CACHE_DIR = "$HOME/.cache/mesa_shaders";
    DXVK_STATE_CACHE_PATH = "$HOME/.cache/dxvk";
  };
# List packages installed in system profile. To search, run:
# $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
      git
      neovim
      yazi
      htop

      playerctl
      brightnessctl
      fanctl
      ethtool
  ];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
