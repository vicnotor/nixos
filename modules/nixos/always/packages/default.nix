{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      acpi # For showing battery status (useful in tty)
      btop # New htop
      distrobox # Escape route
      gcc # C compiler
      git
      gnumake # Make
      htop # Task manager of Linux
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default # nvim nightly build
      killall
      nh # Nix helper that I use to collect garbage except last couple rebuilds
      ntfs3g # Needed to mount windows drive
      ripgrep
      unzip
      wget
      inputs.yazi.packages.${pkgs.system}.default # TUI file manager
    ];
  };
}
