{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-21.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    maccel = {
      url = "github:Gnarus-G/maccel";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";

  };

  outputs = inputs@{ nixpkgs, home-manager,... }:

    let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations."The-Silly-Machine" = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./configuration.nix


          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              inherit inputs;
              pkgs-old = inputs.nixpkgs-old.legacyPackages.${system};
              spicePkgs = inputs.spicetify-nix.legacyPackages.${system};

              assets = {
                wallpaper = ./assets/wallpapers/default-wallpaper.png;
                wallpaper-dir = ./assets/wallpapers;
                profile-picture = ./assets/profile-picture.png;
              };

            };

            home-manager.sharedModules = [
              inputs.catppuccin.homeModules.catppuccin
            ];

            home-manager.users.leon = import ./home.nix;
          }
      ];
    };

  };
}
