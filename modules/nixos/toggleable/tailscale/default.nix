{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    tailscaleModule.enable =
      lib.mkEnableOption "tailscale module";
  };

  config = lib.mkIf config.tailscaleModule.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };

    networking.firewall = {
      allowedTCPPorts = [22 config.services.tailscale.port];
      allowedUDPPorts = [config.services.tailscale.port];
      trustedInterfaces = ["tailscale0"];
    };

    # Prevent autostart of tailscale
    # systemd.services.tailscaled.wantedBy = lib.mkForce [];

    # Start and stop comment
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "tailscale-start" ''
        sudo systemctl start tailscaled
        sudo tailscale up
      '')
      (pkgs.writeShellScriptBin "tailscale-stop" ''
        sudo tailscale down
        sudo systemctl stop tailscaled
      '')
    ];
  };
}
