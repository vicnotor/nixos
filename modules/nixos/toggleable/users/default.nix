{pkgs, ...}: {
  imports = [
    ./vic.nix
  ];

  users = {
    defaultUserShell = pkgs.zsh;
  };
}
