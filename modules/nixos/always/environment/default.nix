{...}: {
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NH_FLAKE = "/home/vic/Git/vicnotor/nixos";

      EDITOR = "nvim";
      BROWSER = "google-chrome-stable";
      TERMINAL = "ghostty";
      VISUAL = "nvim";
    };
    localBinInPath = true;
    etc."nsswitch.conf".text = ''
      hosts: files dns
    '';
  };
}
