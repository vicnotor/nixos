{
  lib,
  config,
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
    };
    home.file = {
      ".config/wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Git/vicnotor/nixos/modules/home-manager/toggleable/wezterm/wezterm.lua";
    };
  };
}
