{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-21.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = inputs@{ nixpkgs, home-manager,... }: {
    homeConfigurations."leon" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        pkgs-old = inputs.nixpkgs-old.legacyPackages.x86_64-linux;
      };
      modules = [
        ./home.nix
        {
          home.packages = [ inputs.zen-browser.packages.x86_64-linux.default ];
        }];
    };
  };
}
