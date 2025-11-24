{
  pkgs,
  config,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    firewall = {
      allowedTCPPorts = [57621 config.services.tailscale.port]; # 57621 is for Spotify
      allowedUDPPorts = [5353 config.services.tailscale.port]; # 5353 is for Spotify
      trustedInterfaces = ["tailscale0"];
    };
    nameservers = ["100.100.100.100" "8.8.8.8" "1.1.1.1"];
  };
  environment.systemPackages = [pkgs.unixtools.ifconfig];
  services.resolved.enable = true; # https://github.com/tailscale/tailscale/issues/4254
}
