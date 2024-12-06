{ inputs, ... }: {
  home-manager.vic = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      vic = import ./home.nix;
      modules = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
