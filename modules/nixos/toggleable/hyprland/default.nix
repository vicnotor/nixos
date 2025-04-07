{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    hyprlandModule.enable =
      lib.mkEnableOption "Hyprland module";
  };

  config = lib.mkIf config.hyprlandModule.enable {
    programs = {
      uwsm = {
        enable = true;
        waylandCompositors = {
          hyprland = {
            prettyName = "Hyprland";
            comment = "Hyprland compositor managed by UWSM";
            binPath = "/run/current-system/sw/bin/Hyprland";
          };
        };
      };
      hyprland = {
        enable = true;
        withUWSM = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
    };

    environment.systemPackages = with pkgs; [
      hyprpolkitagent # Polkit agent needed for apps that request elevated privileges
    ];

    systemd = {
      user.services.hyprpolkitagent = {
        description = "Hyprpolkitagent service";
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
