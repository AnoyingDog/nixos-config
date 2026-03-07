{
  description = "Home Manager Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };
  outputs = { self, nixpkgs, zen-browser }: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    packages.x86_64-linux.zen-browser = zen-browser.packages.x86_64-linux.default;
  };
}
