{
  lib,
  config,
  ...
}: {
  options = {
    nhModule.enable =
      lib.mkEnableOption "nh module";
  };

  config = lib.mkIf config.nhModule.enable {
    programs.nh = {
      enable = true;
      flake = "/home/vic/Git/vicnotor/nixos";
    };
  };
}
