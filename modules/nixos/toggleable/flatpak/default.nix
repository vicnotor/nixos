{
  lib,
  config,
  ...
}: {
  options = {
    flatpakModule.enable =
      lib.mkEnableOption "Flatpak module";
  };

  config = lib.mkIf config.flatpakModule.enable {
    services.flatpak = {
      enable = true;
      packages = ["app.zen_browser.zen"];
      update.auto = {
        enable = true;
        onCalendar = "weekly";
      };
      # overrides = {
      #   global = {
      #     # Force Wayland by default
      #     Context.sockets = ["wayland" "!x11" "!fallback-x11"];
      #   };
      # };
    };
  };
}
