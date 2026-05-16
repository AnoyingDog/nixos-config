{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-21.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
        ];
      };

      homeConfigurations."leon" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        extraSpecialArgs = {
          inherit inputs;
          pkgs-old = inputs.nixpkgs-old.legacyPackages.x86_64-linux;
          spicePkgs = inputs.spicetify-nix.legacyPackages.x86_64-linux;
        };

        modules = [
          ./home-modules/home.nix
          inputs.catppuccin.homeModules.catppuccin
          {
          }];
      };
    };
}
