{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    hyprland.enable =
      lib.mkEnableOption "enables hyprland module";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      # plugins = [
      #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      # ];

      # Actual Hyprland config
      settings = {
        # See https://wiki.hyprland.org/Configuring/Monitors/
        monitor = ",preferred,auto,auto";

        ###################
        ### MY PROGRAMS ###
        ###################

        # See https://wiki.hyprland.org/Configuring/Keywords/

        "$terminal" = "alacritty";
        "$fileManager" = "thunar";
        "$menu" = "rofi -show drun -show-icons -run-command 'uwsm app -- {cmd}'";
        "$menu2" = "rofi -show run -run-command 'uwsm app -- {cmd}' ";
        "$browser" = "google-chrome-stable";

        #################
        ### AUTOSTART ###
        #################
        exec-once = [
          "bash ~/Git/xxheyhey/nixos-xx/modules/home-manager/hyprland/start.sh"
        ];

        #####################
        ### LOOK AND FEEL ###
        #####################

        # Refer to https://wiki.hyprland.org/Configuring/Variables/

        # https://wiki.hyprland.org/Configuring/Variables/#general
        general = {
          gaps_in = 0;
          gaps_out = 0;

          border_size = 2;

          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          "col.active_border" = "rgba(1c3afcee) rgba(fa5b05ee) 135deg";
          "col.inactive_border" = "rgba(595959aa)";

          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false;

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false;

          layout = "dwindle";
        };
        # https://wiki.hyprland.org/Configuring/Variables/#decoration
        decoration = {
          rounding = 10;

          # Change transparency of focused and unfocused windows
          active_opacity = "1.0";
          inactive_opacity = "1.0";

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

          # https://wiki.hyprland.org/Configuring/Variables/#blur
          blur = {
            enabled = true;
            size = 3;
            passes = 4;

            vibrancy = "0.1696";
          };
        };

        # https://wiki.hyprland.org/Configuring/Variables/#animations
        animations = {
          enabled = "yes, please :)";

          # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
        };

        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        dwindle = {
          pseudotile = true; # Master switch for pseudotiling. Bound to MOD + f.
          preserve_split = true; # You probably want this
          force_split = 2;
        };

        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        master = {
          new_status = "master";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#misc
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        #############
        ### INPUT ###
        #############

        # https://wiki.hyprland.org/Configuring/Variables/#input
        input = {
          kb_layout = "us";
          kb_options = "caps:swapescape, compose:ralt";

          repeat_delay = 300;
          repeat_rate = 30;
          numlock_by_default = true;

          follow_mouse = 2;

          sensitivity = "-0.25"; # -1.0 - 1.0, 0 means no modification.
          accel_profile = "flat";
          scroll_factor = "0.7";

          touchpad = {
            disable_while_typing = false;
            natural_scroll = true;
            scroll_factor = "0.15";
          };
        };

        cursor = {
          no_warps = true;
          inactive_timeout = 7;
        };

        # https://wiki.hyprland.org/Configuring/Variables/#gestures
        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 4;
          workspace_swipe_min_fingers = true;
          workspace_swipe_distance = 100;
          workspace_swipe_min_speed_to_force = 0;
          workspace_swipe_cancel_ratio = "0.2";
          workspace_swipe_direction_lock = false;
        };

        # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
        device = {
          name = "elan0521:01-04f3:31b1-touchpad";
          sensitivity = "0.1";
        };

        ###################
        ### KEYBINDINGS ###
        ###################

        # See https://wiki.hyprland.org/Configuring/Keywords/
        "$MOD" = "ALT";
        "$MOD2" = "SUPER";

        bind =
          [
            # General
            "$MOD, Q, killactive,"
            "$MOD SHIFT, Q, exec, uwsm stop"
            "$MOD, SPACE, togglefloating,"
            "$MOD, O, togglesplit," # dwindle
            "$MOD, f, pseudo," # dwindle

            # Open programs
            "$MOD, RETURN, exec, uwsm app -- $terminal"
            "$MOD, P, exec, $menu2"

            "$MOD2, RETURN, exec, uwsm app -- $terminal"
            "$MOD2, P, exec, $menu"
            "$MOD2, B, exec, uwsm app -- $browser"
            "$MOD2, E, exec, uwsm app -- $fileManager"
            "$MOD2, S, exec, uwsm app -- spotify"
            "$MOD2, I, exec, uwsm app -- blueman-manager"
            "$MOD2, W, exec, uwsm app -- zapzap"
            "$MOD2, A, exec, uwsm app -- pavucontrol"
            "$MOD2, M, exec, uwsm app -- thunderbird"

            # Commands
            "$MOD, End, exec, busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500"
            "$MOD, B, exec, pkill -SIGUSR1 waybar"
            "$MOD SHIFT, B, exec, pkill -SIGUSR2 waybar"

            # Move focus with MOD + arrow keys
            "$MOD, H, movefocus, l"
            "$MOD, L, movefocus, r"
            "$MOD, K, movefocus, u"
            "$MOD, J, movefocus, d"

            # Move windows
            "$MOD SHIFT, H, movewindow, l"
            "$MOD SHIFT, L, movewindow, r"
            "$MOD SHIFT, K, movewindow, u"
            "$MOD SHIFT, J, movewindow, d"

            # Special scratchpad workspace
            "$MOD, grave, togglespecialworkspace, scratchpad"

            # Scroll through existing workspaces with MOD + scroll
            "$MOD, mouse_down, workspace, e+1"
            "$MOD, mouse_up, workspace, e-1"

            # Hyprexpo
            # "$MOD2, 0, hyprexpo:expo, toggle" # can be: toggle, off/disable or on/enable
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
            builtins.concatLists (builtins.genList (
                i: let
                  ws = i + 1;
                in [
                  "$MOD, code:1${toString i}, workspace, ${toString ws}"
                  "$MOD SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              10)
          );

        bindl = [
          # Laptop multimedia keys for volume and LCD brightness
          ",XF86AudioMute, exec, changeVolume mute"
          ",XF86AudioMicMute, exec, changeVolume mute"

          # Requires playerctl
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];

        bindel = [
          # Commands
          "$MOD, Prior, exec, busctl --user call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n 100"
          "$MOD, Next, exec, busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -100"

          # Laptop multimedia keys for volume and LCD brightness
          ",XF86AudioRaiseVolume, exec, changeVolume 2%+"
          ",XF86AudioLowerVolume, exec, changeVolume 2%-"
          ",XF86MonBrightnessUp, exec, brightnessctl s 400+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 400-"
        ];

        bindm = [
          # Move/resize windows with MOD + LMB/RMB and dragging
          "$MOD2, mouse:272, movewindow"
          "$MOD2, mouse:273, resizewindow"
        ];

        ##############################
        ### WINDOWS AND WORKSPACES ###
        ##############################

        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

        windowrule = [
          "opacity 0.88, ^(Alacritty)$"
        ];
        # windowrule = input.touchpad.scroll_factor 1.0, ^(Alacritty)$

        windowrulev2 = [
          "scrollmouse 1.8, class:(com.rtosta.zapzap)"

          # Ignore maximize requests from apps. You'll probably like this.
          "suppressevent maximize, class:.*"

          # Fix some dragging issues with XWayland
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

          # Special workspace rules
          "float, onworkspace:special:scratchpad"
          "bordersize 4, onworkspace:special:scratchpad"
          "size 900 700, onworkspace:special:scratchpad"
        ];

        workspace = [
          "special:scratchpad, on-created-empty:uwsm app -- $terminal"
        ];

        # Plugins
        # plugin = {
        #   hyprexpo = {
        #     columns = 3;
        #     gap_size = 5;
        #     bg_col = "rgb(111111)";
        #     workspace_method = "first 1"; # [center/first] [workspace] e.g. first 1 or center m+1
        #
        #     enable_gesture = false; # laptop touchpad
        #     gesture_fingers = 3;  # 3 or 4
        #     gesture_distance = 300; # how far is the "max"
        #     gesture_positive = true; # positive = swipe down. Negative = swipe up.
        #   };
        # };
      };
    };
  };
}
