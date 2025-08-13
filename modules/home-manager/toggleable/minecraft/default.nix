{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    minecraftModule.enable =
      lib.mkEnableOption "Minecraft module";
  };

  config = lib.mkIf config.minecraftModule.enable {
    home.packages = [pkgs.prismlauncher];
  };
}
