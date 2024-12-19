{ pkgs, lib, config, inputs, ... }: {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options = {
    nixvim.enable = 
      lib.mkEnableOption "enables nixvim module";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
