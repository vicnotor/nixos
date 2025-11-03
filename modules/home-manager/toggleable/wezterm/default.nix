{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    weztermModule.enable =
      lib.mkEnableOption "Wezterm module";
  };

  config = lib.mkIf config.weztermModule.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      package = inputs.wezterm.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    home.file = {
      ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/wezterm";
    };
  };
}
