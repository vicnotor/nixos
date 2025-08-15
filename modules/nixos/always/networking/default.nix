{...}: {
  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [57621]; # For Spotify
      allowedUDPPorts = [5353]; # For Spotify
    };
  };
}
