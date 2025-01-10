{...}: {
  home = {
    username = "vic";
    homeDirectory = "/home/vic";
    stateVersion = "24.11"; # NEVER CHANGE THIS!
    sessionPath = [
      "$HOME/bin"
    ];
  };
  programs.home-manager.enable = true; # Needed
}
