{pkgs, ...}: {
  services.resolved.enable = true; # https://github.com/tailscale/tailscale/issues/4254
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    useNetworkd = true;
    firewall = {
      allowedTCPPorts = [57621]; # For Spotify
      allowedUDPPorts = [5353]; # For Spotify
    };
  };
  environment.systemPackages = [pkgs.unixtools.ifconfig];
}
