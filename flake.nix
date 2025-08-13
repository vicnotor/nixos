{
  description = "vicnotor's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:NixOS/nixpkgs?ref=nixos-25.05";
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
    # waybar.url = "github:Alexays/Waybar";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    # ghostty.url = "github:ghostty-org/ghostty";
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
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # caelestia.url = "github:caelestia-dots/shell";
    my-quickshell = {
      url = "github:/vicnotor/my-quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # walker.url = "github:abenz1267/walker";
    # wezterm = {
    #   url = "github:wezterm/wezterm?dir=nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module?ref=release-2.93";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
          inputs.auto-cpufreq.nixosModules.default
          inputs.lix-module.nixosModules.default
        ];
      };
      nixosModules = import ./modules/nixos {inherit inputs;};
      homeManagerModules = import ./modules/home-manager {inherit inputs;};
    };
  };
}
