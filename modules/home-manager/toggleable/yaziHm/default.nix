{
  lib,
  config,
  pkgs,
  ...
}: let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "...";
    hash = "sha256-...";
  };
in {
  options = {
    yaziHmModule.enable =
      lib.mkEnableOption "enables Yazi home-manager module";
  };

  config = lib.mkIf config.yaziHmModule.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
      settings = {
        manager.show_hidden = true;
      };
      plugins = {
        chmod = "${yazi-plugins}/chmod.yazi";
      };
      keymap = {
        manager.prepend_keymap = [
          {
            on = ["c" "m"];
            run = "plugin chmod";
            desc = "Chmod on selected files";
          }
        ];
      };
    };
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
