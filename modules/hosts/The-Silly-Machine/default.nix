{ self, inputs, ... }: {

  flake.nixosConfigurations.The-Silly-Machine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.The-Silly-Machine-Configuration
    ];
  };

}
