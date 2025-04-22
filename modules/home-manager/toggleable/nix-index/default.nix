{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];
  options = {
    nix-indexModule.enable =
      lib.mkEnableOption "nix-index and comma module";
  };

  config = lib.mkIf config.nix-indexModule.enable {
    programs = {
      nix-index = {
        enable = true;
        enableZshIntegration = true;
      };
      nix-index-database.comma.enable = true;
    };
  };
}
