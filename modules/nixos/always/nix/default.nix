{inputs, ...}: {
  nix = {
    channel.enable = false;
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "vic"];
      lazy-trees = true;
      substituters = [
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://install.determinate.systems"
      ];
      trusted-substituters = [
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://install.determinate.systems"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
      ];
      stalled-download-timeout = 10000;
      max-jobs = 6;
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
}
