{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./vic.nix
  ];

  users = {
    defaultUserShell = pkgs.zsh;
  };

  # All enabled users
  vic.enable = lib.mkDefault true;
}
