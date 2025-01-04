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
        preview = {
          max_width = 1000;
          max_height = 1000;
        };
      };
      flavors = {
        tokyo-night = inputs.yazi-tokyo-night;
      };
      theme = {
        flavor = {
          dark = "tokyo-night";
        };
      };
      plugins = {
        smart-enter = "${yazi-plugins}/smart-enter.yazi";
        full-border = "${yazi-plugins}/full-border.yazi";
        max-preview = "${yazi-plugins}/max-preview.yazi";
        jump-to-char = "${yazi-plugins}/jump-to-char.yazi";
        chmod = "${yazi-plugins}/chmod.yazi";
      };
      initLua = ''
        require("full-border"):setup()
        -- require("starship"):setup()
      '';
      keymap = {
        manager.prepend_keymap = [
          {
            on = "q";
            run = "quit --no-cwd-file";
            desc = "Quit the process without outputting cwd-file";
          }
          {
            on = "Q";
            run = "quit";
            desc = "Quit the process";
          }
          {
            on = "<Enter>";
            run = "plugin smart-enter";
            desc = "Enter the child directory, or open the file";
          }
          {
            on = "-";
            run = "leave";
            desc = "Go back to the parent directory";
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
          {
            on = "<C-f>";
            run = "filter --smart";
            desc = "Filter";
          }
          {
            on = "f";
            run = "plugin jump-to-char";
            desc = "Jump to char";
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
