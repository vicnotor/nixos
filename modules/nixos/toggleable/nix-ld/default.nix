{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nix-ldModule.enable =
      lib.mkEnableOption "enables nix-ld module";
  };

  config = lib.mkIf config.nix-ldModule.enable {
    programs.nix-ld = {
      enable = true;
      libraries = import ./libraries.nix {inherit pkgs;};
    };
  };
}
