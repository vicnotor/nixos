{...}: {
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NH_FLAKE = "/home/vic/Git/vicnotor/nixos-xx";

      EDITOR = "nvim";
      BROWSER = "google-chrome-stable";
      TERMINAL = "ghostty";
      VISUAL = "nvim";
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
    };
    localBinInPath = true;
  };
}
