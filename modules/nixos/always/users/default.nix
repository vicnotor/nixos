{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users.vic = {
      isNormalUser = true;
      home = "/home/vic";
      extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
      initialPassword = "password";
    };
  };
}
