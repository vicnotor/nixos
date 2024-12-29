{...}: {
  networking = {
    hostName = "nixlap";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [57621]; # For Spotify
      allowedUDPPorts = [5353]; # For Spotify
    };
  };
}
