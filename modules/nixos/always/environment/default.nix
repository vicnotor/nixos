{...}: {
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NH_FLAKE = "/home/vic/Git/vicnotor/nixos";
      TERMINAL = "ghostty";
    };
    localBinInPath = true;
    etc."nsswitch.conf".text = ''
      hosts: files dns
    '';
  };
}
