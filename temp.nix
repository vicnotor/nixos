# Vergeet niet om ssh-keygen te doen en de key aan github toe te voegen en
# om te clonen via ssh!
{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    neovim
    tmux
    git
    btop
    killall
  ];

  users = {
    defaultUserShell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];

  networking.networkmanager.enable = true;
  users.users.vic.extraGroups = ["networkmanager"];

  services.xserver.xkb = {
    layout = "us";
    options = "caps:swapescape,compose:ralt";
  };
  console.useXkbConfig = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  # Tailscale setup
  services.tailscale.enable = true;
  networking.firewall.allowedTCPPorts = [22];
  services.openssh.enable = true;
  services.openssh.settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no";
  };
}
