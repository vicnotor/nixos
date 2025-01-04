{
  lib,
  config,
  inputs,
  ...
}: let
  yazi-plugins = inputs.yazi-plugins;
in {
  options = {
    yaziModule.enable =
      lib.mkEnableOption "enables Yazi module";
  };

  config = lib.mkIf config.yaziModule.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
      settings = {
        manager.show_hidden = true;
      };
      plugins = {
        smart-enter = "${yazi-plugins}/smart-enter.yazi";
        full-border = "${yazi-plugins}/full-border.yazi";
        max-preview = "${yazi-plugins}/max-preview.yazi";
        chmod = "${yazi-plugins}/chmod.yazi";
      };
      initLua = ''
        require("full-border"):setup()
        require("starship"):setup()
      '';
      keymap = {
        manager.prepend_keymap = [
          {
            on = "enter";
            run = "plugin smart-enter";
            desc = "Enter the child directory, or open the file";
          }
          {
            on = "T";
            run = "plugin max-preview";
            desc = "Maximize or restore preview";
          }
          {
            on = ["c" "m"];
            run = "plugin chmod";
            desc = "Chmod on selected files";
          }
        ];
      };
    };

    # Activate `y` command
    programs.zsh.initExtra = ''
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
  };
}
