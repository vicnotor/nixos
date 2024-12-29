{
  lib,
  config,
  ...
}: {
  options = {
    htopModule.enable =
      lib.mkEnableOption "enables htop module";
  };

  config = lib.mkIf config.htopModule.enable {
    programs.htop = {
      enable = true;
      settings =
        {
          hide_userland_threads = true;
          show_program_path = false;
        }
        // (with config.lib.htop;
          leftMeters [
            (bar "CPU")
            (bar "Memory")
            (bar "Swap")
          ])
        // (with config.lib.htop;
          rightMeters [
            (text "Tasks")
            (text "LoadAverage")
            (text "Uptime")
          ]);
    };
  };
}
