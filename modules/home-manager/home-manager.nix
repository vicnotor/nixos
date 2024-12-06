{ inputs, ... }: {
  home-manager.vic = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      vic = import ../../hosts/default/home.nix;
      modules = [
        ../../hosts/default/home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
