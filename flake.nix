{
  description = "xxheyhey's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    waybar.url = "github:Alexays/Waybar";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    swww.url = "github:LGFae/swww";
    nixd.url = "github:nix-community/nixd";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-flatpak,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixlap = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;
        modules = [
          ./hosts/nixlap/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {inherit inputs;};
              useGlobalPkgs = true;
              useUserPackages = true;
              users.vic = import ./hosts/nixlap/home.nix;
              backupFileExtension = "hmbak";
            };
          }
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
      homeManagerModules = import ./modules/home-manager {inherit inputs;};
      nixosModules = import ./modules/nixos {inherit inputs;};
    };
  };
}
