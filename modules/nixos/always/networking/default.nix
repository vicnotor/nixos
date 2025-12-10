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
  users.users.vic.extraGroups = ["networkmanager"];
  environment.systemPackages = [pkgs.unixtools.ifconfig];
  systemd.network.wait-online.enable = false;
}
