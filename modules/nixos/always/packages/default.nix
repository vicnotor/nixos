{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      acpi # For showing battery status (useful in tty)
      distrobox # Escape route
      gcc # C compiler
      git
      gnumake # Make
      htop
      hyprpolkitagent # Polkit agent needed for apps that request elevated privileges
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default # nvim nightly build
      killall
      nh # Nix helper that I use to collect garbage except last couple rebuilds
      ntfs3g # Needed to mount windows drive
      ripgrep
      unzip
      wget
    ];
  };
}
