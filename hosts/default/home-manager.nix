{ inputs, ... }:

{
  home-manager.nixosModules.home-manager
    {
      home-manager = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;
      useUserPackages = true;
      users.vic = import ./home.nix;
      backupFileExtension = "hmbak";
    };
}
}
