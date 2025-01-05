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
    ghostty.url = "github:ghostty-org/ghostty";
    zig.url = "github:mitchellh/zig-overlay";
    stylix.url = "github:danth/stylix";
    yazi.url = "github:sxyazi/yazi";
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
    yazi-tokyo-night = {
      url = "github:BennyOe/tokyo-night.yazi";
      flake = false;
    };
    quickemu.url = "github:quickemu-project/quickemu";
  };

  outputs = {
    nixpkgs,
    home-manager,
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
          inputs.stylix.nixosModules.stylix
        ];
      };
      nixosModules = import ./modules/nixos {inherit inputs;};
      homeManagerModules = import ./modules/home-manager {inherit inputs;};
    };
  };
}
