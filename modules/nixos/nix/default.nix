{
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    nixModule.enable =
      lib.mkEnableOption "enables module for nix and nixpkgs related settings";
  };

  config = lib.mkIf config.nixModule.enable {
    nix = {
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      settings = {
        experimental-features = ["nix-command" "flakes"];
        substituters = [
          "https://hyprland.cachix.org"
          "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };
    };
    nixpkgs.config.allowUnfree = true;
  };
}
