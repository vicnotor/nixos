{...}: {
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NH_FLAKE = "/home/vic/Git/vicnotor/nixos";
      GSK_RENDERER = "ngl";
    };
    localBinInPath = true;
    etc."nsswitch.conf".text = ''
      hosts: files dns
    '';
  };
}
