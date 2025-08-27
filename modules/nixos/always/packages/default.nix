{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      acpi # For showing battery status (useful in tty)
      app2unit
      btop # New htop
      distrobox # Escape route
      efibooteditor
      git
      glib
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default # nvim nightly build
      killall
      pciutils
      unzip
      wget
    ];
  };
}
