{
  description = "vicnotor's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpolkitagent = {
      url = "github:hyprwm/hyprpolkitagent";
      inputs = {
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
        hyprutils.follows = "hyprland/hyprutils";
      };
    };
    hyprland-qtutils = {
      url = "github:hyprwm/hyprland-qtutils";
      inputs = {
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
        hyprland-qt-support.follows = "hyprpolkitagent/hyprland-qt-support";
      };
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs = {
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprutils.follows = "hyprland/hyprutils";
        hyprlang.follows = "hyprland/hyprlang";
        hyprwayland-scanner.follows = "hyprland/hyprwayland-scanner";
      };
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-devshells = {
      url = "github:vicnotor/nix-devshells";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    my-quickshell = {
      url = "github:/vicnotor/my-quickshell";
      # inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    # Might use in future:
    # nixpkgs-stable.url = "github:NixOS/nixpkgs?ref=nixos-25.05";
    # waybar.url = "github:Alexays/Waybar";
    # ghostty.url = "github:ghostty-org/ghostty";
    # caelestia.url = "github:caelestia-dots/shell";
    # walker.url = "github:abenz1267/walker";
    # wezterm = {
    #   url = "github:wezterm/wezterm?dir=nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixosModules = import ./modules/nixos {inherit inputs;};
      homeManagerModules = import ./modules/home-manager {inherit inputs;};

      # Hosts
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
          inputs.determinate.nixosModules.default
        ];
      };
      nixvirt = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;
        modules = [
          ./hosts/nixvirt/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {inherit inputs;};
              useGlobalPkgs = true;
              useUserPackages = true;
              users.vic = import ./hosts/nixvirt/home.nix;
              backupFileExtension = "hmbak";
            };
          }
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
